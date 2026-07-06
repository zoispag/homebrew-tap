cask "omniroute-tray" do
  version "0.1.6"
  sha256 "e543da38de70d6163528f19b477cd66c0c0acb5ece6b61b7c4856a3182ce3e66"

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
