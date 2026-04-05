# saminprogress

Personal blog by Sam. First person, warm, honest — like talking to a friend about dev life. 2000s personal blog aesthetic, not a polished content platform.

**Live:** `saminprogress.tech`

## Stack

Astro (static), TypeScript (strict), pnpm, Markdown content collections. No runtime, no database, no backend.

## Structure

```
src/
  content/blog/          # Published posts (Astro content collection)
  content/config.ts      # Collection schema
  drafts/
    ideas.md             # Running idea list
    *.md                 # WIP drafts (status: draft | edited)
  layouts/
  pages/
  components/
  styles/
scripts/deploy.sh        # Build + rsync to VPS
```

## Commands

```bash
pnpm dev       # Dev server
pnpm build     # Build static site
pnpm preview   # Preview production build
bash scripts/deploy.sh  # Deploy to VPS
```

## Post Format

Published posts in `src/content/blog/*.md`:
```yaml
title: "Post Title"
description: "One-line description"
date: 2026-03-13
tags: ["dev", "life"]
draft: false
substack: "https://..."  # optional — locks post, links to Substack instead
```

Drafts in `src/drafts/*.md` add `status: draft | edited`.

## Blog Pipeline

```
/writer -> /editor -> /publish
```

- **Writer** — brainstorm conversationally, save draft to `src/drafts/`
- **Editor** — polish prose, check tone, preserve voice
- **Publisher** — move draft to `src/content/blog/`, build, deploy

Quick idea capture: say `blog idea: <text>` to save to `src/drafts/ideas.md`.

## Deploy

Nginx on VPS serves from Docker volume `saminprogress_web`. `bash scripts/deploy.sh`.

## Visual Direction

2000s CRT aesthetic. Off-white/cream background, phosphor green/amber accent. Pixel/monospace headings, readable sans-serif body. Subtle scanline/CRT effects.

## Voice

First person, personal journal. Honest, warm, not performative. No corporate jargon. OK to be vulnerable, funny, frustrated.
