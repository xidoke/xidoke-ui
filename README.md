# Xidoke UI - Modern Monorepo with ES Modules & Tailwind CSS v4

A production-ready monorepo built with **Turborepo**, **Next.js 15**, **ES Modules**, and **Tailwind CSS v4**. This project demonstrates modern JavaScript development practices with a focus on performance, maintainability, and developer experience.

## 🚀 Features

- **⚡ ES Modules**: Full ES modules support across all packages
- **🎨 Tailwind CSS v4**: Latest version with improved performance (3.78x faster builds)
- **📦 Monorepo**: Organized with Turborepo for efficient builds and caching
- **🔧 TypeScript**: Strict type checking throughout the codebase
- **📚 Storybook**: Component documentation and development
- **🎯 shadcn/ui**: Modern, accessible React components
- **⚙️ ESLint & Prettier**: Code quality and formatting
- **📱 Next.js 15**: Latest App Router with React 19

## 📁 Project Structure

```
xidoke-ui/
├── apps/
│   ├── web/                 # Main Next.js application
│   └── docs/               # Storybook documentation
├── packages/
│   ├── ui/                 # Shared React components
│   ├── eslint-config/      # ESLint configurations
│   ├── typescript-config/  # TypeScript configurations
│   └── tailwind-config/    # Centralized Tailwind CSS config
├── scripts/                # Build and deployment scripts
└── docs/                   # Project documentation
```

## 🛠️ Tech Stack

### Core

- **Turborepo** - Monorepo build system
- **Next.js 15** - React framework with App Router
- **React 19** - Latest React with concurrent features
- **TypeScript** - Type-safe JavaScript

### Styling & UI

- **Tailwind CSS v4** - Utility-first CSS framework
- **shadcn/ui** - Modern React components
- **PostCSS** - CSS processing

### Development Tools

- **ESLint** - Code linting with custom configs
- **Prettier** - Code formatting
- **Storybook** - Component documentation
- **pnpm** - Fast, disk space efficient package manager

## 🚀 Quick Start

### Prerequisites

- **Node.js** 18+
- **pnpm** (recommended) or npm/yarn
- **Git**

### Installation

```bash
# Clone the repository
git clone https://github.com/xidoke/xidoke-ui.git
cd xidoke-ui

# Install dependencies
pnpm install

# Setup global tools (optional but recommended)
pnpm add -g turbo
```

### Development

```bash
# Start all applications in development mode
turbo dev

# Start specific application
turbo dev --filter=web
turbo dev --filter=docs
```

### Build

```bash
# Build all applications and packages
turbo build

# Build specific application
turbo build --filter=web
turbo build --filter=docs
```

### Available Scripts

```bash
# Development
turbo dev              # Start all dev servers
turbo dev --filter=web # Start web app only

# Building
turbo build            # Build all packages
turbo build --filter=ui # Build UI package only

# Linting
turbo lint             # Lint all packages
turbo lint --filter=ui # Lint UI package only

# Type checking
turbo check-types      # Type check all packages

# Storybook
turbo dev --filter=docs # Start Storybook
```

## 📦 Packages

### Apps

- **`web`** - Main Next.js application
  - Next.js 15 with App Router
  - Tailwind CSS v4 integration
  - Shared UI components

- **`docs`** - Storybook documentation
  - Component documentation
  - Interactive examples
  - Design system showcase

### Packages

- **`@xidoke/ui`** - Shared React components
  - Button, Card, Code components
  - Tailwind CSS v4 styling
  - ES modules exports

- **`@xidoke/eslint-config`** - ESLint configurations
  - Next.js, React, TypeScript rules
  - Turbo plugin integration
  - Prettier integration

- **`@xidoke/typescript-config`** - TypeScript configurations
  - Base, Next.js, React library configs
  - Strict type checking

- **`@xidoke/tailwind-config`** - Centralized Tailwind CSS
  - Tailwind CSS v4 configuration
  - Shared PostCSS setup
  - Custom component classes

## 🎨 UI Components

The project includes modern, accessible React components built with Tailwind CSS v4:

### Button Component

```tsx
import { Button } from '@xidoke/ui/button'

// Primary button
<Button variant="primary">Click me</Button>

// Secondary button
<Button variant="secondary">Secondary</Button>

// Outline button
<Button variant="outline">Outline</Button>
```

### Card Component

