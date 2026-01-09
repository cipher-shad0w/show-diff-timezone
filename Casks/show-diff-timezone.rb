cask "show-diff-timezone" do
  version "0.1.0"
  sha256 ""

  url "https://github.com/cipher-shad0w/show-diff-timezone/releases/download/v#{version}/show-diff-timezone.zip"
  name "Show Diff Timezone"
  desc "macOS menu bar app showing time difference between Seattle and Berlin"
  homepage "https://github.com/cipher-shad0w/show-diff-timezone"

  app "show-diff-timezone.app"

  zap trash: [
    "~/Library/Preferences/com.show-diff-timezone.plist",
    "~/Library/Caches/com.show-diff-timezone",
  ]
end
