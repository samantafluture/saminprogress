#!/usr/bin/env node
// Lightweight deploy webhook for saminprogress
// Listens for POST /deploy with a secret token, then runs deploy-vps.sh

const http = require('node:http');
const { execFile } = require('node:child_process');
const path = require('node:path');

const fs = require('node:fs');

const SOCKET_PATH = process.env.WEBHOOK_SOCKET || '/tmp/saminprogress-webhook.sock';
const SECRET = process.env.WEBHOOK_SECRET;

if (!SECRET) {
  console.error('WEBHOOK_SECRET environment variable is required');
  process.exit(1);
}

// Clean up stale socket
if (fs.existsSync(SOCKET_PATH)) {
  fs.unlinkSync(SOCKET_PATH);
}

const PROJECT_DIR = path.resolve(__dirname, '..');
let deploying = false;

const server = http.createServer((req, res) => {
  if (req.method !== 'POST' || req.url !== '/deploy') {
    res.writeHead(404, { 'Content-Type': 'text/plain' });
    res.end('Not found');
    return;
  }

  const token = req.headers['x-webhook-secret'];
  if (token !== SECRET) {
    res.writeHead(403, { 'Content-Type': 'text/plain' });
    res.end('Forbidden');
    return;
  }

  if (deploying) {
    res.writeHead(409, { 'Content-Type': 'text/plain' });
    res.end('Deploy already in progress');
    return;
  }

  deploying = true;
  console.log(`[${new Date().toISOString()}] Deploy triggered`);

  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end('Deploy started');

  execFile('bash', ['-c', `cd ${PROJECT_DIR} && git fetch origin main && git reset --hard origin/main && git clean -fd && bash scripts/deploy-vps.sh`], {
    env: { ...process.env, PATH: `${process.env.HOME}/.volta/bin:${process.env.PATH}` },
    timeout: 120_000,
  }, (error, stdout, stderr) => {
    deploying = false;
    if (error) {
      console.error(`[${new Date().toISOString()}] Deploy failed:`, error.message);
      console.error(stderr);
    } else {
      console.log(`[${new Date().toISOString()}] Deploy succeeded`);
      console.log(stdout);
    }
  });
});

server.listen(SOCKET_PATH, () => {
  // Make socket readable by nginx (Docker runs as root)
  fs.chmodSync(SOCKET_PATH, 0o777);
  console.log(`Webhook server listening on ${SOCKET_PATH}`);
});
