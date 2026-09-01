cask "dodb" do
  version "0.4.1"
  sha256 "1cfa10ad54a6f4513680d757080d3398f801061b6f7f42e051b6fba8ce309306"

  url "https://github.com/thutil/dodb/releases/download/v#{version}/dodb_#{version}_universal.dmg"
  name "dodb"
  desc "Modern Multi-Platform Database Manager for Postgres, MySQL, MariaDB & SQLite"
  homepage "https://github.com/thutil/dodb"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app does not update itself yet, so brew must be allowed to
  # replace it. Flip to true only once the in-app updater ships:
  # claiming it now leaves `brew upgrade --cask dodb` users stale.
  auto_updates false
  depends_on macos: ">= :sonoma"

  app "dodb.app"

  zap trash: [
    # Saved connections and the master key that decrypts their
    # passwords. Omitting this left credentials on disk after uninstall.
    "~/.dodb",
    "~/Library/Application Support/com.thutil.dodb",
    "~/Library/Caches/com.thutil.dodb",
    "~/Library/Preferences/com.thutil.dodb.plist",
    "~/Library/Saved Application State/com.thutil.dodb.savedState",
    "~/Library/WebKit/com.thutil.dodb",
  ]
end
