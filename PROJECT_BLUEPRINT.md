# New Muslim Stories - Project Blueprint

## Overview

A Next.js 14 application showcasing inspiring stories of people who converted to Islam. Features:
- **Multi-language**: English & Arabic with RTL support
- **Markdown-based content**: Stories stored as `.md` files
- **Static generation**: Pre-rendered pages for optimal performance
- **Modern stack**: App Router, TypeScript, Tailwind CSS

---

## Prerequisites

- **Node.js**: 18+ (LTS recommended)
- **Package Manager**: pnpm (v10.19.0+)
- **Git**: Latest version

---

## Quick Start

### 1. Project Initialization

```bash
pnpm create next-app@latest new-muslim-stories --typescript --tailwind --app --src-dir --eslint
cd new-muslim-stories
```

### 2. Install Dependencies

```bash
# Core packages
pnpm add next-intl gray-matter remark remark-html server-only

# Optional: UI enhancements
pnpm add framer-motion react-scroll-parallax

# Development
pnpm add -D @testing-library/react jest-environment-jsdom
```

### 3. Project Structure

```
new-muslim-stories/
├── messages/              # i18n translations
│   ├── en.json
│   └── ar.json
├── src/
│   ├── app/              # Next.js App Router
│   │   ├── [locale]/    # Dynamic locale routes
│   │   │   ├── layout.tsx
│   │   │   ├── page.tsx
│   │   │   └── stories/
│   │   │       └── [slug]/
│   │   │           └── page.tsx
│   │   └── layout.tsx   # Root layout
│   ├── components/       # Reusable UI components
│   ├── lib/             # Utilities & data logic
│   │   └── stories.ts   # Story fetching logic
│   ├── hooks/           # Custom React hooks
│   └── stories/         # Markdown story files
│       ├── story-1.md
│       └── story-1-ar.md
├── middleware.ts         # i18n routing
├── i18n.ts              # next-intl configuration
└── next.config.mjs      # Next.js config
```

---

## Core Features Implementation

### Feature 1: Internationalization (i18n)

**1. Configure locales**
```typescript
// src/i18n.ts
import {getRequestConfig} from 'next-intl/server';

export default getRequestConfig(async ({locale}) => ({
  messages: (await import(`../messages/${locale}.json`)).default
}));
```

**2. Setup middleware**
```typescript
// src/middleware.ts
import createMiddleware from 'next-intl/middleware';

export default createMiddleware({
  locales: ['en', 'ar'],
  defaultLocale: 'en'
});
```

**3. Create translation files**
```json
// messages/en.json
{
  "Home": {
    "title": "New Muslim Stories"
  }
}
```

```json
// messages/ar.json
{
  "Home": {
    "title": "قصص مسلمين جدد"
  }
}
```

### Feature 2: Story Content System

**1. Create story files**
```markdown
<!-- src/stories/my-story.md -->
---
title: "My Journey to Islam"
firstName: "John"
age: 30
country: "USA"
previousReligion: "Christianity"
profilePhoto: "/photos/john.jpg"
featured: true
language: "en"
---

This is my story content in markdown format...
```

**2. Build data fetching logic**
```typescript
// src/lib/stories.ts
import fs from 'fs';
import path from 'path';
import matter from 'gray-matter';
import {remark} from 'remark';
import html from 'remark-html';

const storiesDirectory = path.join(process.cwd(), 'src/stories');

export async function getSortedStoriesData(locale: string) {
  const fileNames = fs.readdirSync(storiesDirectory);
  const stories = await Promise.all(
    fileNames.map(async (fileName) => {
      const slug = fileName.replace(/\.md$/, '');
      const fullPath = path.join(storiesDirectory, fileName);
      const fileContents = fs.readFileSync(fullPath, 'utf8');
      const matterResult = matter(fileContents);

      return {
        slug,
        ...(matterResult.data as StoryData),
      };
    })
  );

  // Filter by locale and sort
  return stories
    .filter(story => story.language === locale)
    .sort((a, b) => a.title.localeCompare(b.title));
}

export async function getStoryData(slug: string, locale: string) {
  const fileName = locale === 'ar' ? `${slug}-ar.md` : `${slug}.md`;
  const fullPath = path.join(storiesDirectory, fileName);
  const fileContents = fs.readFileSync(fullPath, 'utf8');
  const matterResult = matter(fileContents);
  const processedContent = await remark().use(html).process(matterResult.content);
  const contentHtml = processedContent.toString();

  return {
    slug,
    contentHtml,
    ...(matterResult.data as StoryData),
  };
}
```

