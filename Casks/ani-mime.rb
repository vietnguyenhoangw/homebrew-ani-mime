cask "ani-mime" do
  version "0.16.3"

  on_arm do
    sha256 "f08ee18c6dd7a1bda5211f681cf6ad8b591a75c107583fda655dc6e99db94477"
    url "https://github.com/vietnguyenhoangw/ani-mime/releases/download/v#{version}/ani-mime_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "125d38d431a217f5b7c9f406edeb9b5527292604daf074854563210c44780359"
    url "https://github.com/vietnguyenhoangw/ani-mime/releases/download/v#{version}/ani-mime_#{version}_x64.dmg"
  end

  name "Ani-Mime"
  desc "Floating macOS status pill that tracks terminal & Claude Code activity"
  homepage "https://github.com/vietnguyenhoangw/ani-mime"

  app "ani-mime.app", target: "Ani-Mime.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Ani-Mime.app"]
  end

  uninstall quit: "com.vietnguyenwsilentium.ani-mime"

  zap trash: [
    "~/Library/Application Support/com.vietnguyenwsilentium.ani-mime",
    "~/Library/Caches/com.vietnguyenwsilentium.ani-mime",
  ]
end
