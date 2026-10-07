# --------- Package manager ---------
source '/usr/share/zsh-antidote/antidote.zsh'
antidote load

# --------- Colors ---------
export BAT_THEME=tokyonight_moon
export LS_COLORS="$(vivid generate catppuccin-macchiato)"

# --------- Completion ---------
mkdir -p "$XDG_CACHE_HOME/zsh"
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

zstyle ':completion:*' menu select # navigable menu instead of just cycling
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case-insensitive matching
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' verbose yes
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*:messages' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'
# NOTE: Possibly change messages and warnings

# Processes
zstyle ':completion:*:processes' command 'ps -e'

# Git
zstyle ':completion:*:git-checkout:*' sort false

# fzf-tab
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:complete:cd:*' \
  fzf-preview 'eza --all --tree --ignore-glob ".git" --color=always --icons=always $realpath'

# --------- History ---------
mkdir -p "$XDG_DATA_HOME/zsh"
HISTFILE="$XDG_DATA_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# --------- Shell behavior ---------
setopt NOBEEP
setopt NUMERIC_GLOB_SORT

# --------- Pager ---------
if command -v bat >/dev/null 2>&1; then
  export MANPAGER="bat -l man -p"
fi

# --------- Shell integrations ---------
eval "$(zoxide init --cmd cd zsh)"
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.json)"

# --------- Modular configs ---------
# fzf + anything with bindkey calls must load AFTER zsh-vi-mode
function zvm_after_init() {
  eval "$(fzf --zsh)"
  source "$ZDOTDIR/binds.zsh"
}
source "$ZDOTDIR/fzf.zsh"
source "$ZDOTDIR/aliases.zsh"
