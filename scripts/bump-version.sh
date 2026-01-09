#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "Error: Version argument required"
  exit 1
fi

NEW_VERSION="$1"

echo "📦 Bumping version to $NEW_VERSION..."
echo ""

# Update version in Xcode project
sed -i '' "s/MARKETING_VERSION = [^;]*;/MARKETING_VERSION = $NEW_VERSION;/g" show-diff-timezone/show-diff-timezone.xcodeproj/project.pbxproj

# Update version in pyproject.toml
sed -i '' "s/^version = .*/version = \"$NEW_VERSION\"/" pyproject.toml

echo "✅ Version files updated to $NEW_VERSION"
echo ""

# Check if there are changes
if git diff --quiet; then
  echo "⚠️  No changes detected. Version might already be set."
  exit 0
fi

# Show changes
echo "📝 Changes:"
git diff show-diff-timezone/show-diff-timezone.xcodeproj/project.pbxproj pyproject.toml
echo ""

# Commit changes
echo "💾 Committing changes..."
git add show-diff-timezone/show-diff-timezone.xcodeproj/project.pbxproj pyproject.toml
git commit -m "🔖 Bump version to $NEW_VERSION"

# Push to main
echo "⬆️  Pushing to main..."
git push origin main

# Create and push tag
echo "🏷️  Creating tag v$NEW_VERSION..."
git tag "v$NEW_VERSION"
git push origin "v$NEW_VERSION"

# Create GitHub release
echo "🚀 Creating GitHub release..."
gh release create "v$NEW_VERSION" --generate-notes --title "v$NEW_VERSION"

echo ""
echo "✨ Release v$NEW_VERSION created successfully!"
echo ""