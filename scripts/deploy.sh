#!/bin/bash
set -euo pipefail

# Deploy saminprogress to VPS
# Usage: bash scripts/deploy.sh

VPS="sam@187.124.67.117"

echo "Building static site..."
pnpm build

echo "Uploading dist/ to VPS..."
rsync -avz --delete dist/ "$VPS":/tmp/saminprogress-dist/

echo "Copying into Docker volume..."
ssh "$VPS" "docker run --rm -v saminprogress_web:/data -v /tmp/saminprogress-dist:/src:ro alpine sh -c 'rm -rf /data/* && cp -r /src/* /data/' && rm -rf /tmp/saminprogress-dist"

echo "Deploy complete! https://blog.samantafluture.com"
