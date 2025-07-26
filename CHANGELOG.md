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

## [1.1.0] - 2024-01-27

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

## [1.0.0] - 2024-01-27

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