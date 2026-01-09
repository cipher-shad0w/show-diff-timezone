cask "show-diff-timezone" do
  version "0.1.6"
  sha256 "d5d28aab9435cf8a73f709e2bad9853424ed645b65874b0e2a0584c56cb3745a"

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
