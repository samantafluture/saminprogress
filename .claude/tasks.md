# Project: saminprogress

> Last synced to repo: —
> Last agent update: 2026-03-13

## Active Sprint

### P0 — Must do now

All P0 tasks completed.

### P1 — Should do this week
- [x] Connect Obsidian to Astro posts via blog-drafts workflow `[M]` #devops ✅ 2026-03-13
  - [x] Created `blog-drafts/` folder in Cherry-Tasks Obsidian vault (synced via Syncthing)
  - [x] Created draft template with frontmatter
  - [x] Updated `/publish` skill to pull drafts → copy to blog → build → deploy
  - [x] Updated dashboard.md with publishing instructions
- [x] Write first blog post `[S]` #content ✅ 2026-03-13
  - [x] "A Friday I Didn't Plan For" — live at /blog/a-friday-i-didnt-plan-for/
- [x] Create `/editor` skill for voice-consistent proofreading `[M]` #skills ✅ 2026-03-13
  - [x] Created `.claude/skills/editor.md` with voice markers and editing rules
  - [x] Tested against first blog post — light touch, approved by Sam

### P2 — Nice to have
- [ ] Design implementation (2000s CRT aesthetic) `[L]` #design
  > Separate task — will receive design brief later
- [ ] Add VPS sync script entry for saminprogress `[S]` #devops
  - [ ] Update `sync-tasks-to-repos.sh` PROJECT_MAP on VPS
  - [ ] Update `sync-tasks-from-repos.sh` PROJECT_MAP on VPS
- [ ] Search and register domain `saminprogress.dev` `[S]` #manual
  > ⚠️ Manual step — check availability, register via preferred registrar, update DNS to Hostinger VPS IP
- [ ] Switch Nginx config from `blog.samantafluture.com` to `saminprogress.dev` `[S]` #devops
  > Blocked until domain is registered
- [ ] Fix GitHub Action SSH deploy `[S]` #devops
  > GitHub Actions can't reach VPS SSH (port 22 or 8443) — times out consistently
  > Likely a Hostinger network/firewall issue (fincherry worked 5 days ago, same setup)
  > Action config is correct and ready — will work once network issue resolves
  > In the meantime, deploy locally via `bash scripts/deploy.sh` or `/publish` skill

## Blocked

## Completed (recent)
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
