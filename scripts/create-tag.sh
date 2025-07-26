#!/bin/bash

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# Check if required arguments are provided
VERSION=$1
MESSAGE=$2

if [ -z "$VERSION" ] || [ -z "$MESSAGE" ]; then
    print_error "Usage: ./scripts/create-tag.sh <version> <message>"
    echo ""
    print_info "Examples:"
    echo "  ./scripts/create-tag.sh v1.1.0 'feat: add dark mode support'"
    echo "  ./scripts/create-tag.sh v1.0.1 'fix: resolve ESLint configuration'"
    echo "  ./scripts/create-tag.sh v2.0.0 'breaking: migrate to Next.js 15'"
    echo ""
    print_info "Version format: v<MAJOR>.<MINOR>.<PATCH>"
    echo "  - MAJOR: Breaking changes"
    echo "  - MINOR: New features (backward compatible)"
    echo "  - PATCH: Bug fixes (backward compatible)"
    exit 1
fi

# Validate version format
if [[ ! $VERSION =~ ^v[0-9]+\.[0-9]+\.[0-9]+(-[a-zA-Z0-9.-]+)?$ ]]; then
    print_error "Invalid version format: $VERSION"
    print_info "Expected format: v<MAJOR>.<MINOR>.<PATCH> or v<MAJOR>.<MINOR>.<PATCH>-<PRERELEASE>"
    exit 1
fi

print_info "Creating tag: $VERSION"
print_info "Message: $MESSAGE"

# Check if working directory is clean
if [ -n "$(git status --porcelain)" ]; then
    print_error "Working directory is not clean"
    echo ""
    print_info "Current status:"
    git status
    echo ""
    print_info "Please commit or stash your changes before creating a tag"
    exit 1
fi

# Check if tag already exists
if git tag --list | grep -q "^$VERSION$"; then
    print_error "Tag $VERSION already exists"
    print_info "Existing tags:"
    git tag --list | grep "$VERSION"
    exit 1
fi

# Check if we're on main branch
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "main" ]; then
    print_warning "You're not on main branch (current: $CURRENT_BRANCH)"
    read -p "Do you want to continue? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_info "Tag creation cancelled"
        exit 1
    fi
fi

# Run tests before creating tag
print_info "Running tests..."
if command -v pnpm &> /dev/null; then
    if pnpm run test 2>/dev/null; then
        print_status "Tests passed"
    else
        print_warning "Tests failed or not configured"
        read -p "Do you want to continue anyway? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            print_info "Tag creation cancelled"
            exit 1
        fi
    fi
else
    print_warning "pnpm not found, skipping tests"
fi

# Create tag
print_info "Creating tag..."
if git tag -a "$VERSION" -m "$MESSAGE"; then
    print_status "Tag created successfully"
else
    print_error "Failed to create tag"
    exit 1
fi

# Push tag to remote
print_info "Pushing tag to remote..."
if git push origin "$VERSION"; then
    print_status "Tag pushed successfully"
else
    print_error "Failed to push tag"
    print_info "You can push manually with: git push origin $VERSION"
    exit 1
fi

# Show tag information
echo ""
print_status "Tag $VERSION created and pushed successfully!"
echo ""
print_info "Tag details:"
git show "$VERSION" --stat

# Suggest next steps
echo ""
print_info "Next steps:"
echo "  - Create a GitHub release for $VERSION"
echo "  - Update CHANGELOG.md"
echo "  - Deploy to production (if applicable)"
echo ""
print_info "To view all tags: git tag --list"
print_info "To show tag details: git show $VERSION" 