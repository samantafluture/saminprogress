# Project: saminprogress

> Last synced to repo: —
> Last agent update: 2026-03-14

## Active Sprint

### P0 — Must do now

All P0 tasks completed.

### P1 — Should do this week
- [ ] Finalize `saminprogress.tech` domain setup `[S]` #devops 🔴 blocked: .tech TLD NS delegation not complete yet
  - [x] DNS A record added (resolves via Google/Cloudflare DNS)
  - [x] CNAME www → saminprogress.tech added
  - [ ] Certbot SSL certificate — blocked, Let's Encrypt secondary validators return NXDOMAIN
  - [ ] Update Nginx config with HTTPS for new domain
  - [ ] Update `astro.config.mjs` site URL
  > .tech TLD registry hasn't delegated NS records yet. Can take up to 24-48h for new domains. Retry Certbot later.

### P2 — Nice to have
- [ ] Add VPS sync script entry for saminprogress `[S]` #devops
  - [ ] Update `sync-tasks-to-repos.sh` PROJECT_MAP on VPS
  - [ ] Update `sync-tasks-from-repos.sh` PROJECT_MAP on VPS
- [ ] Search and register domain `saminprogress.dev` `[S]` #manual
  > ⚠️ Manual step — check availability, register via preferred registrar, update DNS to Hostinger VPS IP
- [ ] Switch Nginx config from `blog.samantafluture.com` to `saminprogress.dev` `[S]` #devops
  > Blocked until domain is registered
- [ ] Remove `blog.samantafluture.com` and redirect to `saminprogress.tech` `[S]` #devops
  > Once saminprogress.tech is fully working with SSL, update Nginx to 301 redirect blog.samantafluture.com → saminprogress.tech, then remove the old DNS record
- [/] Fix GitHub Action deploy `[M]` #devops ⏳ in-progress
  > Root cause: Hostinger blocks SSH from cloud/datacenter IPs (GitHub Actions, Claude Code)
  > Solution: Replaced SSH-based deploy with webhook-based deploy
  > Agent: Created webhook server, systemd service, Nginx route, updated GitHub Action (2026-03-14)
  - [x] Created `scripts/webhook-server.js` — Node.js HTTP server with secret token auth
  - [x] Created `scripts/saminprogress-webhook.service` — systemd unit file
  - [x] Updated `nginx/saminprogress.conf` — added `/webhook/deploy` proxy route
  - [x] Updated `.github/workflows/deploy.yml` — uses `curl` instead of SSH
  - [x] Created `scripts/setup-webhook.sh` — one-command VPS setup
  - [ ] Run `bash scripts/setup-webhook.sh` on VPS (manual step)
  - [ ] Add `WEBHOOK_SECRET` to GitHub repo secrets

## Blocked

## Completed (recent)
- [x] Change post URL slug to match title `[S]` #content ✅ 2026-03-14
  - [x] Renamed to /blog/what-a-day-off-taught-me-about-being-a-lead-dev/
- [x] Build tag pages `[M]` #design ✅ 2026-03-14
  - [x] Dynamic pages at /blog/tag/{tag}/ with grep-style terminal label
  - [x] Breadcrumbs, filtered post list per tag
  - [x] 8 tag pages generated
- [x] Implement UI design from `/design` skill spec `[L]` #design ✅ 2026-03-14
  - [x] Solarized Light palette, IBM Plex Mono + Source Serif 4
  - [x] Terminal header with prompt bar, blinking cursor, nav
  - [x] Post list with terminal-style prefixes
- [x] UI polish round 2 `[M]` #design ✅ 2026-03-14
  - [x] Centered layout (1024px max-width, margin: 0 auto)
  - [x] Header content centered, prompt bar contained at same max-width
  - [x] Rocket emoji for dev branch, pushpin for montreal
  - [x] Favicon: construction emoji
  - [x] Post title font-weight 700, tighter word spacing
  - [x] Tags cursor pointer, linked to tag pages
  - [x] Post page: removed duplicate h1, tags at footer, breadcrumbs, back link
  - [x] Post body 17px, base00 darkened for readability
  - [x] saminprogress header clickable to home
