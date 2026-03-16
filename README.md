# Twinsight

> Stop Guessing. Start Simulating.

A digital twin platform landing page built with React, Vite, TypeScript, Tailwind CSS, Framer Motion, and shadcn/ui.

## 🌐 Live Site

[https://twinsight.github.io](https://twinsight.github.io)

## 🚀 Deployment

This site is deployed automatically to GitHub Pages via GitHub Actions on every push to `main`.

The pre-built static files (`index.html` + `assets/`) are served directly — no build step required during deployment.

## 🛠 Local Development

```bash
# Install dependencies
npm install

# Start dev server
npm run dev

# Build for production
npm run build
```

## 📁 Structure

```
twinsight.github.io/
├── index.html              # Entry point (pre-built)
├── 404.html                # SPA fallback for routing
├── .nojekyll               # Disables Jekyll processing
├── assets/
│   ├── index-*.js          # Bundled JS (React app)
│   └── index-*.css         # Bundled CSS (Tailwind)
├── src/                    # Source code
│   ├── sections/           # Page sections (Hero, UseCases, etc.)
│   ├── components/ui/      # shadcn/ui component library
│   └── App.tsx             # Root component
└── .github/workflows/
    └── pages.yml           # GitHub Actions CI/CD
```

## Tech Stack

- React 19 + TypeScript
- Vite 7
- Tailwind CSS v3
- Framer Motion
- shadcn/ui + Radix UI
- Three.js / React Three Fiber
