cask "omniroute-tray" do
  version "0.1.19"
  sha256 "828e51460a1b34307d46ef99cd056b7e07b2dae3d6e0cd1b156265b6bc3a3717"

  url "https://github.com/zoispag/omniroute-tray/releases/download/v#{version}/OmniRouteTray_#{version}_aarch64.dmg"
  name "OmniRouteTray"
  desc "Menu bar app that supervises, monitors, and auto-updates the OmniRoute AI router"
  homepage "https://github.com/zoispag/omniroute-tray"

  depends_on macos: :ventura

  app "OmniRouteTray.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/OmniRouteTray.app"]
  end

  uninstall quit: "dev.omniroute.tray"

  zap trash: [
    "~/Library/Application Support/dev.omniroute.tray",
    "~/Library/LaunchAgents/dev.omniroute.tray.plist",
  ]
end
