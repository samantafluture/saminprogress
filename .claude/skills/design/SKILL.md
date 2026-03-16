# saminprogress — Design System

> This document is the single source of truth for all design decisions on saminprogress.
> Claude Code and the designer skill must always read this file before building or modifying any UI component.

---

## Concept

**saminprogress** is a personal journal by Sam — a lead front-end developer based in Montreal.
The aesthetic is **light vintage terminal**: warm, readable, technically precise. It feels like
a personal diary found running inside a well-loved terminal. Not cold or hacker-y — warm,
human, and editorial.

Two themes are planned. This document covers **Option B — Terminal Light (v5)** which is the
chosen starting theme. Dark mode will be added later following the same design language.

---

## Fonts

Two fonts only. No exceptions.

| Role | Font | Source |
|------|------|--------|
| UI chrome, headings, prompts, nav, meta, buttons, labels | `IBM Plex Mono` | Google Fonts |
| Body text, excerpts, tagline, tags | `Source Serif 4` | Google Fonts |

**Import:**
```css
@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:ital,wght@0,400;0,500;1,400&family=Source+Serif+4:ital,opsz,wght@0,8..60,400;0,8..60,600;1,8..60,400&display=swap');
```

**Rules:**
- IBM Plex Mono = everything that belongs to the terminal shell (structure, navigation, code)
- Source Serif 4 = everything that belongs to the human writing (reading, feeling, thinking)
- Never use any other font
- Never use system fonts as primary

---

## Color Palette — Solarized Light

```css
:root {
  /* base tones */
  --base03:  #002B36;  /* darkest — rarely used */
  --base02:  #073642;  /* dark header background */
  --base01:  #586E75;  /* primary text on light bg, nav buttons bg */
  --base00:  #657B83;  /* body text */
  --base0:   #839496;  /* muted text, tagline */
  --base1:   #93A1A1;  /* very muted, meta text */
  --base2:   #EEE8D5;  /* dividers, excerpt border */
  --base3:   #FDF6E3;  /* page background */

  /* accents */
  --yellow:  #B58900;  /* primary accent — buttons, post title prefix, branch segment */
  --blue:    #268BD2;  /* secondary accent — links hover, location segment */
  --cyan:    #2AA198;  /* tertiary accent — prompt symbol, tags, meta prefix */
  --green:   #859900;  /* user segment, section label prefix */
  --orange:  #CB4B16;  /* reserved for errors / warnings */
  --red:     #DC322F;  /* reserved for destructive actions */
  --magenta: #D33682;  /* reserved for special callouts */
  --violet:  #6C71C4;  /* reserved for future use */
}
```

---

## Layout

- Max content width: `680px`
- Content padding: `1.75rem 2rem`
- No background grid, no noise texture, no decorative effects on the page body
- The only background is the flat `--base3` warm cream

---

## Header

The header is the terminal window. Dark background (`--base02`), no window chrome bar (no
red/yellow/green dots row).

### Prompt bar

A single row of colored segments, full width, flush to the top of the header.

| Segment | Content | Background | Text color |
|---------|---------|------------|------------|
| User | `sam@progress` | `--green` `#859900` | `--base03` |
| Branch | `⎇ dev` | `--yellow` `#B58900` | `--base03` |
| Command | `cat ~/thoughts/all.md \| grep -v overthinking \| sort -r` | `--base01` | `--base3`, italic |
| Location | `📍 montreal` | `--blue` `#268BD2` | `--base3` |

- Font: IBM Plex Mono, 12px, `font-weight: 500`
- Padding per segment: `10px 16px`
- Command segment: `flex: 1` (takes remaining space), `font-style: italic`, `font-weight: 400`
- Location segment: `margin-left: auto`

### Site name row

```
~$  saminprogress▌
```