- [x] Edit the first blog post `[S]` #content ✅ 2026-03-14
  - [x] Removed all em dashes (10 occurrences)
  - [x] New title: "What A Day Off Taught Me About Being a Lead Dev"
  - [x] Deployed
- [x] Improve `/editor` skill `[S]` #skills ✅ 2026-03-14
  - [x] Added rule: posts should never use em dashes
- [x] Create `/design` skill with full UI spec `[M]` #skills ✅ 2026-03-13
  - [x] Solarized Light terminal theme, IBM Plex Mono + Source Serif 4
  - [x] Header, post list, typography scale, color palette fully specced
- [x] Create `/editor` skill for voice-consistent proofreading `[M]` #skills ✅ 2026-03-13
  - [x] Created `.claude/skills/editor.md` with voice markers and editing rules
  - [x] Tested against first blog post — light touch, approved by Sam
- [x] Connect Obsidian to Astro posts via blog-drafts workflow `[M]` #devops ✅ 2026-03-13
  - [x] Created `blog-drafts/` in Cherry-Tasks vault (Windows path, synced via Syncthing)
  - [x] Updated `/publish` skill to pull drafts → copy to blog → build → deploy
- [x] Write first blog post `[S]` #content ✅ 2026-03-13
  - [x] "A Friday I Didn't Plan For" — live at /blog/a-friday-i-didnt-plan-for/
- [x] Scaffold Astro project with blog template (pnpm) `[S]` #setup ✅ 2026-03-13
  - [x] Install Astro with mdx, rss, sitemap plugins
  - [x] Enable TypeScript strict mode
  - [x] Create CLAUDE.md and README.md
  - [x] Set up content collection schema and blog layouts
- [x] Initialize git repo + GitHub remote (main branch) `[S]` #setup ✅ 2026-03-13
  - [x] Repo: github.com/samantafluture/saminprogress (public)
  - [x] Default branch: main
- [x] Configure Nginx on VPS for `blog.samantafluture.com` `[M]` #devops ✅ 2026-03-13
  - [x] Create Nginx server block for subdomain (HTTPS + security headers)
  - [x] Run Certbot for SSL certificate (expires 2026-06-11)
  - [x] Create `saminprogress_web` Docker volume + mount in infra-nginx
  - [x] Test full deploy — site live at https://blog.samantafluture.com
- [x] Set up deploy pipeline (local → VPS) `[M]` #devops ✅ 2026-03-13
  - [x] `scripts/deploy.sh` — local deploy (pnpm build + rsync + Docker volume copy)
  - [x] `scripts/deploy-vps.sh` — VPS-side deploy (used by CI)
  - [x] `/publish` Claude Code skill created
  - [x] GitHub Action `.github/workflows/deploy.yml` created (build passes, SSH blocked — see P2)
- [x] Install Volta + Node 22 + pnpm on VPS `[S]` #devops ✅ 2026-03-13
- [x] Clone repo on VPS at `~/apps/saminprogress/` `[S]` #devops ✅ 2026-03-13
- [x] Pin Node 22 via Volta in package.json `[S]` #setup ✅ 2026-03-13
- [x] Set `VPS_SSH_KEY` secret on GitHub repo `[S]` #devops ✅ 2026-03-13

## Notes
- Check CLAUDE.md for architectural decisions before starting work
- This is a static site — no runtime, no database, no backend
- Posts are markdown with frontmatter (title, date, tags, description)
- Agent should check CLAUDE.md before starting any P0 task
- VPS IP: 187.124.67.117, SSH user: sam, SSH ports: 22 and 8443
- Nginx config: ~/apps/infra/nginx/conf.d/saminprogress.conf
- Docker volume: saminprogress_web (mounted at /usr/share/nginx/saminprogress/)
- VPS repo: ~/apps/saminprogress/
