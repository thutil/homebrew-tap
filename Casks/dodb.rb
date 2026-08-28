cask "dodb" do
  version "0.3.4"
  sha256 "2b412db9812f6fc56bb9e164587b6bdedfbb2c5434a555a25d8625d6cf0309ee"

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
  depends_on macos: ">= :big_sur"

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
