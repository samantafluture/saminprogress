# Plan: About Page

## Overview
Create `/about` page with content sourced from Sam's LinkedIn profile and public web presence. Follows the same terminal-aesthetic design system used throughout the site.

## Content (from LinkedIn + GitHub + DEV)

### Profile
- **Name:** Samanta Fluture (she/her)
- **Location:** Montreal, Canada
- **Current role:** Lead Dev at Turbulent (a Cloud Imperium Company)
- **Identity:** Full-stack developer, robotics enthusiast, interactive installations builder, media artist, educator

### Technical Skills
- **Languages:** JavaScript, TypeScript, HTML, CSS
- **Frontend:** React, Angular, Next.js, Tailwind CSS, Bootstrap, Material UI, Sass
- **Backend:** Node.js, Nest.js, Adonis, Express, GraphQL
- **Databases:** MongoDB, MySQL, PostgreSQL
- **DevOps:** Linux, Docker, Git

### Education
- Advertising degree (ESPM, Brazil)
- Master's in Intelligence Technologies and Digital Design (PUC, Brazil)
- Computer Science (Caelum)

### Notable Projects & Residencies
- **Passageiro** — Artistic Residency at Lab MIS (Museum of Image and Sound, São Paulo): mobile app for sharing thoughts while in transit (6 months)
- **Moskito Livre** — Maker Residency at Red Bull Basement (Brazil): low-budget hardware to reduce dengue contamination in favelas (5 months)
- **Book co-author** — Laboratório Aché: safe social media for kids/young people
- **Content writer** — 10+ years writing for Brazilian tech/culture blogs (1,000–5,000 daily visitors)
- **Volunteer translator** — Envato TutsPlus (EN ↔ PT tutorials)

### Links
- GitHub: github.com/samantafluture (121 repos, Pro)
- X/Twitter: @samantafluture
- DEV Community: dev.to/samantafluture
- LinkedIn: linkedin.com/in/samantafluture

---

## Implementation

### 1. Add "about" nav link to Header
**File:** `src/components/Header.astro`
- Add `{ href: '/about', label: 'about' }` to `navLinks` array

### 2. Create the about page
**File:** `src/pages/about.astro` (new file)

**Structure:**
- Uses `BaseLayout` (same as all pages)
- Breadcrumbs: `home / about` (same pattern as tag pages and blog posts)
- Section label: `$ cat ~/about.md` (terminal command, matches `$ ls posts/` on home)
- Page title: `> samanta fluture` (matches `>` prefix pattern from blog posts)
- Subtitle: location + role in monospace (like post metadata)

**Content sections (each with terminal-style `##` heading):**

1. **`## whoami`** — Short personal intro in Sam's voice (first person, warm, honest). Lead dev at Turbulent, based in Montreal, from Brazil. Media artist + robotics enthusiast. The human behind this blog.

2. **`## skills --list`** — Technical skills displayed as grouped tags/badges in terminal style. Grouped by category (languages, frontend, backend, databases, devops). Each skill as an inline monospace tag.

3. **`## education`** — Education entries with institution, degree, monospace dates/details.

4. **`## projects --highlight`** — The notable residencies and projects: Passageiro, Moskito Livre, book, content writing. Each as a card-like block with title, context, and short description.

5. **`## links`** — Social/professional links styled as a terminal output list with `→` arrows.

### 3. Styling approach
- All scoped styles in the page file (same pattern as other pages)
- Monospace (`var(--font-mono)`) for headings, labels, metadata
- Serif (`var(--font-serif)`) for prose/descriptions
- Color usage matches existing patterns:
  - `--cyan` for section prefixes and links
  - `--yellow` for title prefix and accents
  - `--green` for terminal command prefix
  - `--fg-faint` for metadata
  - `--border` for separators
- Responsive: single column, same `max-width` as rest of site
- Skill tags: inline flex items with `--bg-alt` background, monospace, small text
- Project cards: left border accent (like blockquotes in blog posts)

### 4. Accessibility
- Semantic HTML: `<article>`, `<section>`, headings in order
- `aria-hidden="true"` on decorative symbols (matching existing pattern)
- All links descriptive
- Breadcrumb with `aria-label` and `aria-current`

---

## Files Changed
1. `src/components/Header.astro` — add nav link
2. `src/pages/about.astro` — new page (all content + scoped styles)

## No changes to
- Layouts (reuses BaseLayout as-is)
- Global CSS (all styling scoped)
- Content collections (not a blog post)
