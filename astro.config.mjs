import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import sitemap from '@astrojs/sitemap';

export default defineConfig({
  site: 'https://saminprogress.tech',
  integrations: [mdx(), sitemap()],
});
