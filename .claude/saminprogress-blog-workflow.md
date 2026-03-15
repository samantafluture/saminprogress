# saminprogress Blog — Workflow & Writer Skill

## Overview

This document defines the end-to-end blog workflow for saminprogress, from idea to published post. The key change from the previous workflow is eliminating Obsidian as a middleman and moving the entire process into Claude Code, including the brainstorming/writing phase.

The blog has three Claude Code skills that form a pipeline:
1. **Writer** (new) — Brainstorm and draft the post
2. **Editor** — Polish, refine, check tone and structure
3. **Publisher** — Build and deploy to production

### Previous Workflow (Eliminated)
```
claude.ai (brainstorm) → copy-paste → Obsidian (parking) → tell Claude Code →
Claude Code editor → Claude Code publish
```

### New Workflow
```
Claude Code writer → Claude Code editor → Claude Code publish
```

Zero copy-paste. One tool. One session if you want.

---

## Blog Identity

**Blog:** saminprogress
**URL:** blog.samantafluture.com (moving to saminprogress.dev)
**Stack:** Astro + TypeScript + pnpm
**Aesthetic:** 2000s CRT (phosphor green/amber, monospace headings)
**Tagline:** personal journal · lead dev life · things i'm building

### Voice & Tone

Sam's writing voice is:
- **Casual and warm** — like talking to a friend, not performing for an audience
- **Honest and reflective** — sits with uncomfortable feelings, doesn't skip to the lesson
- **Structured but flowing** — uses section breaks (`---`) to shift between moments, not rigid headers
- **Personal first, technical second** — even technical topics come through the lens of personal experience
- **Present-tense storytelling** — pulls the reader into the moment ("By 9am I was already checking Teams")
- **Short declarative sentences mixed with longer reflective ones** — creates rhythm
- **Ends with a quiet landing** — no big inspirational takeaway, just an honest closing thought

### What the blog is NOT:
- Not a tutorial site
- Not LinkedIn thought leadership
- Not "10 things I learned" listicles
- Not performatively vulnerable — the honesty is real, not a content strategy

### Typical Post Profile
- **Length:** 1500+ words, exploratory
- **Topics:** Reflections on work (lead dev life, team dynamics, incidents), building personal projects, figuring things out in public, the intersection of personal growth and technical work
- **Structure:** Narrative arc with section breaks. Starts with a specific moment, explores what it brought up, lands somewhere honest.

---

## Writer Skill Specification

### Purpose

The Writer skill guides Claude Code through a brainstorming conversation with Sam, captures his ideas and voice, and produces a draft saved to the blog repo. It replaces the claude.ai brainstorming step entirely.

### Skill Location

```
.claude/skills/writer/SKILL.md
```