- Prompt `~$`: IBM Plex Mono, 13px, cyan (`--cyan`)
- Site name: IBM Plex Mono, 22px, `font-weight: 500`, `--base3` (white-ish)
- Blinking cursor: `10px × 18px` block, `--yellow`, `animation: blink 1s step-end infinite`
- Padding: `14px 16px 6px`

### Tagline

```
// personal journal · lead dev life · things i'm building
```

- Font: Source Serif 4, 13px, italic
- Color: `--base0`
- Padding: `0 16px 8px`

### Navigation

Three links: `writing`, `projects`, `about`

- Font: IBM Plex Mono, 12px
- Each link prefixed with `./` in `--cyan`
- Default state: `--base01` background, `--base3` text
- Hover: `--blue` background
- Active: `--yellow` background, `--base03` text, `./` prefix also `--base03`
- Padding: `4px 14px`
- No border, no border-radius
- Nav bar padding: `8px 16px 12px`

---

## Post List

### Section label

```
$ ls posts/
```

- Font: IBM Plex Mono, 11px, `letter-spacing: 1px`
- `$ ls ` prefix in `--green`
- `posts/` in `--base1`
- Margin bottom: `1.25rem`

### Post item

- Bottom border: `1px solid --base2` (except last child)
- Margin/padding bottom: `1.75rem`

**Post meta** (date · read time)
- Font: IBM Plex Mono, 11px, `--base1`
- Prefixed with `# ` in `--cyan`

**Post title**
- Font: IBM Plex Mono, 19px, `font-weight: 500`, `--base01`
- Prefixed with `> ` in `--yellow`
- `line-height: 1.25`
- Hover: color changes to `--blue`

**Tags**
- Font: Source Serif 4, 12px, italic, `font-weight: 600`
- Color: `--cyan`
- Style: underline only, `text-underline-offset: 3px`
- No background, no border, no padding
- Hover: color `--base01`
- Prefixed with `#`

**Excerpt**
- Font: Source Serif 4, 15px, `--base00`
- `line-height: 1.55`
- Left border: `2px solid --base2`
- Left padding: `12px`
- Margin bottom: `14px`

**Read more button**
- Font: IBM Plex Mono, 12px, `font-weight: 500`
- Background: `--yellow`
- Text: `--base03`
- No border, no border-radius
- Padding: `5px 16px`
- Prefixed with `→ `
- Hover: `--blue` background, `--base3` text

---

## Typography Scale

| Element | Font | Size | Weight | Color |
|---------|------|------|--------|-------|
| Site name | IBM Plex Mono | 22px | 500 | `--base3` |
| Post title | IBM Plex Mono | 19px | 500 | `--base01` |
| Body / excerpt | Source Serif 4 | 15px | 400 | `--base00` |
| Tagline | Source Serif 4 | 13px | 400 italic | `--base0` |
| Nav links | IBM Plex Mono | 12px | 400 | `--base3` |
| Tags | Source Serif 4 | 12px | 600 italic | `--cyan` |
| Meta / labels | IBM Plex Mono | 11px | 400 | `--base1` |
| Prompt bar | IBM Plex Mono | 12px | 500 | varies |

---

## What NOT to do

- No rounded corners anywhere
- No shadows
- No gradients
- No background grid or texture on the page body
- No window chrome bar (red/yellow/green dots)
- No Inter, Roboto, or system fonts
- No more than two fonts
- No all-caps text outside of terminal segments
- No card borders on post items — separation is done with the bottom border only
- No centered layout — everything is left-aligned

---

## Future: Dark Mode (Option B · Terminal Dark)

Not yet designed. Will use the same fonts and terminal structure but with Solarized Dark
palette (`--base03` background, light text). To be specced separately.

---

## Future: Option A — 2000s Blog Theme

A second theme based on the early personal blog era aesthetic: off-white warm paper background,
VT323 pixel headings, amber accent, Source Serif 4 body, grid paper background. Fully specced
and mocked up — to be documented separately when ready to implement.

---

*Last updated: March 13, 2026 — designed over coffee at BAnQ, Montreal.*
