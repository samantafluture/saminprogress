---
name: publish
description: Build and deploy the blog to production
user_invocable: true
---

Deploy saminprogress to production.

Steps:
1. Run `pnpm build` to build the static site
2. Upload `dist/` to VPS via rsync to `/tmp/saminprogress-dist/`
3. Copy into Docker volume via: `docker run --rm -v saminprogress_web:/data -v /tmp/saminprogress-dist:/src:ro alpine sh -c 'rm -rf /data/* && cp -r /src/* /data/'`
4. Clean up temp dir on VPS
5. Verify the site is live by curling `https://blog.samantafluture.com`

Use this command sequence:
```bash
pnpm build
rsync -avz --delete dist/ sam@187.124.67.117:/tmp/saminprogress-dist/
ssh sam@187.124.67.117 "docker run --rm -v saminprogress_web:/data -v /tmp/saminprogress-dist:/src:ro alpine sh -c 'rm -rf /data/* && cp -r /src/* /data/' && rm -rf /tmp/saminprogress-dist"
curl -sI https://blog.samantafluture.com | head -5
```

Report the HTTP status code to confirm success.
