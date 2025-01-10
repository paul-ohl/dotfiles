if status is-interactive

  ###
  ### Configuration
  ###
  set -g fish_autosuggestion_enabled 0

  set EDITOR nvim
  set VISUAL nvim
  set LESSHISTFILE '-' # Less doesn't save history

  ###
  ### Aliases
  ###
  alias pbcopy 'wl-copy'
  alias pbpaste 'wl-paste'
  alias open 'xdg-open'
  alias weather 'curl wttr.in'

  alias p 'pnpm'
  alias dc 'docker compose'
  alias v 'nvim'
  alias e 'nvim'
  alias ports 'sudo ss -tulnp'
  alias s 'kitten ssh'
  alias c 'cargo'

  # systemd aliases
  alias sss 'sudo systemctl status'
  alias ssr 'sudo systemctl restart'
  alias sst 'sudo systemctl stop'

  # git aliases
  alias gcl '. gcl'
  alias gs 'git status'
  alias ga 'git add'
  alias gc 'git commit'
  alias gck 'git checkout'
  alias gb 'git branch'
  alias gp 'git push'
  alias gl 'git pull'
  alias glog 'git log --oneline --decorate --graph'
  alias gloga 'git log --oneline --decorate --graph --all'
  alias gr 'git rebase'
  alias gri 'git rebase --interactive'
  alias g- 'git switch -'
  alias lg 'lazygit'

  # aliases depending on Rust tools
  if command -v exa &> /dev/null;
    alias ls 'exa -F --icons'
    alias la 'exa -Fla --icons'
    alias l 'exa -lF --icons'
    alias ll 'exa -Fl --icons'
    # I think that fish's tree is better. We'll see.
    # alias tree 'exa -FT --icons'
  else
    alias ls 'ls --color'
    alias la 'ls -lAh'
    alias l 'ls -lh'
    alias ll 'ls -lh'
  end
  if command -v bat &> /dev/null;
    alias cat 'bat'
  end

  # Yt-dlp aliases
  alias zik-dl 'yt-dlp -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 -o "%(artist)s - %(title)s.%(ext)s"'

  # Folders aliases
  eval (grep -v "^#" "$HOME/.config/zsh/foldersrc" | awk '{print "alias " $1 " \"cd " $2 " && ls\"; "}' | tr -d '\n')

end
