cask "omniroute-tray" do
  version "0.1.4"
  sha256 "3bed58dc4ed6d5590ec64ae29839b0f5dc18bb0b70b6b7972b522a0b19c4885a"

  url "https://github.com/zoispag/omniroute-tray/releases/download/v#{version}/OmniRouteTray_#{version}_aarch64.dmg"
  name "OmniRouteTray"
  desc "Menu bar app that supervises, monitors, and auto-updates the OmniRoute AI router"
  homepage "https://github.com/zoispag/omniroute-tray"

  depends_on macos: :ventura

  app "OmniRouteTray.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/OmniRouteTray.app"],
                   sudo: false
  end

  uninstall quit: "dev.omniroute.tray"

  zap trash: [
    "~/Library/Application Support/dev.omniroute.tray",
    "~/Library/LaunchAgents/dev.omniroute.tray.plist",
  ]
end
