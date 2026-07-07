cask "omniroute-tray" do
  version "0.1.8"
  sha256 "3d8fc08fe49e9c3e7e0859553fe793b157337062db8ea655b0eb443970e8eeb2"

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
