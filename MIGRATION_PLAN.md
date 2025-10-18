# 🚀 Migration Plan: Flutter BLoC → Next.js 15 + React 19 + TypeScript

## 📋 Project Analysis Summary

### Current Flutter App Structure
- **27 content pages** (elm1 - elm27) + home, search, results pages
- **BLoC/Cubit state management** for:
  - Font size control (21-37px range)
  - Page navigation/slider control
  - Content sharing
  - Search functionality
- **Data model**: Rich Arabic text content with titles, subtitles, texts, ayahs, footer
- **UI Pattern**: Horizontal PageView slider with background images
- **Content**: All local data (no backend required)

---

## 🏗️ Folder Structure (Next.js 15 App Router)

```
salam-react-next/
├── src/
│   ├── app/                          # Next.js 15 App Router
│   │   ├── layout.tsx               # Root layout with fonts
│   │   ├── page.tsx                 # Home page
│   │   ├── elm/
│   │   │   └── [id]/
│   │   │       └── page.tsx         # Dynamic route for elm1-elm27
│   │   ├── search/
│   │   │   └── page.tsx             # Search page
│   │   └── globals.css              # Tailwind imports
│   │
│   ├── components/                   # Reusable UI components
│   │   ├── ui/
│   │   │   ├── AppBar.tsx           # Custom app bar/header
│   │   │   ├── Slider.tsx           # Page slider component
│   │   │   └── ShareButton.tsx      # Share functionality
│   │   ├── content/
│   │   │   ├── ContentSlider.tsx    # Main content slider (PageView equivalent)
│   │   │   ├── RichTextDisplay.tsx  # Renders ordered content
│   │   │   └── PageIndicator.tsx    # Page number display
│   │   └── layout/
│   │       └── BackgroundImage.tsx  # Background container
│   │
│   ├── contexts/                     # React Context (BLoC equivalent)
│   │   ├── FontContext.tsx          # Font size state
│   │   └── PageContext.tsx          # Page navigation state
│   │
│   ├── hooks/                        # Custom React hooks
│   │   ├── useFontSize.tsx          # Font size control hook
│   │   ├── usePageNavigation.tsx    # Page slider logic
│   │   ├── useShare.tsx             # Content sharing hook
│   │   └── useSearch.tsx            # Search logic hook
│   │
│   ├── data/                         # Local content data
│   │   ├── models/
│   │   │   ├── ElmModel.ts          # TypeScript interfaces
│   │   │   └── ContentOrder.ts      # Order enum equivalent
│   │   ├── content/
│   │   │   ├── elm1.ts              # Elm page 1 data
│   │   │   ├── elm2.ts              # Elm page 2 data
│   │   │   └── ... (elm3-elm27)
│   │   ├── texts/
│   │   │   └── elmTexts.ts          # All text constants
│   │   └── index.ts                 # Central export
│   │
│   ├── lib/                          # Utilities
│   │   ├── utils.ts                 # Helper functions
│   │   └── cn.ts                    # Tailwind class merger
│   │
│   └── types/                        # TypeScript types
│       └── index.ts                 # Global type definitions
│
├── public/
│   └── images/                       # Background images
│       ├── image12.jpg
│       └── ... (other images)
│
├── tailwind.config.ts               # Tailwind configuration
├── tsconfig.json                     # TypeScript config
├── next.config.ts                    # Next.js config
├── package.json
└── README.md
```

---

## ⚙️ Technology Stack & Libraries

### Core Framework
- **Next.js 15+** (App Router with React Server Components)
- **React 19+** (with hooks: useState, useContext, useEffect, useRef)
- **TypeScript 5+** (strict mode enabled)

### Styling
- **Tailwind CSS 4+** (utility-first styling)
- **clsx/tailwind-merge** (conditional class management)

### State Management
- **React Context API** + **Custom Hooks** (replaces BLoC/Cubit)
  - No external state library needed for this app size
  - Context for global state (font size, page index)
  - Local state for component-specific logic

### Features
- **Web Share API** (native browser sharing, replaces share_plus)
- **localStorage** (persist font preferences)
- **Embla Carousel** or **Swiper** (for smooth horizontal slider)
  - *Alternative*: Custom implementation with CSS scroll-snap

### Development Tools
- **ESLint** (code quality)
- **Prettier** (code formatting)
- **Vitest** (unit tests) - optional

---

## 📝 Step-by-Step Implementation Plan

### **Phase 1: Project Setup** 🏁

#### Step 1.1: Initialize Next.js Project
- [ ] Create new Next.js 15 project with TypeScript and Tailwind CSS
- [ ] Configure `tailwind.config.ts` with custom colors (black, amber, grey)
- [ ] Set up Arabic font support (AmiriQuran or similar Google Font)
- [ ] Configure `next.config.ts` for static export if needed