(Lives in the blog repo, since it's specific to saminprogress.)

### How It Works

When Sam says something like "let's write a post" or "I have an idea for a blog post" or "writer skill," Claude Code enters writer mode. This is a **conversational, multi-turn process** — not a one-shot generation.

### Writer Mode Stages

#### Stage 1: Explore

The goal is to understand what Sam wants to write about. Claude Code asks open-ended questions and lets Sam ramble. This is the brainstorm.

Prompts Claude Code might use:
- "What's on your mind? What happened or what are you thinking about?"
- "What made this stick with you?"
- "Is there a specific moment that captures this?"
- "Who would you be telling this to over coffee?"

**Rules for this stage:**
- Let Sam talk. Don't rush to structure.
- Ask one question at a time, not a list.
- Reflect back what you're hearing to make sure you've got it: "So the core of this is about [X], and the moment that crystallized it was [Y]?"
- This stage might take 3-8 exchanges. That's fine.
- If Sam gives you a clear, fleshed-out idea immediately, you can move faster. Match his energy.

#### Stage 2: Shape

Once the idea is clear, Claude Code proposes a loose structure. Not an outline — more like the emotional arc.

Example:
```
Here's how I see this flowing:

- Open with that moment at BAnQ when you realized the sync was broken again
- Dig into why this keeps happening — the pattern of building systems
  that work for desktop-you but not mobile-you
- The realization that the tool isn't the problem, the workflow is
- Land on what you're doing about it, without making it a tutorial

Does that feel right, or should we shift something?
```

**Rules for this stage:**
- Propose, don't prescribe. Sam might redirect.
- Think in narrative beats, not section headers.
- Keep it to 4-6 beats max. Sam's posts flow, they don't march through an outline.
- One exchange is usually enough here. Two if the structure needs adjusting.

#### Stage 3: Write

Claude Code writes the full draft in Sam's voice, using the explored ideas and agreed shape.

**Rules for this stage:**
- Write the whole draft in one go.
- Use section breaks (`---`) not headers for structure.
- Match Sam's voice: short declarative sentences mixed with reflective longer ones.
- Start with a specific moment, not a thesis.
- End with a quiet landing — no inspirational bow-tie.
- Don't over-explain. Trust the reader.
- No emoji in the post body.
- Include frontmatter for Astro (title, date, tags, description).

After writing, Claude Code shows the draft and asks:
- "How does this feel? Anything that doesn't sound like you?"
- "Any part you want me to push deeper on or cut?"

#### Stage 4: Save

Once Sam approves (or after revisions), Claude Code saves the draft:

```
src/drafts/<slug>.md
```

The filename slug is derived from the title (lowercase, hyphenated).

Claude Code then:
1. Saves the file
2. Commits with message: `draft: <post-title>`
3. Pushes to GitHub
4. Tells Sam: "Draft saved. Say 'edit and publish' when you're ready, or come back to it later."

### Draft Frontmatter Format

```yaml
---
title: "What A Day Off Taught Me About Being a Lead Dev"
date: 2026-03-13
tags: ["lead-dev", "personal", "reflection", "growth"]
description: "A day off that turned into an anxiety spiral, a team incident, and somehow the first post of a new blog."
status: draft
---
```

The `status: draft` field lets the editor and publisher skills know this hasn't been through the pipeline yet.

---

## Full Pipeline

### Step 1: Write (Writer Skill)

```
Sam: "let's write a post"
Claude Code: [enters writer mode, brainstorms, drafts, saves to src/drafts/]
```

### Step 2: Edit (Editor Skill)

```
Sam: "edit the latest draft" or "edit <slug>"
Claude Code: [runs editor skill on the draft, refines prose, checks tone, 
             updates status to 'edited', saves]
```

### Step 3: Publish (Publisher Skill)

```
Sam: "publish it" or "publish <slug>"
Claude Code: [moves from src/drafts/ to src/content/blog/ (or wherever Astro
             expects it), updates status to 'published', builds, deploys]
```

### One-Session Flow

If Sam wants to go all the way through in one sitting:

```
Sam: "let's write and publish a post"
Claude Code: [writer → editor → publisher, with approval gates between each]
```

### Resumable Flow

If Sam starts a draft on mobile and wants to finish later on desktop:

1. Mobile: Writer skill → draft saved and pushed to GitHub
2. Desktop: "edit and publish the latest draft" → Claude Code picks up where it left off

This works because the draft is in the repo, not in a conversation context.

---

## Mobile Workflow

On the Pixel, Claude Code can't SSH to the VPS. The mobile flow:

1. Open Claude Code mobile
2. "Let's write a post about [topic]" — writer skill kicks in
3. Brainstorm conversationally (this works fine in Claude Code mobile)
4. Draft is saved to `src/drafts/` and pushed to GitHub
5. **Option A:** Continue to edit + publish from mobile (Claude Code works through GitHub)
6. **Option B:** Leave the draft, pick it up on desktop later via SSH

The key insight: the brainstorming conversation doesn't need a nice UI. It's just talking. Claude Code's terminal interface is fine for this. The draft file is what matters, and that lives in Git.

---

## Idea Capture (Quick Mode)

Sometimes Sam isn't ready to write a full post but has an idea worth saving. For this, the writer skill has a quick capture mode:

```
Sam: "blog idea: what if I wrote about how I keep building tools to avoid using tools"
Claude Code: [saves to src/drafts/ideas.md as a bullet point with date, pushes]
```

This could also work through CherryAgent/Telegram:
```
/blog idea "the irony of building a task manager to manage building a task manager"
```

The `src/drafts/ideas.md` file is a running list:

```markdown
# Blog Ideas

- 2026-03-15: The irony of building a task manager to manage building a task manager
- 2026-03-12: How I accidentally became a sysadmin by trying to save $20/month
- 2026-03-08: What working on Surpride taught me about shipping vs perfecting
```

When Sam starts a new post, Claude Code can offer: "You have 3 saved ideas. Want to start from one of these?"

---

## CherryAgent Integration (Telegram)

CherryAgent can support lightweight blog commands for mobile:

```
/blog ideas                    — Show saved blog ideas
/blog idea "<text>"            — Save a new idea
/blog drafts                   — List current drafts with status
/blog status <slug>            — Check where a draft is in the pipeline
```

Full writing still happens in Claude Code (the conversational brainstorm needs that back-and-forth). Telegram is for quick captures and status checks.

---

## File Structure in Blog Repo

```
saminprogress/
├── src/
│   ├── content/
│   │   └── blog/           ← Published posts (Astro content collection)
│   └── drafts/
│       ├── ideas.md        ← Running idea list
│       ├── some-draft.md   ← Work in progress (status: draft)
│       └── another-one.md  ← Edited, ready to publish (status: edited)
├── .claude/
│   └── skills/
│       ├── writer/
│       │   └── SKILL.md    ← Writer skill (this doc's Stage 1-4)
│       ├── editor/
│       │   └── SKILL.md    ← Existing editor skill
│       └── publisher/
│           └── SKILL.md    ← Existing publish skill
└── CLAUDE.md               ← References all three skills
```

---

## Implementation

### What Needs Building
- [ ] Writer skill SKILL.md (based on the spec in this doc)
- [ ] `src/drafts/` directory and `ideas.md` file in the blog repo
- [ ] Frontmatter convention with `status` field
- [ ] CherryAgent `/blog` commands (idea capture, draft listing)
- [ ] Update CLAUDE.md to reference writer skill and document the full pipeline

### What Already Exists
- Editor skill
- Publisher skill
- Astro blog (deployed, live, has published posts)
- CherryAgent (can be extended with blog commands)

### Migration
- Move any existing drafts from Obsidian vault to `src/drafts/` in the blog repo
- Remove Obsidian from the blog workflow entirely (keep it only if needed for other uses)

---

## What Changes

| Before | After |
|--------|-------|
| Brainstorm in claude.ai | Brainstorm in Claude Code (writer skill) |
| Copy-paste draft to Obsidian | Draft saved directly to repo |
| Tell Claude Code draft is ready | Claude Code already has it |
| Obsidian as parking spot | `src/drafts/` in the blog repo |
| No mobile blog workflow | Full write → edit → publish from Pixel |
| Ideas lost in chat history | `ideas.md` + Telegram quick capture |
