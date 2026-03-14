# Accessibility Improvement Plan — saminprogress

> Created: 2026-03-14
> Standard: WCAG 2.1 AA
> Status: Awaiting approval

---

## Phase 1 — Critical (Focus + Contrast)

These are WCAG AA failures that must be fixed first.

### 1.1 Add focus indicators to all interactive elements
- Add `:focus-visible` styles to links, buttons, tag links, nav links, breadcrumbs
- Files: global.css, Header.astro, PostItem.astro, BlogPost.astro, ThemeToggle.astro
- Every element with a `:hover` style must also have a matching `:focus-visible` style

### 1.2 Fix color contrast — dark theme
- `--fg-faint` (#586E75) on `--bg` (#002B36) = ~1.5:1 (needs 4.5:1) — CRITICAL
- `--fg-muted` (#839496) on `--bg` (#002B36) = ~3.2:1 (needs 4.5:1)
- Used in: breadcrumbs, post metadata, footer text

### 1.3 Fix color contrast — light theme
- `--fg-faint` (#93A1A1) on `--bg` (#FDF6E3) = ~2.1:1 (needs 4.5:1)
- `--fg-muted` (#839496) on `--bg` (#FDF6E3) = ~2.7:1 (needs 4.5:1)
- `--cyan` (#2AA198) links on `--bg` (#FDF6E3) = ~3.1:1 (needs 4.5:1 for normal text)

### 1.4 Hide decorative symbols from screen readers
- Add `aria-hidden="true"` to: breadcrumb `/` separators, `# ` prefixes, `> ` title prefixes, `←` back arrow
- Files: BlogPost.astro, Header.astro, PostItem.astro

---

## Phase 2 — High (Navigation + Structure)

These are WCAG A failures.

### 2.1 Add skip-to-content link
- Add visually hidden "Skip to main content" link as first element in BaseLayout
- Add `id="main-content"` to `<main>` element
- Show link on focus for keyboard users

### 2.2 Fix hero image alt text
- Add `heroImageAlt` optional field to content schema (content.config.ts)
- Use it in BlogPost.astro: `<img src={heroImage} alt={heroImageAlt || ""} />`

### 2.3 Fix heading hierarchy
- Remove `display: none` on `.post-content h1` in BlogPost.astro
- Instead, handle duplicate h1 at the content level (document in CLAUDE.md post format)

---

## Phase 3 — Moderate (Polish)

Best practices and AAA improvements.

### 3.1 Add prefers-reduced-motion support
- Wrap blink animation in `@media (prefers-reduced-motion: no-preference)`
- Disable theme transition under `prefers-reduced-motion: reduce`
- Files: global.css, Header.astro

### 3.2 Improve theme toggle for assistive tech
- Update `aria-label` dynamically to reflect current state ("Switch to dark mode" / "Switch to light mode")
- Or add `aria-live="polite"` region announcing theme change
- File: ThemeToggle.astro

### 3.3 Upgrade breadcrumb semantics
- Wrap breadcrumb items in `<ol>` with `<li>` elements
- Add `aria-label="breadcrumb"` to `<nav>`
- Add `aria-current="page"` to current page item
- Files: BlogPost.astro, tag/[tag].astro

### 3.4 Improve "read more" link context
- Add `aria-label="read more: {title}"` to read-more links
- File: PostItem.astro

---

## Reference

- WCAG 2.1 Quick Reference: https://www.w3.org/WAI/WCAG21/quickref/
- Contrast checker: use 4.5:1 minimum for normal text, 3:1 for large text (18px bold or 24px)
- Test with: keyboard-only navigation, screen reader (NVDA/VoiceOver), browser dev tools accessibility panel
