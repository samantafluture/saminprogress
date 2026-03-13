#!/bin/bash
set -euo pipefail

# Deploy saminprogress on VPS (called by GitHub Actions or manually on VPS)
# Builds the site on VPS and copies into the Docker volume

export PATH="$HOME/.volta/bin:$PATH"

echo "Installing dependencies..."
pnpm install --frozen-lockfile

echo "Building static site..."
pnpm build

echo "Copying into Docker volume..."
docker run --rm \
  -v saminprogress_web:/data \
  -v "$(pwd)/dist":/src:ro \
  alpine sh -c 'rm -rf /data/* && cp -r /src/* /data/'

echo "Deploy complete! https://blog.samantafluture.com"
