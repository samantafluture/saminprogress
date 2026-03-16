---
name: publish
description: Publish blog drafts and deploy to production
user_invocable: true
---

Publish saminprogress to production. This handles the full pipeline: drafts → blog → build → deploy.

## Step 1: Check for drafts ready to publish

Check `src/drafts/` for `.md` files (excluding `ideas.md`).

For each draft found:
- Read the file and check frontmatter
- Show drafts with `status: edited` first (these have been through the editor skill)
- Also show drafts with `status: draft` but note they haven't been edited yet
- Ask which ones to publish
- Move approved drafts to `src/content/blog/` in the project
- Update frontmatter: remove `status` field, set `draft: false`
- Delete the file from `src/drafts/` (it now lives in `src/content/blog/`)

If the user says "publish <slug>", find and publish that specific draft.

If no drafts are found in `src/drafts/`, also check the legacy Obsidian location at `/mnt/c/Users/saman/Obsidian/Cherry-Tasks/blog-drafts/` as a fallback. For Obsidian drafts, rename with `.published` suffix after copying.

If no drafts are found anywhere, skip to step 2.

## Step 2: Build

```bash
pnpm build
```

If the build fails, report the error and stop.

## Step 3: Deploy to VPS

```bash
rsync -avz --delete dist/ sam@187.124.67.117:/tmp/saminprogress-dist/
ssh sam@187.124.67.117 "docker run --rm -v saminprogress_web:/data -v /tmp/saminprogress-dist:/src:ro alpine sh -c 'rm -rf /data/* && cp -r /src/* /data/' && rm -rf /tmp/saminprogress-dist"
```

## Step 4: Verify

```bash
curl -sI https://blog.samantafluture.com | head -5
```

Report the HTTP status code to confirm success.

## Post frontmatter template

If a draft is missing frontmatter, use this template:

```yaml
---
title: "Title from filename"
description: ""
date: YYYY-MM-DD
tags: []
draft: false
---
```

Ask the user to fill in the description and tags before publishing.
