# CLAUDE.md — saminprogress

This file is the single source of truth for AI agents working on saminprogress.
Read it completely before writing any code.

---

## 1. What is saminprogress?

A personal blog by Sam. Written in first person, warm and honest tone — like talking
to a friend about dev life. Think 2000s personal blog, not a polished content platform.

---

## 2. Technology Stack

| Layer     | Technology                          |
| --------- | ----------------------------------- |
| Framework | Astro (static output)               |
| Language  | TypeScript (strict mode)            |
| Package   | pnpm                                |
| Content   | Markdown with frontmatter           |
| Hosting   | Hostinger KVM1 VPS, Nginx, Certbot  |
| Deploy    | `pnpm build` + rsync to VPS         |

No runtime. No database. No backend. Nginx serves the built `dist/` directory.

---

## 3. URLs

- **Primary:** `saminprogress.tech`
- **Legacy (redirects):** `blog.samantafluture.com` → `saminprogress.tech`

---

## 4. Project Structure

```
src/
├── content/
│   ├── blog/           ← published posts (Astro content collection)
│   └── config.ts       ← content collection schema
├── drafts/
│   ├── ideas.md        ← running idea list
│   └── *.md            ← work-in-progress drafts (status: draft | edited)
├── layouts/
├── pages/
├── components/
└── styles/
```

---

## 5. Post Format

Published posts live in `src/content/blog/` as `.md` files with this frontmatter:

```yaml
---
title: "Post Title"
description: "One-line description"
date: 2026-03-13
tags: ["dev", "life"]
draft: false
substack: "https://samantafluture.substack.com/p/slug"  # optional — locks post, links to Substack
---
```

Posts with a `substack` URL appear in listings but link to Substack instead of generating a local page.

Drafts in `src/drafts/` use the same format plus a `status` field:

```yaml
---
title: "Post Title"
description: "One-line description"
date: 2026-03-13
tags: ["dev", "life"]
status: draft
---
```

---

## 6. Visual Direction

- **Aesthetic:** 2000s personal blog, CRT monitor feel
- **Palette:** off-white/warm cream background, phosphor green or amber accent
- **Typography:** pixel/monospace font for headings, readable sans-serif for body
- **Texture:** subtle scanline overlay or CRT curvature effect
- **Layout:** dead simple — header, post list, post page, footer. No sidebar bloat.

---

## 7. Tone & Voice

- First person, written like I talk
- Personal journal about lead dev life
- Honest and warm, not performative
- No corporate jargon, no "10x" nonsense
- Okay to be vulnerable, funny, or frustrated

---

## 8. Deploy

```bash
bash scripts/deploy.sh   # Build + upload + copy into Docker volume
```

Nginx serves from Docker volume `saminprogress_web` mounted at `/usr/share/nginx/saminprogress/`.

---

## 9. Blog Pipeline

The blog has three Claude Code skills that form a pipeline:

```
/writer → /editor → /publish
```

1. **Writer** (`/writer`) — Brainstorm conversationally, draft the post, save to `src/drafts/`
2. **Editor** (`/editor`) — Polish prose, check tone, preserve voice
3. **Publisher** (`/publish`) — Move from `src/drafts/` to `src/content/blog/`, build, deploy

### Draft lifecycle

Drafts live in `src/drafts/` with a `status` frontmatter field:
- `status: draft` — fresh from the writer skill
- `status: edited` — been through the editor skill, ready to publish

### Quick idea capture

Say `blog idea: <text>` and the writer skill saves it to `src/drafts/ideas.md`.

### Legacy: Obsidian

The publisher skill still checks `/mnt/c/Users/saman/Obsidian/Cherry-Tasks/blog-drafts/`
as a fallback, but the primary workflow is now fully within Claude Code and the repo.

---

## 10. Skills

- **Writer skill:** conversational brainstorming and drafting
- **Editor skill:** voice-consistent proofreading (matches Sam's tone)
- **Publisher skill:** build and deploy pipeline
- **Designer skill:** UI implementation from design brief (not yet implemented)

---

## 11. Task Management

- Tasks are tracked in `.claude/tasks.md` in this repo
- Before starting work, read `.claude/tasks.md` to understand current priorities
- After completing a task, mark it `[x]` with ✅ and today's date
- When a task is complex, break it into subtasks (indented 2 spaces)
- Add a blockquote note when you create or modify tasks: `> Agent: <what you did>`
- Move completed tasks to the "Completed (recent)" section
- Never delete tasks — only move them to Completed or archive
- Respect priority order: finish all P0 before starting P1
- If blocked, move task to "Blocked" section with 🔴 and reason

### Task format reference
- `- [ ] Task description \`[S|M|L]\` #tag` — new task
- `- [/] Task description \`[M]\` #tag ⏳ in-progress` — working on it
- `- [x] Task description \`[S]\` #tag ✅ YYYY-MM-DD` — done
- `- [ ] Task description \`[M]\` #tag 🔴 blocked: reason` — blocked
- Subtasks: indent 2 spaces under parent task

---

## 12. Commands

```bash
pnpm install             # Install dependencies
pnpm dev                 # Start dev server
pnpm build               # Build static site
pnpm preview             # Preview production build locally
```
