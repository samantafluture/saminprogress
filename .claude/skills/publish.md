---
name: publish
description: Publish blog drafts from Obsidian and deploy to production
user_invocable: true
---

Publish saminprogress to production. This handles the full pipeline: drafts → blog → build → deploy.

## Step 1: Check for new drafts in Obsidian

Look for `.md` files in `/mnt/c/Users/saman/Obsidian/Cherry-Tasks/blog-drafts/`.

For each file found:
- Read the file and check if it has valid frontmatter (title, description, date, tags, draft)
- If frontmatter is missing, add it based on the filename and current date
- Show the user a summary of drafts found and ask which ones to publish
- Copy approved drafts to `src/content/blog/` in the project
- Do NOT delete the original from `blog-drafts/` — rename it with a `.published` suffix so it's clear it was already published

If no drafts are found, skip to step 2.

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
