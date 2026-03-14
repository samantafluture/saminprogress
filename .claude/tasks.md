# Project: saminprogress

> Last synced to repo: 2026-03-14
> Last agent update: 2026-03-14

## Active Sprint

### P0 — Must do now

All P0 tasks completed.

### P1 — Should do this week
- [ ] Finalize `saminprogress.tech` domain setup `[S]` #devops 🔴 blocked: .tech TLD NS delegation not complete yet
  - [x] DNS A record added (`@` → 187.124.67.117)
  - [x] CNAME `www` → saminprogress.tech added
  - [x] Hostinger nameservers respond correctly (ns1/ns2.dns-parking.com)
  - [ ] Certbot SSL certificate — blocked, .tech registry hasn't delegated NS to Hostinger yet
  - [ ] Update Nginx config with HTTPS for new domain
  - [ ] Update `astro.config.mjs` site URL
  > Domain registered 2026-03-14. Registry delegation can take 12-48h. Retry Certbot when ready.
  > Traffic already reaches VPS (redirects to blog.samantafluture.com on HTTP).

### P2 — Nice to have
- [ ] Remove `blog.samantafluture.com` and redirect to `saminprogress.tech` `[S]` #devops
  > Once saminprogress.tech SSL works, update Nginx to 301 redirect, then remove old DNS record

## Blocked

## Completed (recent)
- [x] Implement dark theme with toggle `[M]` #design ✅ 2026-03-14
  - [x] Solarized Dark palette, semantic CSS variables, ThemeToggle component
  - [x] localStorage + prefers-color-scheme, no flash on load
- [x] Fix GitHub Action deploy `[M]` #devops ✅ 2026-03-14
  - [x] Webhook server on VPS (user systemd service, unix socket)
  - [x] Nginx proxies /webhook/deploy to unix socket
  - [x] GitHub Action triggers webhook via curl
  - [x] WEBHOOK_SECRET set on GitHub repo
  - [x] Full CI/CD tested — push to main auto-deploys
- [x] Add VPS sync script entry for saminprogress `[S]` #devops ✅ 2026-03-14
  - [x] Updated both sync scripts on VPS, tested
- [x] Change post URL slug to match title `[S]` #content ✅ 2026-03-14
  - [x] Renamed to /blog/what-a-day-off-taught-me-about-being-a-lead-dev/
- [x] Build tag pages `[M]` #design ✅ 2026-03-14
  - [x] Dynamic pages at /blog/tag/{tag}/ — 8 tag pages generated
- [x] Implement UI design from `/design` skill spec `[L]` #design ✅ 2026-03-14
  - [x] Solarized Light palette, IBM Plex Mono + Source Serif 4
  - [x] Terminal header with prompt bar, blinking cursor, nav
  - [x] Post list with terminal-style prefixes
- [x] UI polish round 2 `[M]` #design ✅ 2026-03-14
  - [x] Centered layout (1024px), favicon, breadcrumbs, back link
  - [x] Post title 700 weight, tags at footer, responsive title (22px/28px)
  - [x] base00 darkened, post body 17px, header clickable to home
- [x] Edit the first blog post `[S]` #content ✅ 2026-03-14
  - [x] Removed all em dashes, new title, deployed
- [x] Improve `/editor` skill `[S]` #skills ✅ 2026-03-14
- [x] Create `/design` skill with full UI spec `[M]` #skills ✅ 2026-03-13
- [x] Create `/editor` skill for voice-consistent proofreading `[M]` #skills ✅ 2026-03-13
- [x] Connect Obsidian to Astro posts via blog-drafts workflow `[M]` #devops ✅ 2026-03-13
- [x] Write first blog post `[S]` #content ✅ 2026-03-13
- [x] Scaffold Astro project with blog template (pnpm) `[S]` #setup ✅ 2026-03-13
- [x] Initialize git repo + GitHub remote `[S]` #setup ✅ 2026-03-13
- [x] Configure Nginx on VPS for `blog.samantafluture.com` `[M]` #devops ✅ 2026-03-13
- [x] Set up deploy pipeline (local + CI) `[M]` #devops ✅ 2026-03-13
- [x] Install Volta + Node 22 + pnpm on VPS `[S]` #devops ✅ 2026-03-13
- [x] Clone repo on VPS `[S]` #devops ✅ 2026-03-13
- [x] Pin Node 22 via Volta `[S]` #setup ✅ 2026-03-13

## Notes
- Check CLAUDE.md for architectural decisions before starting work
- This is a static site — no runtime, no database, no backend
- Posts are markdown with frontmatter (title, date, tags, description)
- VPS IP: 187.124.67.117, SSH user: sam, SSH ports: 22 and 8443
- Nginx config: ~/apps/infra/nginx/conf.d/saminprogress.conf
- Docker volume: saminprogress_web (mounted at /usr/share/nginx/saminprogress/)
- VPS repo: ~/apps/saminprogress/
- Webhook: user systemd service, unix socket at /tmp/saminprogress-webhook.sock
- Skills: /publish, /editor, /design