**3. Generate static params**
```typescript
// src/app/[locale]/stories/[slug]/page.tsx
export async function generateStaticParams() {
  const slugs = getAllStorySlugs();
  return slugs.map((slug) => ({
    slug: slug.params.slug,
    locale: slug.params.locale,
  }));
}
```

### Feature 3: UI Components

**1. Layout component**
```typescript
// src/app/[locale]/layout.tsx
import {ReactNode} from 'react';
import {getMessages} from 'next-intl/server';
import ClientProviders from '@/components/ClientProviders';

export default async function LocaleLayout({
  children,
  params: {locale}
}: {
  children: ReactNode;
  params: {locale: string};
}) {
  const messages = await getMessages();

  return (
    <ClientProviders messages={messages} locale={locale}>
      <div dir={locale === 'ar' ? 'rtl' : 'ltr'}>
        {children}
      </div>
    </ClientProviders>
  );
}
```

**2. Story page**
```typescript
// src/app/[locale]/stories/[slug]/page.tsx
import {getStoryData} from '@/lib/stories';

export async function generateMetadata({params}: {params: {slug: string}}) {
  const story = await getStoryData(params.slug, params.locale);
  return {
    title: story.title,
    description: `Read ${story.firstName}'s story`,
  };
}

export default async function StoryPage({
  params
}: {
  params: {slug: string; locale: string};
}) {
  const story = await getStoryData(params.slug, params.locale);

  return (
    <article>
      <h1>{story.title}</h1>
      <div dangerouslySetInnerHTML={{__html: story.contentHtml}} />
    </article>
  );
}
```

### Feature 4: Client Providers

```typescript
// src/components/ClientProviders.tsx
'use client';

import {NextIntlClientProvider} from 'next-intl';
import {ParallaxProvider} from 'react-scroll-parallax';

export default function ClientProviders({
  messages,
  locale,
  children
}: {
  messages: any;
  locale: string;
  children: React.ReactNode;
}) {
  return (
    <NextIntlClientProvider messages={messages} locale={locale}>
      <ParallaxProvider>
        {children}
      </ParallaxProvider>
    </NextIntlClientProvider>
  );
}
```

---

## Development Workflow

### Running the Project

```bash
# Development
pnpm dev

# Production build
pnpm build
pnpm start

# Linting
pnpm lint
```

### Adding New Stories

1. Create markdown file in `src/stories/`
2. Add frontmatter with metadata
3. Write content in markdown
4. Create translated version (if needed): `{name}-ar.md`
5. Restart dev server (auto-reload)

### Adding Translations

1. Add keys to `messages/en.json`
2. Add corresponding translations to `messages/ar.json`
3. Use in components: `const t = useTranslations('Section')` then `t('key')`

---

## Configuration Files

### next.config.mjs
```typescript
import createNextIntlPlugin from 'next-intl/plugin';

const withNextIntl = createNextIntlPlugin('./src/i18n.ts');

const nextConfig = {
  // Add any custom config
};

export default withNextIntl(nextConfig);
```

### tailwind.config.ts
```typescript
import type {Config} from 'tailwindcss';

export default {
  content: ['./src/**/*.{js,ts,jsx,tsx}'],
  theme: {
    extend: {},
  },
  plugins: [],
} satisfies Config;
```

---

## Deployment

### Vercel (Recommended)

```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
vercel

# Follow prompts, select project settings
```

### Environment Variables

No environment variables required for basic setup.

### Build Settings

- **Build Command**: `pnpm build`
- **Output Directory**: `.next` (default)
- **Install Command**: `pnpm install`

---

## Best Practices

1. **Type Safety**: Always use TypeScript interfaces for story data
2. **Static Generation**: Use `generateStaticParams` for all dynamic routes
3. **Images**: Store images in `public/` directory, reference with absolute paths
4. **SEO**: Add metadata in `generateMetadata` functions
5. **Accessibility**: Use semantic HTML and proper ARIA labels
6. **Testing**: Add unit tests for story utility functions

---

## Troubleshooting

### Issue: Locale switcher shows 404
**Fix**: Ensure `useRouter` and `usePathname` are from `next-intl/navigation`

### Issue: Arabic text renders left-to-right
**Fix**: Add `dir={locale === 'ar' ? 'rtl' : 'ltr'}` to layout

### Issue: Story not loading
**Check**: File path matches slug exactly (case-sensitive)

---

## Additional Resources

- [Next.js App Router Documentation](https://nextjs.org/docs/app)
- [next-intl Documentation](https://next-intl-docs.vercel.app/)
- [Tailwind CSS Documentation](https://tailwindcss.com/docs)
- [Markdown Guide](https://www.markdownguide.org/)
