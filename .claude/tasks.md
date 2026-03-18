# Project: saminprogress

> Last synced to repo: 2026-03-18T19:35:01+00:00
> Last agent update: 2026-03-14

## Active Sprint

### P0 — Must do now
All P0 tasks completed.
- [ ] Create a home with a summary on myself and the site plus contact info
- [ ] Create feat to lock posts from writing that I want under pay wall like Substack

### P1 — Should do this week

### P2 — Nice to have

## Blocked
- [ ] Finalize `saminprogress.tech` domain setup `[S]` #devops 🔴 blocked: .tech TLD NS delegation not complete yet
  - [x] DNS A record added (`@` → 187.124.67.117)
  - [x] CNAME `www` → saminprogress.tech added
  - [x] Hostinger nameservers respond correctly (ns1/ns2.dns-parking.com)
  - [ ] Certbot SSL certificate — blocked, .tech registry hasn't delegated NS to Hostinger yet
  - [ ] Update Nginx config with HTTPS for new domain
  - [ ] Update `astro.config.mjs` site URL
  > Domain registered 2026-03-14. Registry delegation can take 12-48h. Retry Certbot when ready.
  > Traffic already reaches VPS (redirects to blog.samantafluture.com on HTTP).
- [ ] Make sure all Sam's domains go to same place now

## Completed (recent)
- [x] Create projects page with github content ✅ 2026-03-18
- [x] Create about page with linkedin content ✅ 2026-03-16
- [x] Accessibility fixes — Phase 3: Moderate (polish) `[S]` #a11y ✅ 2026-03-16
  - [x] Add `prefers-reduced-motion` support for animations
  - [x] Improve theme toggle assistive tech (dynamic aria-label)
  - [x] Upgrade breadcrumb semantics (`<ol>`, `aria-label`, `aria-current`)
  - [x] Add `aria-label` with post title to "read more" links
  > Plan: .claude/accessibility-plan.md — Phase 3
  > Agent: reduced-motion media query kills all animations/transitions, toggle label updates dynamically, breadcrumbs use ol/li with aria-label + aria-current, read-more includes post title
- [x] Accessibility fixes — Phase 2: High (navigation + structure) `[M]` #a11y ✅ 2026-03-16
  - [x] Add skip-to-content link in BaseLayout
  - [x] Add `heroImageAlt` field to content schema + use in BlogPost
  - [x] Fix heading hierarchy (hidden h1 in post content)
  > Plan: .claude/accessibility-plan.md — Phase 2
  > Agent: skip-link (visible on focus, yellow bar), heroImageAlt in schema + layout, sr-only clip instead of display:none for duplicate h1
- [x] Accessibility fixes — Phase 1: Critical (focus + contrast) `[M]` #a11y ✅ 2026-03-16
  - [x] Add `:focus-visible` styles to all interactive elements (links, buttons, tags, nav)
  - [x] Fix dark theme contrast — `--fg-faint` and `--fg-muted` values
  - [x] Fix light theme contrast — `--fg-faint`, `--fg-muted`, and `--cyan` link color
  - [x] Add `aria-hidden="true"` to decorative symbols (`/`, `#`, `>`, `←`, `~$`, `./`)
  > Plan: .claude/accessibility-plan.md — Phase 1
  > Agent: global focus-visible outline (yellow, 2px), adjusted 6 color variables across both themes, aria-hidden on all decorative symbols in 5 files
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
