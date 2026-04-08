cask "ani-mime" do
  version "0.14.15"

  on_arm do
    sha256 "d3e7cd820cd84fef7a6ad4e97b7dc879b3e9edeba542b359aefbfe9a5115704f"
    url "https://github.com/vietnguyenhoangw/ani-mime/releases/download/v#{version}/ani-mime_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "22fe8f2ee5ed1c8bf9b07c1f770a3f984e61e3f321ee7e1a3190c5f46995623c"
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
