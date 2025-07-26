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

# Check if required argument is provided
TYPE=$1

if [ -z "$TYPE" ]; then
    print_error "Usage: ./scripts/bump-version.sh [major|minor|patch]"
    echo ""
    print_info "Version types:"
    echo "  major   - Breaking changes (1.0.0 -> 2.0.0)"
    echo "  minor   - New features (1.0.0 -> 1.1.0)"
    echo "  patch   - Bug fixes (1.0.0 -> 1.0.1)"
    echo ""
    print_info "Examples:"
    echo "  ./scripts/bump-version.sh patch"
    echo "  ./scripts/bump-version.sh minor"
    echo "  ./scripts/bump-version.sh major"
    exit 1
fi

# Validate version type
case $TYPE in
    major|minor|patch)
        ;;
    *)
        print_error "Invalid version type: $TYPE"
        print_info "Valid types: major, minor, patch"
        exit 1
        ;;
esac

print_info "Bumping version type: $TYPE"

# Check if working directory is clean
if [ -n "$(git status --porcelain)" ]; then
    print_error "Working directory is not clean"
    echo ""
    print_info "Current status:"
    git status
    echo ""
    print_info "Please commit or stash your changes before bumping version"
    exit 1
fi

# Get current version from root package.json
if [ ! -f "package.json" ]; then
    print_error "package.json not found in root directory"
    exit 1
fi

CURRENT_VERSION=$(node -p "require('./package.json').version")
if [ -z "$CURRENT_VERSION" ]; then
    print_error "Could not read current version from package.json"
    exit 1
fi

print_info "Current version: $CURRENT_VERSION"

# Calculate new version
case $TYPE in
    major)
        NEW_VERSION=$(node -e "
            const version = '$CURRENT_VERSION';
            const parts = version.split('.');
            parts[0] = parseInt(parts[0]) + 1;
            parts[1] = 0;
            parts[2] = 0;
            console.log(parts.join('.'));
        ")
        ;;
    minor)
        NEW_VERSION=$(node -e "
            const version = '$CURRENT_VERSION';
            const parts = version.split('.');
            parts[1] = parseInt(parts[1]) + 1;
            parts[2] = 0;
            console.log(parts.join('.'));
        ")
        ;;
    patch)
        NEW_VERSION=$(node -e "
            const version = '$CURRENT_VERSION';
            const parts = version.split('.');
            parts[2] = parseInt(parts[2]) + 1;
            console.log(parts.join('.'));
        ")
        ;;
esac

print_info "New version: $NEW_VERSION"

# Confirm version bump
echo ""
print_warning "This will bump version from $CURRENT_VERSION to $NEW_VERSION"
read -p "Do you want to continue? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    print_info "Version bump cancelled"
    exit 1
fi

# Update root package.json
print_info "Updating root package.json..."
if node -e "
    const fs = require('fs');
    const pkg = JSON.parse(fs.readFileSync('package.json', 'utf8'));
    pkg.version = '$NEW_VERSION';
    fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2) + '\n');
"; then
    print_status "Root package.json updated"
else
    print_error "Failed to update root package.json"
    exit 1
fi

# Update package versions in monorepo
print_info "Updating package versions in monorepo..."

# Function to update package version
update_package_version() {
    local package_path=$1
    local package_name=$2
    
    if [ -f "$package_path/package.json" ]; then
        print_info "Updating $package_name..."
        if node -e "
            const fs = require('fs');
            const pkg = JSON.parse(fs.readFileSync('$package_path/package.json', 'utf8'));
            pkg.version = '$NEW_VERSION';
            fs.writeFileSync('$package_path/package.json', JSON.stringify(pkg, null, 2) + '\n');
        "; then
            print_status "$package_name updated to $NEW_VERSION"
        else
            print_warning "Failed to update $package_name"
        fi
    fi
}

# Update all packages
update_package_version "packages/ui" "@xidoke/ui"
update_package_version "packages/eslint-config" "@xidoke/eslint-config"
update_package_version "packages/typescript-config" "@xidoke/typescript-config"

# Update apps (if they have version field)
update_package_version "apps/web" "web"
update_package_version "apps/docs" "docs"

# Commit version changes
print_info "Committing version changes..."
if git add . && git commit -m "chore: bump version to $NEW_VERSION"; then
    print_status "Version changes committed"
else
    print_error "Failed to commit version changes"
    exit 1
fi

# Show summary
echo ""
print_status "Version bumped successfully from $CURRENT_VERSION to $NEW_VERSION!"
echo ""
print_info "Next steps:"
echo "  - Create tag: ./scripts/create-tag.sh v$NEW_VERSION 'your message'"
echo "  - Push changes: git push origin main"
echo "  - Create GitHub release"
echo "  - Update CHANGELOG.md"
echo ""
print_info "To view changes: git log --oneline -5"
print_info "To revert: git reset --hard HEAD~1" 