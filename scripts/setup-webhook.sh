#!/bin/bash
set -euo pipefail

# Setup the deploy webhook on the VPS
# Run this once on the VPS: bash scripts/setup-webhook.sh

echo "=== saminprogress webhook setup ==="

# 1. Generate a secret if not provided
CONFIG_DIR="$HOME/.config/saminprogress"
ENV_FILE="$CONFIG_DIR/webhook.env"

mkdir -p "$CONFIG_DIR"

if [ -f "$ENV_FILE" ]; then
  echo "Webhook env already exists at $ENV_FILE"
  source "$ENV_FILE"
else
  SECRET=$(openssl rand -hex 32)
  echo "WEBHOOK_SECRET=$SECRET" > "$ENV_FILE"
  chmod 600 "$ENV_FILE"
  echo "Generated webhook secret and saved to $ENV_FILE"
  echo ""
  echo "============================================"
  echo "YOUR WEBHOOK SECRET (save this!):"
  echo "$SECRET"
  echo "============================================"
  echo ""
  echo "Add this as WEBHOOK_SECRET in GitHub repo secrets:"
  echo "  https://github.com/samantafluture/saminprogress/settings/secrets/actions"
  echo ""
fi

# 2. Install systemd service
echo "Installing systemd service..."
sudo cp scripts/saminprogress-webhook.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable saminprogress-webhook
sudo systemctl start saminprogress-webhook
echo "Webhook service started"

# 3. Copy Nginx config
echo "Updating Nginx config..."
NGINX_CONF="$HOME/apps/infra/nginx/conf.d/saminprogress.conf"
cp nginx/saminprogress.conf "$NGINX_CONF"
echo "Nginx config copied to $NGINX_CONF"

# 4. Reload Nginx (via Docker)
echo "Reloading Nginx..."
docker exec infra-nginx nginx -s reload 2>/dev/null || echo "Warning: Could not reload Nginx automatically. Run: docker exec infra-nginx nginx -s reload"

echo ""
echo "=== Setup complete ==="
echo "Test with: curl -X POST -H 'X-Webhook-Secret: YOUR_SECRET' https://blog.samantafluture.com/webhook/deploy"
echo "Check logs: journalctl -u saminprogress-webhook -f"
