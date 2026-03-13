# Project: saminprogress

> Last synced to repo: —
> Last agent update: —

## Active Sprint

### P0 — Must do now
- [x] Scaffold Astro project with blog template (pnpm) `[S]` #setup ✅ 2026-03-13
  - [x] Install Astro with mdx, rss, sitemap plugins
  - [x] Enable TypeScript strict mode
  - [x] Create CLAUDE.md and README.md
  - [x] Set up content collection schema and blog layouts
- [ ] Initialize git repo `[S]` #setup
- [ ] Configure Nginx on VPS for `blog.samantafluture.com` `[M]` #devops
  - [ ] Create Nginx server block for subdomain
  - [ ] Run Certbot for SSL certificate
  - [ ] Create `/var/www/saminprogress/` directory
  - [ ] Test with placeholder index.html

### P1 — Should do this week
- [ ] Set up deploy pipeline (local → VPS) `[M]` #devops
  - [ ] Write rsync deploy script (`pnpm build` + rsync `dist/` to VPS)
  - [ ] Test full build-deploy cycle
- [ ] Connect Obsidian to Astro posts folder via Syncthing `[M]` #devops
  - [ ] Add `src/content/blog/` as Syncthing shared folder
  - [ ] Test: write post on Android → appears in Astro project
- [ ] Search and register domain `saminprogress.dev` `[S]` #manual
  > ⚠️ Manual step — check availability, register via preferred registrar, update DNS to Hostinger VPS IP
- [ ] Write first blog post `[S]` #content
  > Waiting for content from Sam

### P2 — Nice to have
- [ ] Design implementation (2000s CRT aesthetic) `[L]` #design
  > Separate task — will receive design brief later
- [ ] Add VPS sync script entry for saminprogress `[S]` #devops
  - [ ] Update `sync-tasks-to-repos.sh` PROJECT_MAP on VPS
  - [ ] Update `sync-tasks-from-repos.sh` PROJECT_MAP on VPS
- [ ] Switch Nginx config from `blog.samantafluture.com` to `saminprogress.dev` `[S]` #devops
  > Blocked until domain is registered

## Blocked

## Completed (recent)

## Notes
- Check CLAUDE.md for architectural decisions before starting work
- This is a static site — no runtime, no database, no backend
- Posts are markdown with frontmatter (title, date, tags, description)
- Agent should check CLAUDE.md before starting any P0 task
