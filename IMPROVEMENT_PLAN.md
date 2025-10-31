# Project Improvement Plan

## Overview
Based on the rules emphasizing simplicity, native solutions, and best practices, this plan outlines 5 phases to improve the project.

---

## Phase 1: Replace Third-Party Libraries with Native Solutions (2-3 days)

### 1.1 Theme System - Replace `next-themes`
**Current:** `next-themes` (external dependency)
**Native Solution:** CSS custom properties + localStorage
**Benefits:**
- No hydration mismatch issues
- Smaller bundle size (~3KB saved)
- Full control over theme switching logic

### 1.2 Font Loading - Replace `@fontsource`
**Current:** `@fontsource/inter`, `@fontsource/montserrat`
**Native Solution:** `next/font` (built into Next.js)
**Benefits:**
- Automatic optimization (self-hosted)
- Smaller bundle size
- Better performance
- Automatic font preloading

### 1.3 Animations - Replace `framer-motion` & `react-scroll-parallax`
**Current:** `framer-motion`, `react-scroll-parallax`
**Native Solution:** CSS animations + Intersection Observer API
**Benefits:**
- Zero dependencies (~50KB saved)
- Better performance (GPU acceleration)
- Simpler code
- No library lock-in

### Tasks:
- [ ] Create custom `useTheme` hook
- [ ] Implement CSS variables for light/dark themes
- [ ] Migrate fonts to `next/font`
- [ ] Replace animations with CSS transitions
- [ ] Remove 3 dependencies from package.json

---

## Phase 2: Code Simplification & Cleanup (2 days)

### 2.1 Simplify ClientProviders
**Current:** Nested provider structure
**Improvement:** Reduce nesting, inline simple providers

### 2.2 Remove Unused Hooks
**Current:** `useHasMounted` (workaround for theme flash)
**Native Fix:** CSS-only theme prevents flash, remove hook

### 2.3 Component Refactoring
- Simplify `ThemeToggle` component
- Merge similar components where appropriate
- Remove redundant wrapper components

### Tasks:
- [ ] Simplify ClientProviders structure
- [ ] Remove useHasMounted hook
- [ ] Refactor 3-4 components
- [ ] Clean up dead code

---

## Phase 3: Performance Optimization (2 days)

### 3.1 Bundle Analysis & Optimization
- Analyze bundle size with `next bundle analyzer`
- Code split non-critical components
- Optimize imports (tree shaking)

### 3.2 Image Optimization
- Ensure all images use Next.js `Image` component
- Implement lazy loading for story images
- Add proper alt text for accessibility

### 3.3 Story Loading Optimization
- Implement incremental static regeneration for stories
- Add loading states with React Suspense
- Cache strategy for markdown files

### 3.4 Metadata & SEO
- Add proper meta tags
- Implement Open Graph tags
- Add structured data for stories

### Tasks:
- [ ] Install and run bundle analyzer
- [ ] Implement code splitting
- [ ] Optimize all images
- [ ] Add metadata to pages

---

## Phase 4: TypeScript & Code Quality (1-2 days)

### 4.1 Strict TypeScript Configuration
- Enable strict mode checks
- Fix all type errors
- Add proper types for all components

### 4.2 ESLint & Prettier
- Review and update ESLint rules
- Add Prettier for consistent formatting
- Setup pre-commit hooks

### 4.3 Code Documentation
- Add JSDoc comments for complex functions
- Document component props
- Create type definitions for story data

### Tasks:
- [ ] Fix all TypeScript errors
- [ ] Add comprehensive types
- [ ] Setup Prettier
- [ ] Document key functions

---

## Phase 5: Testing & Documentation (2-3 days)

### 5.1 Unit Tests
- Add tests for utility functions (stories.ts)
- Test theme switching logic
- Test i18n functionality

### 5.2 E2E Tests (Optional)
- Add Playwright/Cypress for critical paths
- Test story navigation
- Test language switching

### 5.3 Documentation
- Update README with setup instructions
- Document architecture decisions
- Add contribution guidelines

### Tasks:
- [ ] Write unit tests (70% coverage target)
- [ ] Setup E2E testing framework
- [ ] Update documentation
- [ ] Create deployment guide

---

## Summary of Benefits

### Dependency Reduction
- Remove 4-5 dependencies
- Reduce bundle size by ~60KB
- Less maintenance burden

### Performance Gains
- Faster theme switching (CSS native)
- Better animation performance (GPU)
- Smaller JavaScript bundle

### Code Quality
- More maintainable code
- Better TypeScript coverage
- Cleaner component structure

### Developer Experience
- Fewer dependencies to learn
- More debugging control
- Simpler code to understand

---

## Estimated Timeline
**Total: 9-12 days**

| Phase | Duration | Priority |
|-------|----------|----------|
| 1 - Replace Libraries | 2-3 days | High |
| 2 - Code Simplification | 2 days | High |
| 3 - Performance | 2 days | Medium |
| 4 - TypeScript | 1-2 days | Medium |
| 5 - Testing & Docs | 2-3 days | Low |

---

## Next Steps
1. Review this plan and approve phases
2. Ask any clarifying questions
3. Start with Phase 1 (highest impact)
4. Test each phase before moving to next
