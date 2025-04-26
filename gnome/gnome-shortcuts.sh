gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Shift><Control><Alt><Super>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Shift><Control><Alt><Super>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Shift><Control><Alt><Super>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Shift><Control><Alt><Super>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Shift><Control><Alt><Super>5']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 "['<Shift><Control><Alt><Super>6']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Shift><Control><Alt><Super>bracketleft']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Shift><Control><Alt><Super>bracketright']"

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Shift><Alt><Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Shift><Alt><Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Shift><Alt><Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Shift><Alt><Super>4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Shift><Alt><Super>5']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Shift><Alt><Super>6']"

gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Super>f']"
gsettings set org.gnome.desktop.wm.keybindings close "['<Shift><Super>q']"
gsettings set org.gnome.desktop.wm.keybindings cycle-windows "['<Super>Space']"
gsettings set org.gnome.desktop.wm.keybindings cycle-windows-backward "['<Control><Super>Space']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "[]"
gsettings set org.gnome.desktop.wm.keybindings activate-window-menu "[]"

# Set settings
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 6
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.interface enable-hot-corners "false"
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface clock-format "24h"
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click false
gsettings set org.gnome.desktop.peripherals.keyboard numlock-state true
gsettings set org.gnome.desktop.peripherals.keyboard remember-numlock-state true
gsettings set org.gnome.shell favorite-apps ['Alacritty.desktop', 'app.zen_browser.zen.desktop', 'com.discordapp.Discord.desktop', 'md.obsidian.Obsidian.desktop', 'com.spotify.Client.desktop', 'org.gnome.Nautilus.desktop']
gsettings set org.gnome.shell.weather locations "[<(uint32 2, <('Paris', 'LFPB', true, [(0.85462956287765413, 0.042760566673861078)], [(0.8528842336256599, 0.040724343395436846)])>)>]"
gsettings set org.gnome.shell.world-clocks locations "[<(uint32 2, <('Montreal', 'CYUL', true, [(0.79354303905785273, -1.2871803233458181)], [(0.79354303905785273, -1.2871803233458181)])>)>, <(uint32 2, <('London', 'EGWU', true, [(0.89971722940307675, -0.007272211034407213)], [(0.89884456477707964, -0.0020362232784242244)])>)>]"
gsettings set org.gnome.desktop.interface accent-color 'green'
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'fr+ergol'), ('xkb', 'us'), ('xkb', 'fr+azerty')]"
gsettings set org.gnome.desktop.privacy remove-old-temp-files true
gsettings set org.gnome.desktop.privacy remove-old-trash-files true

# Disable suspend
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