```tsx
import { Card } from '@xidoke/ui/card'

// Default card
<Card>Content</Card>

// Elevated card
<Card variant="elevated">Content</Card>

// Outlined card
<Card variant="outlined">Content</Card>
```

### Code Component

```tsx
import { Code } from '@xidoke/ui/code'

// Inline code
<Code variant="inline">console.log('Hello')</Code>

// Block code
<Code variant="block">const message = 'Hello World'</Code>
```

## 🔧 Configuration

### Tailwind CSS v4

The project uses Tailwind CSS v4 with centralized configuration:

```css
/* packages/tailwind-config/shared-styles.css */
@import 'tailwindcss';

@layer components {
  .btn-primary {
    /* ... */
  }
  .card {
    /* ... */
  }
  .code-inline {
    /* ... */
  }
}
```

### ES Modules

All packages use ES modules for modern JavaScript:

```json
{
  "type": "module",
  "exports": {
    "./button": "./src/button.tsx",
    "./card": "./src/card.tsx"
  }
}
```

## 📚 Documentation

- **[Versioning Guide](./docs/versioning-guide.md)** - Semantic versioning and Git workflow
- **[CHANGELOG](./CHANGELOG.md)** - Version history and changes
- **[Storybook](http://localhost:6006)** - Component documentation (run `turbo dev --filter=docs`)

## 🚀 Deployment

### Vercel (Recommended)

```bash
# Deploy to Vercel
vercel

# Deploy with Turborepo
turbo build
vercel --prod
```

### Other Platforms

The project can be deployed to any platform that supports Next.js:

- **Netlify** - Static site generation
- **Railway** - Full-stack deployment
- **Docker** - Containerized deployment

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Commit changes: `git commit -m 'feat: add amazing feature'`
4. Push to branch: `git push origin feature/amazing-feature`
5. Open a Pull Request

### Development Workflow

```bash
# Create new component
turbo gen react-component --name=MyComponent

# Run tests (when available)
turbo test

# Check types
turbo check-types

# Lint code
turbo lint
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆕 What's New in v1.3.0

- ✨ **ES Modules Support**: Full ES modules integration across all packages
- 🎨 **Tailwind CSS v4**: Latest version with 3.78x faster builds
- 📦 **Centralized Config**: `@xidoke/tailwind-config` package for shared styling
- 📚 **Storybook Integration**: Component documentation with ES modules
- 🔧 **Enhanced UI Components**: Updated components with Tailwind v4 classes
- ⚡ **Performance Improvements**: Optimized build process and caching

## 🔗 Links

- **[Turborepo](https://turborepo.com)** - Monorepo build system
- **[Next.js](https://nextjs.org)** - React framework
- **[Tailwind CSS](https://tailwindcss.com)** - CSS framework
- **[shadcn/ui](https://ui.shadcn.com)** - React components
- **[Storybook](https://storybook.js.org)** - Component documentation

## 🔄 Remote Caching

> [!TIP]
> Vercel Remote Cache is free for all plans. Get started today at [vercel.com](https://vercel.com/signup?utm_source=remote-cache-sdk&utm_campaign=free_remote_cache).

Turborepo can use [Remote Caching](https://turborepo.com/docs/core-concepts/remote-caching) to share cache artifacts across machines, enabling you to share build caches with your team and CI/CD pipelines.

### Setup Remote Caching

```bash
# Login to Vercel
turbo login

# Link your repository to Remote Cache
turbo link
```

### Benefits

- **Faster Builds**: Share cache across team members
- **CI/CD Optimization**: Reduce build times in pipelines
- **Cost Savings**: Less compute resources needed
- **Team Collaboration**: Consistent build environments

## 📚 Useful Links

### Turborepo

- [Tasks](https://turborepo.com/docs/crafting-your-repository/running-tasks)
- [Caching](https://turborepo.com/docs/crafting-your-repository/caching)
- [Remote Caching](https://turborepo.com/docs/core-concepts/remote-caching)
- [Filtering](https://turborepo.com/docs/crafting-your-repository/running-tasks#using-filters)
- [Configuration](https://turborepo.com/docs/reference/configuration)

### Technologies

- [Next.js Documentation](https://nextjs.org/docs)
- [Tailwind CSS v4](https://tailwindcss.com/blog/tailwindcss-v4)
- [Storybook](https://storybook.js.org/docs)
- [shadcn/ui](https://ui.shadcn.com)
