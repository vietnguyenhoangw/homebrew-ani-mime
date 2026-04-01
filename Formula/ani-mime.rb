cask "ani-mime" do
  version "0.1.0"
  sha256 :no_check # Updated automatically by CI

  url "https://github.com/vietnguyenhoangw/ani-mime/releases/download/v#{version}/ani-mime_#{version}_aarch64.dmg",
      verified: "github.com/vietnguyenhoangw/ani-mime/"
  name "Ani-Mime"
  desc "Floating macOS status pill that tracks terminal & Claude Code activity"
  homepage "https://github.com/vietnguyenhoangw/ani-mime"

  app "ani-mime.app", target: "Ani-Mime.app"

  postflight do
    # Install zsh hooks
    system_command "/bin/bash",
                   args: ["-c", "#{appdir}/Ani-Mime.app/Contents/Resources/script/install-hook.sh"],
                   sudo: false
  end

  uninstall quit: "com.vietnguyenwsilentium.ani-mime"

  zap trash: [
    "~/Library/Application Support/com.vietnguyenwsilentium.ani-mime",
    "~/Library/Caches/com.vietnguyenwsilentium.ani-mime",
  ]
end
