### 🧠 Final Prompt — Rebuild Flutter BLoC App in Next.js + React + TypeScript

> **Prompt:**
> I have a Flutter project that uses **BLoC** for state management. I want you to rebuild this project in **Next.js 15+** and **React 19+**, using **TypeScript** and **Tailwind CSS**.
> Please follow these rules carefully:
>
> 1. **Think first**, then write a **clear, step-by-step plan** before coding. **Make sure to make a plane step-by-step.**
> 2. Use only **latest, stable, and community-supported libraries**.
> 3. Use **React 19+ features** (Server Components, Actions, Hooks) and **Next.js 15 App Router**.
> 4. Implement the **same architecture logic** as the Flutter BLoC version:
>
>    * State management equivalent (use React Context + custom hooks, or a minimal established library if truly necessary).
>    * Keep components modular, clean, and readable.
>    * Use TypeScript for types, interfaces, and props.
> 5. Use **Tailwind CSS** for all styling (no inline styles or external CSS files unless justified).
> 6. Prefer **native React/Next.js solutions** over third-party libraries whenever possible.
> 7. Keep your explanation **simple and beginner-friendly**, while following **best practices**.
> 8. Include the following in your output:
>
>    * 🏗️ Folder structure overview.
>    * ⚙️ Explanation of chosen tools/libraries and why.
>    * 📝 A clear, numbered **step-by-step plan** (implementation phases) — include milestones and what to deliver at each step.
>    * 🧩 One fully implemented example page/feature (matching a representative Flutter page), with code snippets (components, hooks, types, styling).
>    * 💡 Migration notes: how to convert remaining pages and BLoC behaviours to the chosen React pattern.
>    * 🧪 Basic testing recommendations and where to place tests.
>    * 🔁 Notes on progressive enhancement and performance (SSR/SSG vs client rendering decisions).
> 9. If anything about the Flutter project is unclear, **ask me BEFORE coding** — list the exact pieces of info you need.
>
> **Context about the Flutter app (include when possible):**
>
> * App shows Arabic rich text content (titles, subtitles, ayahs, texts, footer), paginated across multiple pages with horizontal swipe in Flutter.
> * App uses BLoC/Cubit for: font size control, sharing page content, navigation/page control, and scheduling local notifications.
> * All content is local (no server required).
> * The project will be used across ~20+ pages and the slider UI is reused across many pages.
>
> **Deliverable format:**
>
> * Provide the step-by-step plan first. Then produce code snippets and a sample page implementing the plan. Use TypeScript + Next.js 15 App Router structure. Use Tailwind for styling. Keep explanations concise and actionable.

---
