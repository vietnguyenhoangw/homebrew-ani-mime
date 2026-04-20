cask "ani-mime" do
  version "0.17.0"

  on_arm do
    sha256 "6a54c312957ef99fbb8dda71b51d3da5391d1c38754a35ff7b76a83ca8b98804"
    url "https://github.com/vietnguyenhoangw/ani-mime/releases/download/v#{version}/ani-mime_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "aa140fdee7eae852901d78df9ae681fa8403c57df26e8578be91bbab98c505f9"
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