#### Step 1.2: Setup Project Structure
- [ ] Create folder structure as outlined above
- [ ] Install required dependencies:
  - `embla-carousel-react` or `swiper`
  - `clsx` and `tailwind-merge`
  - `lucide-react` (for icons)
- [ ] Configure TypeScript paths in `tsconfig.json`

**Deliverable**: Empty project with proper structure and configuration

---

### **Phase 2: Data Models & Types** 📊

#### Step 2.1: Define TypeScript Interfaces
- [ ] Create `ElmModel` interface (equivalent to `ElmModelNewOrder`)
  ```typescript
  interface ElmModel {
    titles?: string[];
    subtitles?: string[];
    texts?: string[];
    ayahs?: string[];
    footer?: string;
    order: ContentOrder[];
  }
  ```
- [ ] Create `ContentOrder` enum (equivalent to `EnOrder`)
- [ ] Define props interfaces for all components

#### Step 2.2: Convert Data Files
- [ ] Convert `elm_list_1_new_order.dart` → `elm1.ts`
- [ ] Convert text constants from Dart to TypeScript
- [ ] Create data index file for easy imports

**Deliverable**: Complete type system and data structure

---

### **Phase 3: State Management** 🔄

#### Step 3.1: Font Context (replaces FontCubit)
- [ ] Create `FontContext` with:
  - `fontSize` state (default: 21px, range: 21-37px)
  - `increaseFontSize()` function
  - `decreaseFontSize()` function
  - localStorage persistence
- [ ] Create `useFontSize()` hook for components

#### Step 3.2: Page Navigation Context (replaces BasePageCubit)
- [ ] Create `PageContext` with:
  - `currentPage` state
  - `totalPages` value
  - `goToPage()` function
  - `onPageChange()` handler
- [ ] Create `usePageNavigation()` hook

#### Step 3.3: Additional Hooks
- [ ] Create `useShare()` hook (Web Share API)
- [ ] Create `useSearch()` hook for content search

**Deliverable**: Complete state management system with React patterns

---

### **Phase 4: Core Components** 🧩

#### Step 4.1: Layout Components
- [ ] Create `AppBar` component:
  - Back button with navigation
  - Title display
  - Font controls (+/- buttons)
  - Share button
- [ ] Create `BackgroundImage` wrapper component

#### Step 4.2: Content Display
- [ ] Create `RichTextDisplay` component:
  - Renders content based on `order` array
  - Applies different styles for titles, texts, ayahs, footer
  - Uses dynamic font size from context
- [ ] Create `ContentSlider` component:
  - Horizontal swipe/scroll functionality
  - Responsive design
  - RTL support for Arabic

#### Step 4.3: UI Controls
- [ ] Create `Slider` component (page navigation slider)
- [ ] Create `PageIndicator` component (shows "X / Y")
- [ ] Create `ShareButton` with Web Share API integration

**Deliverable**: Reusable component library

---

### **Phase 5: Pages Implementation** 📄

#### Step 5.1: Home Page
- [ ] Create home page (`app/page.tsx`)
- [ ] Navigation links to all 27 elm pages
- [ ] Search functionality integration

#### Step 5.2: Dynamic Elm Page
- [ ] Create dynamic route `app/elm/[id]/page.tsx`
- [ ] Load content based on ID (1-27)
- [ ] Integrate all components (AppBar, ContentSlider, etc.)
- [ ] Add share functionality
- [ ] Add font controls

#### Step 5.3: Search Page
- [ ] Create search page (`app/search/page.tsx`)
- [ ] Implement search logic across all content
- [ ] Display search results
- [ ] Navigate to specific pages/content

**Deliverable**: Fully functional page routing

---

### **Phase 6: Styling & Polish** 🎨

#### Step 6.1: Tailwind Styling
- [ ] Apply Tailwind classes to all components
- [ ] Create custom theme colors (black, amber, grey)
- [ ] Ensure RTL layout for Arabic text
- [ ] Add responsive breakpoints

#### Step 6.2: Animations & Transitions
- [ ] Smooth page transitions
- [ ] Slider animations
- [ ] Button hover effects
- [ ] Loading states

**Deliverable**: Polished, production-ready UI

---

### **Phase 7: Testing & Optimization** 🧪

#### Step 7.1: Testing
- [ ] Test all 27 elm pages load correctly
- [ ] Test font size controls
- [ ] Test page navigation and slider
- [ ] Test share functionality
- [ ] Test search across content
- [ ] Test on mobile devices

#### Step 7.2: Performance Optimization
- [ ] Enable Next.js static generation where possible
- [ ] Optimize images
- [ ] Code splitting for content files
- [ ] Lazy load background images

