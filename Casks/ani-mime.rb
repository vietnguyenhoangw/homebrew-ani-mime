cask "ani-mime" do
  version "0.16.1"

  on_arm do
    sha256 "7a44b7595e812653c67b957ff3d9f72552bfdea346050731c655ac2eb9dd3229"
    url "https://github.com/vietnguyenhoangw/ani-mime/releases/download/v#{version}/ani-mime_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "eb62d3d23af0ef245c6e260a194c8d08c789e0fe308bdd8d9f28f1fa6b5b7b54"
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
