# Changelog

Tất cả các thay đổi quan trọng trong dự án này sẽ được ghi lại trong file này.

Format dựa trên [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
và dự án này tuân thủ [Semantic Versioning](https://semver.org/lang/vi/).

## [Unreleased]

### Planned
- Add authentication system
- Implement database integration
- Add API endpoints
- Create admin dashboard

## [1.3.0] - 2025-07-27

### Added
- **ES Modules Support**: Full ES modules integration across all packages
- **Tailwind CSS v4**: Latest version with improved performance and features
- **Centralized Tailwind Config**: `@xidoke/tailwind-config` package for shared styling
- **Storybook Integration**: Component documentation with ES modules support
- **Enhanced UI Components**: Updated Button, Card, and Code components with Tailwind v4
- **PostCSS Configuration**: Centralized PostCSS setup for Tailwind CSS v4

### Changed
- **Package Structure**: All packages now use ES modules (`"type": "module"`)
- **Tailwind Integration**: Migrated from Tailwind CSS v3 to v4.1.11
- **Import System**: Updated to use `@import "tailwindcss"` syntax (v4)
- **Component Styling**: UI components now use centralized Tailwind classes
- **Build Configuration**: Optimized for ES modules and Tailwind v4

### Fixed
- **Module Resolution**: Fixed Storybook alias configuration for `@xidoke/ui`
- **Package Exports**: Updated UI package exports for proper module resolution
- **ESLint Configuration**: Resolved ES modules compatibility issues
- **Build Process**: Fixed PostCSS configuration for Tailwind v4

### Technical
- **ES Modules**: Added `"type": "module"` to all package.json files
- **Tailwind v4**: Integrated `@tailwindcss/postcss` plugin
- **Shared Styles**: Created `packages/tailwind-config/shared-styles.css`
- **Storybook Config**: Updated `.storybook/main.js` for ES modules
- **Git Ignore**: Added `storybook-static/` to exclude build output

## [1.1.0] - 2025-07-27

### Added
- Personal branding with `@xidoke` namespace
- Comprehensive versioning guide and documentation
- Automated tag creation and version bumping scripts
- Enhanced ESLint configuration with Turbo support
- Improved Prettier configuration

### Changed
- Renamed all packages from `@repo/*` to `@xidoke/*`
- Updated all import statements and dependencies
- Enhanced `.cursorrules` with v0 intelligence and monorepo best practices
- Improved `.prettierignore` configuration

### Fixed
- Resolved ESLint turbo plugin configuration conflicts
- Fixed TypeScript compilation issues
- Updated pnpm-lock.yaml with new package names

### Technical
- Added `docs/versioning-guide.md` - Comprehensive versioning documentation
- Added `scripts/create-tag.sh` - Automated tag creation with validation
- Added `scripts/bump-version.sh` - Automated version bumping across monorepo
- Added `CHANGELOG.md` - Version history tracking

## [1.0.0] - 2025-07-27

### Added
- Initial monorepo setup with Turborepo
- Next.js 15 applications (web and docs)
- Shared UI components package (`@xidoke/ui`)
- ESLint configuration package (`@xidoke/eslint-config`)
- TypeScript configuration package (`@xidoke/typescript-config`)
- pnpm workspace configuration
- Comprehensive development tooling

### Features
- **Monorepo Structure**: Organized apps and packages
- **Next.js Apps**: Two separate applications (web, docs)
- **Shared Components**: Reusable UI components
- **Code Quality**: ESLint, Prettier, TypeScript setup
- **Build System**: Turborepo for efficient builds
- **Package Management**: pnpm with workspace support

### Technical Stack
- **Framework**: Next.js 15 with App Router
- **Language**: TypeScript
- **Styling**: Tailwind CSS
- **UI Components**: shadcn/ui
- **Build Tool**: Turborepo
- **Package Manager**: pnpm
- **Linting**: ESLint with custom configs
- **Formatting**: Prettier

### Development Tools
- **Type Checking**: TypeScript strict mode
- **Code Quality**: ESLint with Turbo and Next.js rules
- **Formatting**: Prettier with custom configuration
- **Git Hooks**: Pre-commit validation
- **IDE Support**: VS Code configuration

---

## Version Categories

### Major Versions (X.0.0)
Breaking changes that require migration or major updates.

### Minor Versions (1.X.0)
New features and improvements that are backward compatible.

### Patch Versions (1.0.X)
Bug fixes and small improvements that are backward compatible.

## Migration Guides

### From v1.0.0 to v1.1.0
- Update all import statements from `@repo/*` to `@xidoke/*`
- Reinstall dependencies: `pnpm install`
- Update any custom configurations referencing old package names

## Contributing

Khi thêm tính năng mới hoặc sửa lỗi, hãy cập nhật CHANGELOG.md theo format:

```markdown
## [Version] - YYYY-MM-DD

### Added
- New features

### Changed
- Changes in existing functionality

### Deprecated
- Soon-to-be removed features

### Removed
- Removed features

### Fixed
- Bug fixes

### Security
- Security improvements
``` 