# My setup

The instructions are for fedora, using dnf, but you can obviously use any other stuff, this is standard unix stuff, nothing complex.

## Linux install step

Run normal install with username `pohl`.

Set a very simple password that will be changed after setup.

## Fedora setup step

```bash
sudo dnf update -y
```

Then setup Firefox:
- install [addons](https://addons.mozilla.org): vimium c, bitwarden, I don't care about cookies, ublock origin, sidebery, unhook
    - configure only bitwarden and unhook
- Log in to google, firefox, github.com
- `ssh-keygen` and copy `id_rsa.pub` to github.com
- Clone dotfiles repo
- Setup firefox_stuff (there's a Readme...)
- Wait because there will be a reboot

After reboot:

Installation stuff:
```bash
sudo dnf install -y clang awesome kitty neovim vim stow nodejs stack zsh openssl fd-find ripgrep syncthing
# and in another terminal:
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install du-dust bat exa pomors bacon sccache
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.discordapp.Discord md.obsidian.Obsidian com.spotify.Client com.getpostman.Postman org.mozilla.Thunderbird
```

Stow your stuff

Various stuff:
```bash
sudo usermod -s /usr/bin/zsh pohl
sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/home:mkittler/Fedora_38/home:mkittler.repo
sudo dnf install syncthingtray
```

Kmonad:
```bash
git clone git@github.com:kmonad/kmonad.git ~/.local/git/kmonad && cd ~/.local/git/kmonad && stack install
sudo cp ~/.local/bin/kmonad /usr/bin/ && sudo cp ~/dotfiles/kmonad/.config/kmonad/kmonad.service /etc/systemd/system/ && sudo systemctl daemon-reload && sudo systemctl enable kmonad && sudo systemctl start kmonad
```

Docker:
```bash
sudo dnf remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Hyprland:

### binary install

1. install deps: `sudo dnf install ninja-build cmake meson gcc-c++ libxcb-devel libX11-devel pixman-devel cairo-devel pango-devel wayland-devel libdrm-devel libxkbcommon-devel mesa-libEGL-devel libinput-devel rust-libudev-devel wlroots-devel xdg-desktop-portal-wlr xorg-x11-server-Xwayland-devel hwdata-devel libdisplay-info-devel`

I also needed [v1.32 of wayland-protocols](https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/w/wayland-protocols-devel-1.32-2.fc39.noarch.rpm). Download and `sudo dnf localinstall file`
2. clone: `git clone --recursive https://github.com/hyprwm/Hyprland.git`
3. checkout latest tag: `git checkout --recursive tags/v0.29.1` (the --recursive may not be necessary)
4. in the project root: `meson setup _build`
5. in the project root: `sudo ninja -C _build install`

### Extra programs

sudo dnf install waybar wofi dunst

git clone https://github.com/Horus645/swww.git && cd swww && cargo build --release
cp target/release/swww target/release/swww-daemon ~/.local/bin

pip install pywal
