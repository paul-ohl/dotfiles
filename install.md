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
sudo dnf install -y clang awesome kitty neovim vim stow nodejs stack zsh openssl fd-find ripgrep
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
