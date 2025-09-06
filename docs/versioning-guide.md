# Versioning Guide - Quản lý Phiên bản và Git Tags

## Tổng quan

Tài liệu này hướng dẫn cách quản lý phiên bản và Git tags cho dự án monorepo `xidoke-ui`. Việc quản lý versioning đúng cách giúp:

- Theo dõi lịch sử thay đổi
- Dễ dàng rollback khi cần
- Tạo releases có ý nghĩa
- Hỗ trợ team collaboration

## Semantic Versioning (SemVer)

Chúng ta sử dụng [Semantic Versioning](https://semver.org/lang/vi/) với format: `MAJOR.MINOR.PATCH`

### Quy tắc Versioning

```
v1.2.3
│ │ │
│ │ └── PATCH: Sửa lỗi nhỏ, không breaking changes
│ └──── MINOR: Thêm tính năng mới, backward compatible
└────── MAJOR: Breaking changes, không backward compatible
```

### Ví dụ thực tế

- `v1.0.0` - Phiên bản đầu tiên, stable
- `v1.1.0` - Thêm tính năng mới (dark mode)
- `v1.1.1` - Sửa lỗi nhỏ (fix typo)
- `v2.0.0` - Breaking changes (thay đổi API)

## Git Tags Strategy

### 1. Tag Naming Convention

```
v{MAJOR}.{MINOR}.{PATCH}[-{PRERELEASE}][-{DESCRIPTION}]
```

#### Ví dụ:

```bash
# Stable releases
v1.0.0
v1.1.0
v2.0.0

# Pre-releases
v1.0.0-alpha.1
v1.0.0-beta.1
v1.0.0-rc.1

# Descriptive tags
v1.0.0-monorepo-template
v1.1.0-personal-branding
v2.0.0-major-refactor
```

### 2. Tag Categories

#### **Stable Releases** (Production Ready)
```bash
v1.0.0
v1.1.0
v2.0.0
```
- Sử dụng cho releases chính thức
- Code đã được test kỹ
- Có thể deploy production

#### **Template Tags** (Reusable Templates)
```bash
v1.0.0-monorepo-template
v1.1.0-nextjs-setup
v2.0.0-full-stack-template
```
- Đánh dấu các milestone quan trọng
- Có thể tái sử dụng làm template
- Mô tả rõ tính năng chính

#### **Development Tags** (Internal Use)
```bash
v1.0.0-alpha.1
v1.0.0-beta.1
v1.0.0-rc.1
```
- Sử dụng trong quá trình development
- Chưa ready cho production
- Để test và feedback

## Workflow Quản lý Tags

### 1. Khi nào tạo tag?

#### **MAJOR Version (v2.0.0)**
- Breaking changes trong API
- Thay đổi cấu trúc dự án lớn
- Migration cần thiết

#### **MINOR Version (v1.1.0)**
- Thêm tính năng mới
- Cải thiện performance
- Thêm dependencies mới

#### **PATCH Version (v1.0.1)**
- Sửa lỗi bugs
- Cập nhật documentation
- Cải thiện nhỏ

### 2. Quy trình tạo tag

```bash
# 1. Đảm bảo code sạch
git status
git add .
git commit -m "feat: add new feature"

# 2. Push code
git push origin main

# 3. Tạo tag
git tag -a v1.1.0 -m "feat: add dark mode support"

# 4. Push tag
git push origin v1.1.0
```

### 3. Tag Message Convention

```bash
# Format
git tag -a v{VERSION} -m "{TYPE}: {DESCRIPTION}"

# Ví dụ
git tag -a v1.1.0 -m "feat: add dark mode and theme switching"
git tag -a v1.0.1 -m "fix: resolve ESLint configuration issues"
git tag -a v2.0.0 -m "breaking: migrate to Next.js 15 and new API structure"
```

## Monorepo Specific Guidelines

### 1. Package Versioning

Trong monorepo, mỗi package có thể có version riêng:

```json
// packages/ui/package.json
{
  "name": "@xidoke/ui",
  "version": "1.1.0"
}

// packages/eslint-config/package.json
{
  "name": "@xidoke/eslint-config", 
  "version": "1.0.1"
}
```

### 2. Root Version vs Package Versions

- **Root version**: Đánh dấu trạng thái tổng thể của monorepo
- **Package versions**: Đánh dấu thay đổi của từng package

### 3. Release Strategy

#### **Synchronized Releases**
```bash
# Tất cả packages cùng version
v1.1.0 - @xidoke/ui@1.1.0, @xidoke/eslint-config@1.1.0
```

#### **Independent Releases**
```bash
# Mỗi package version riêng
v1.1.0 - @xidoke/ui@1.1.0, @xidoke/eslint-config@1.0.1
```

## Practical Examples

### Ví dụ 1: Thêm tính năng mới

```bash
# 1. Develop feature
git checkout -b feat/add-authentication
# ... code changes ...
git commit -m "feat: add NextAuth authentication"

# 2. Merge to main
git checkout main
git merge feat/add-authentication

# 3. Create MINOR version tag
git tag -a v1.2.0 -m "feat: add NextAuth authentication with Google and GitHub providers"
git push origin v1.2.0
```

### Ví dụ 2: Sửa lỗi

```bash
# 1. Fix bug
git checkout -b fix/eslint-config
# ... fix changes ...
git commit -m "fix: resolve ESLint plugin conflict"

# 2. Merge to main
git checkout main
git merge fix/eslint-config

# 3. Create PATCH version tag
git tag -a v1.1.1 -m "fix: resolve ESLint turbo plugin configuration conflict"
git push origin v1.1.1
```

### Ví dụ 3: Breaking changes

```bash
# 1. Major refactor
git checkout -b breaking/migrate-nextjs-15
# ... breaking changes ...
git commit -m "breaking: migrate to Next.js 15 and update all dependencies"

# 2. Merge to main
git checkout main
git merge breaking/migrate-nextjs-15

# 3. Create MAJOR version tag
git tag -a v2.0.0 -m "breaking: migrate to Next.js 15, update React 19, and restructure API"
git push origin v2.0.0
```

## Template Tags Strategy

### 1. Milestone Templates

```bash
# Initial setup
v1.0.0-monorepo-template

# Personal branding
v1.1.0-personal-branding

# Full stack setup
v2.0.0-full-stack-template

# Production ready
v2.1.0-production-ready
```

### 2. Feature Templates

```bash
# Authentication setup
v1.2.0-auth-template

# Database integration
v1.3.0-database-template

# API setup
v1.4.0-api-template
```

## Automation với Scripts

### 1. Tag Creation Script

Tạo file `scripts/create-tag.sh`:

```bash
#!/bin/bash

VERSION=$1
MESSAGE=$2

if [ -z "$VERSION" ] || [ -z "$MESSAGE" ]; then
    echo "Usage: ./scripts/create-tag.sh <version> <message>"
    echo "Example: ./scripts/create-tag.sh v1.1.0 'feat: add dark mode'"
    exit 1
fi

# Ensure clean working directory
if [ -n "$(git status --porcelain)" ]; then
    echo "Error: Working directory is not clean"
    git status
    exit 1
fi

# Create and push tag
git tag -a "$VERSION" -m "$MESSAGE"
git push origin "$VERSION"

echo "✅ Tag $VERSION created and pushed successfully!"
```

### 2. Version Bump Script

Tạo file `scripts/bump-version.sh`:

```bash
#!/bin/bash

TYPE=$1

case $TYPE in
    major|minor|patch)
        # Bump version in package.json files
        npm version $TYPE --no-git-tag-version
        
        # Get new version
        NEW_VERSION=$(node -p "require('./package.json').version")
        
        echo "✅ Version bumped to $NEW_VERSION"
        echo "📝 Don't forget to create tag: git tag -a v$NEW_VERSION -m 'your message'"
        ;;
    *)
        echo "Usage: ./scripts/bump-version.sh [major|minor|patch]"
        exit 1
        ;;
esac
```

## Best Practices

### 1. Tag Management

- ✅ **Luôn có message mô tả rõ ràng**
- ✅ **Test trước khi tạo tag**
- ✅ **Sử dụng conventional commits**
- ✅ **Tag ngay sau khi merge**

- ❌ **Không tag code chưa test**
- ❌ **Không tag với message không rõ ràng**
- ❌ **Không tag trực tiếp trên feature branch**

### 2. Version Planning

- **Lên kế hoạch version trước**
- **Thảo luận breaking changes với team**
- **Document migration guides cho major versions**
- **Maintain changelog**

### 3. Release Notes

Tạo file `CHANGELOG.md`:

```markdown
# Changelog

## [2.0.0] - 2024-01-15
### Breaking Changes
- Migrate to Next.js 15
- Update React to version 19
- Restructure API endpoints

### Added
- Dark mode support
- New authentication system

### Fixed
- TypeScript compilation errors

## [1.1.0] - 2024-01-10
### Added
- Personal branding (@xidoke namespace)
- Comprehensive tooling setup

### Changed
- Rename @repo to @xidoke across monorepo
```

## Troubleshooting

### 1. Xóa tag sai

```bash
# Xóa tag local
git tag -d v1.0.0

# Xóa tag remote
git push origin --delete v1.0.0
```

### 2. Sửa tag message

```bash
# Tạo tag mới với message đúng
git tag -d v1.0.0
git tag -a v1.0.0 -m "Correct message"
git push origin --delete v1.0.0
git push origin v1.0.0
```

### 3. List và filter tags

```bash
# List all tags
git tag --list

# List tags matching pattern
git tag --list "v1.*"

# Show tag details
git show v1.0.0
```

## Kết luận

Việc quản lý tags và versioning đúng cách giúp:

1. **Tracking**: Theo dõi lịch sử thay đổi
2. **Rollback**: Dễ dàng quay lại version cũ
3. **Collaboration**: Team hiểu rõ thay đổi
4. **Deployment**: Deploy đúng version
5. **Documentation**: Lưu trữ thông tin có hệ thống

Hãy tuân thủ các quy tắc này để maintain một codebase có tổ chức và dễ quản lý! 🚀 