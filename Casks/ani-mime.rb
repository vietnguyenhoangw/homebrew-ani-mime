cask "ani-mime" do
  version "0.13.25"

  on_arm do
    sha256 "4ab0fbc7d372b73e91cbf774b248bdf37d68fadb2cd2610ab34051db6ebfae01"
    url "https://github.com/vietnguyenhoangw/ani-mime/releases/download/v#{version}/ani-mime_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "7e0a321e9775f50a1a77569071c649f13be6e7985e5401309a8a264ff1ef61df"
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