#### Step 7.3: Accessibility
- [ ] Add ARIA labels
- [ ] Keyboard navigation support
- [ ] Screen reader testing

**Deliverable**: Tested, optimized application

---

## 🧩 Example Implementation: Elm1 Page

### File: `src/app/elm/[id]/page.tsx`

```typescript
'use client';

import { useParams } from 'next/navigation';
import { AppBar } from '@/components/ui/AppBar';
import { ContentSlider } from '@/components/content/ContentSlider';
import { FontProvider } from '@/contexts/FontContext';
import { PageProvider } from '@/contexts/PageContext';
import { getElmData } from '@/data';
import { BackgroundImage } from '@/components/layout/BackgroundImage';

export default function ElmPage() {
  const params = useParams();
  const id = params.id as string;
  
  const elmData = getElmData(parseInt(id));
  
  if (!elmData) {
    return <div>Content not found</div>;
  }

  return (
    <FontProvider>
      <PageProvider totalPages={elmData.pages.length}>
        <div className="min-h-screen">
          <AppBar 
            title={`الخاطرة ${id}`}
            backTo="/"
            contentData={elmData.pages}
          />
          <BackgroundImage src={elmData.backgroundImage}>
            <ContentSlider pages={elmData.pages} />
          </BackgroundImage>
        </div>
      </PageProvider>
    </FontProvider>
  );
}
```

### File: `src/components/content/ContentSlider.tsx`

```typescript
'use client';

import { usePageNavigation } from '@/hooks/usePageNavigation';
import { useFontSize } from '@/hooks/useFontSize';
import { RichTextDisplay } from './RichTextDisplay';
import { PageIndicator } from './PageIndicator';
import { Slider } from '@/components/ui/Slider';
import { ElmModel } from '@/types';

interface Props {
  pages: ElmModel[];
}

export function ContentSlider({ pages }: Props) {
  const { currentPage, goToPage, onPageChange } = usePageNavigation();
  const { fontSize } = useFontSize();

  return (
    <div className="relative h-screen">
      {/* Swipeable content area */}
      <div className="h-full overflow-x-auto snap-x snap-mandatory scroll-smooth">
        {pages.map((page, index) => (
          <div 
            key={index}
            className="h-full w-screen snap-center flex-shrink-0 overflow-y-auto"
          >
            <div className="px-8 py-16 max-w-4xl mx-auto">
              <RichTextDisplay 
                content={page} 
                fontSize={fontSize}
              />
            </div>
          </div>
        ))}
      </div>

      {/* Bottom controls */}
      <div className="absolute bottom-4 left-0 right-0">
        <Slider 
          value={currentPage}
          max={pages.length - 1}
          onChange={goToPage}
        />
        <PageIndicator 
          current={currentPage + 1} 
          total={pages.length} 
        />
      </div>
    </div>
  );
}
```

### File: `src/components/content/RichTextDisplay.tsx`

```typescript
import { ElmModel, ContentOrder } from '@/types';

interface Props {
  content: ElmModel;
  fontSize: number;
}

export function RichTextDisplay({ content, fontSize }: Props) {
  const renderItem = (orderType: ContentOrder, index: number) => {
    const style = { fontSize: `${fontSize}px` };
    
    switch (orderType) {
      case 'titles':
        return (
          <h1 
            key={`title-${index}`}
            className="font-bold text-amber-600 mb-4 text-center"
            style={style}
          >
            {content.titles?.[index]}
          </h1>
        );
      
      case 'texts':
        return (
          <p 
            key={`text-${index}`}
            className="text-black leading-relaxed mb-4 text-right"
            style={style}
          >
            {content.texts?.[index]}
          </p>
        );
      
      case 'ayahs':
        return (
          <p 
            key={`ayah-${index}`}
            className="text-green-700 leading-relaxed mb-4 text-center font-semibold"
            style={style}
          >
            {content.ayahs?.[index]}
          </p>
        );
      
      case 'footer':
        return (
          <footer 
            key="footer"
            className="text-gray-600 mt-8 text-center italic"
            style={style}
          >
            {content.footer}
          </footer>
        );
      
      default:
        return null;
    }
  };

  return (
    <div className="space-y-2 font-['Amiri_Quran']">
      {content.order.map((orderType, idx) => renderItem(orderType, idx))}
    </div>
  );
}
```

### File: `src/contexts/FontContext.tsx`

