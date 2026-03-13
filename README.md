# saminprogress

Personal blog by Sam. Built with Astro, deployed on Nginx.

**URL:** blog.samantafluture.com (future: saminprogress.dev)

## Dev

```bash
pnpm install
pnpm dev
```

## Deploy

```bash
pnpm build
rsync -avz --delete dist/ sam@vps:/var/www/saminprogress/
```
