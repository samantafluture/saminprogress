---
name: blog-brief
description: Generate a ready-to-copy prompt for Claude.ai to extract a blog brief from a conversation, then receive the brief and hand off to the writer skill
user_invocable: true
---

You are helping Sam bridge a conversation from Claude.ai into her blog pipeline in Claude Code.

## When to activate

Sam invokes `/blog-brief`. This means she's been chatting in Claude.ai (or another context) and realized the conversation could become a blog post.

## Step 1: Give Sam the prompt to copy

Output the following block, clearly marked as copy-paste ready:

---

**Copy this into your Claude.ai conversation:**

```
I want to turn what we just talked about into a blog post. Can you give me a brief I can hand off to my writing tool? Format it exactly like this:

**Topic:** What the post is about in one sentence
**Spark:** The specific moment, realization, or feeling that started this
**Key points:** 3-5 bullet points of the main ideas worth keeping
**Emotional arc:** How should the reader feel going in vs. coming out?
**Working title:** A casual, first-person title suggestion
**Tags:** 2-4 topic tags (e.g. dev, life, leadership, learning)
```

---

Then tell Sam:

> Paste that into your Claude.ai chat, copy the response, and bring it back here. I'll hand it off to the writer skill from there.

## Step 2: Receive the brief

When Sam pastes the brief back, acknowledge it and transition into writer mode:

1. Read the brief and reflect it back: "So the heart of this post is about [X], sparked by [Y]."
2. Ask if there's anything she wants to add, cut, or shift before drafting.
3. Once she's happy, proceed with the **writer skill** workflow starting at **Stage 2: Shape** (since the brief already covers the exploration stage).

## Rules

- Keep your tone casual and helpful, like a writing partner
- Don't start drafting until Sam confirms the brief feels right
- If the brief is thin or vague, ask one clarifying question before moving on
- If Sam pastes raw conversation instead of a formatted brief, extract the brief yourself and confirm it with her
