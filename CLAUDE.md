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

- **Current:** `blog.samantafluture.com`
- **Future:** `saminprogress.dev` (once domain is registered)

---

## 4. Project Structure

```
src/
├── content/
│   ├── blog/           ← markdown posts (synced via Syncthing)
│   └── config.ts       ← content collection schema
├── layouts/
├── pages/
├── components/
└── styles/
```

---

## 5. Post Format

Posts live in `src/content/blog/` as `.md` files with this frontmatter:

```yaml
---
title: "Post Title"
description: "One-line description"
date: 2026-03-13
tags: ["dev", "life"]
draft: false
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
pnpm build              # Build static site to dist/
rsync -avz --delete dist/ sam@vps:/var/www/saminprogress/
```

Nginx serves from `/var/www/saminprogress/`.

---

## 9. Obsidian Sync

Blog posts folder (`src/content/blog/`) is shared via Syncthing so posts
can be drafted on Android via Obsidian and appear in the Astro project.

---

## 10. Future Skills (not yet implemented)

- **Editor skill:** voice-consistent proofreading (matches Sam's tone)
- **Publisher skill:** automate post pipeline (build + deploy on new post)
- **Designer skill:** UI implementation from design brief

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