```typescript
'use client';

import { createContext, useContext, useState, useEffect, ReactNode } from 'react';

interface FontContextType {
  fontSize: number;
  increaseFontSize: () => void;
  decreaseFontSize: () => void;
}

const FontContext = createContext<FontContextType | undefined>(undefined);

const MIN_FONT_SIZE = 21;
const MAX_FONT_SIZE = 37;
const DEFAULT_FONT_SIZE = 21;

export function FontProvider({ children }: { children: ReactNode }) {
  const [fontSize, setFontSize] = useState(DEFAULT_FONT_SIZE);

  // Load from localStorage on mount
  useEffect(() => {
    const saved = localStorage.getItem('fontSize');
    if (saved) {
      setFontSize(parseInt(saved));
    }
  }, []);

  // Save to localStorage on change
  useEffect(() => {
    localStorage.setItem('fontSize', fontSize.toString());
  }, [fontSize]);

  const increaseFontSize = () => {
    setFontSize(prev => Math.min(prev + 2, MAX_FONT_SIZE));
  };

  const decreaseFontSize = () => {
    setFontSize(prev => Math.max(prev - 2, MIN_FONT_SIZE));
  };

  return (
    <FontContext.Provider value={{ fontSize, increaseFontSize, decreaseFontSize }}>
      {children}
    </FontContext.Provider>
  );
}

export function useFontSize() {
  const context = useContext(FontContext);
  if (!context) {
    throw new Error('useFontSize must be used within FontProvider');
  }
  return context;
}
```

---

## 💡 Migration Notes

### Converting BLoC to React Patterns

1. **Cubit → Context + Hooks**
   - Each Cubit becomes a Context Provider
   - Business logic moves to custom hooks
   - State emissions become `setState` calls

2. **BlocBuilder → useContext**
   - Replace `BlocBuilder<>` with `useContext()` hook
   - Rebuild happens automatically on state change

3. **BlocProvider → Context Provider**
   - Wrap components with Context Provider
   - Access via custom hooks

### Key Differences

| Flutter BLoC | React Pattern |
|--------------|---------------|
| `Cubit<State>` | `createContext<State>()` |
| `emit(newState)` | `setState(newState)` |
| `BlocBuilder` | `useContext()` or `useSubscription()` |
| `BlocProvider` | `<Provider>` wrapper |
| `context.read<>()` | `useContext()` hook |

### Content Data Conversion

```dart
// Flutter
ElmModelNewOrder(
  titles: ["عنوان"],
  texts: ["نص 1", "نص 2"],
  order: [EnOrder.titles, EnOrder.texts, EnOrder.texts]
)
```

```typescript
// React/TypeScript
{
  titles: ["عنوان"],
  texts: ["نص 1", "نص 2"],
  order: ['titles', 'texts', 'texts']
}
```

---

## 🧪 Testing Strategy

### Unit Tests (Vitest)
- Test hooks: `useFontSize`, `usePageNavigation`
- Test utility functions
- Test data transformations

### Integration Tests
- Test full page rendering
- Test navigation flow
- Test state persistence

### Manual Testing Checklist
- [ ] All 27 pages load correctly
- [ ] Font size adjusts properly (21-37px)
- [ ] Page slider works smoothly
- [ ] Share functionality works on mobile
- [ ] Search finds correct content
- [ ] RTL layout displays correctly
- [ ] Images load properly
- [ ] Responsive on mobile/tablet/desktop

---

## 🔁 Performance Considerations

### SSR vs CSR Decisions

- **Server Components** (SSR): Home page, static content
- **Client Components**: Interactive elements (slider, font controls, share)
- **Static Generation**: All elm pages can be pre-generated

### Optimization Tips

1. **Code Splitting**: Lazy load content data per page
2. **Image Optimization**: Use Next.js Image component
3. **Font Loading**: Use `next/font` for optimal font loading
4. **Bundle Size**: Split large data files, load on demand

---

## 📦 Installation Commands

```bash
# Create Next.js project
pnpm create next-app@latest salam-react-next --typescript --tailwind --app --no-src-dir

# Install dependencies
pnpm add embla-carousel-react clsx tailwind-merge lucide-react

# Install dev dependencies (optional)
pnpm add -D @types/node vitest @testing-library/react
```

---

## 🎯 Success Criteria

- [ ] All 27 elm pages functional with correct content
- [ ] Font size controls working (21-37px range)
- [ ] Smooth horizontal page swiping
- [ ] Share functionality operational
- [ ] Search across all content working
- [ ] Responsive design (mobile-first)
- [ ] Arabic text displays correctly (RTL)
- [ ] Performance: Page loads < 2 seconds
- [ ] No console errors
- [ ] TypeScript strict mode passes

---

## 🚀 Next Steps After Plan

1. Review this plan and confirm approach
2. Clarify any unclear points about Flutter app behavior
3. Begin Phase 1: Project setup
4. Implement one example page completely
5. Replicate pattern across remaining pages
6. Test and deploy

---

**Ready to proceed with implementation?** 
Let me know if you need any clarifications or modifications to this plan!
