# =========================================================
# fzf
# =========================================================

# UI
export _FZF_PREVIEW_CMD='bat --color=always --style=plain,numbers --line-range=:500 {}'
export FZF_DEFAULT_OPTS='
  --ansi
  --cycle
  --height=60%
  --layout=reverse
  --border=rounded
  --info=inline-right
  --bind="ctrl-/:toggle-preview"
  --bind="ctrl-u:preview-up,ctrl-d:preview-down"
  --bind="ctrl-space:toggle+down"
  --preview-window=right:65%:wrap:border-left
  --color=bg+:#363A4F,bg:#24273A,spinner:#f0c6c6,hl:#A6DA95
  --color=fg:#CAD3F5,header:#A6DA95,info:#C6A0F6,pointer:#f0c6c6
  --color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#A6DA95
  --color=selected-bg:#494D64
  --color=border:#6E738D,label:#CAD3F5
'

# Ctrl+T: file search
export FZF_DEFAULT_COMMAND='fd --type f --exclude .git --hidden --strip-cwd-prefix --color=always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="
  --preview '$_FZF_PREVIEW_CMD'
  --bind 'alt-h:reload(fd --type f --unrestricted --strip-cwd-prefix --color=always)'
  --bind 'alt-f:reload(fd --type f --strip-cwd-prefix --color=always)'
  --bind 'alt-d:reload(fd --type d --hidden --exclude .git --strip-cwd-prefix --color=always)'
  "

# Alt-C: cd into directory
export FZF_ALT_C_COMMAND="fd --type d --hidden --exclude .git --strip-cwd-prefix --color=always"
export FZF_ALT_C_OPTS="--preview 'eza --all --tree --ignore-glob '.git' --color=always --icons=always {}'"

# Ctrl-R: history search
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-y:execute-silent(echo -n {2..} | wl-copy)+abort'
"

# Ctrl-G: ripgrep search
_fzf_ripgrep() {
  local rg_prefix='rg --hidden --glob '!.git/' --column --line-number --no-heading --color=always --smart-case'
  fzf --ansi --disabled --query "" \
    --bind "start:reload:$rg_prefix {q}" \
    --bind "change:reload:sleep 0.1; $rg_prefix {q} || true" \
    --delimiter : \
    --preview 'bat --color=always --highlight-line {2} {1}' \
    --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
    --bind "enter:become(${EDITOR:-nvim} {1} +{2})"
  zle reset-prompt
}
zle -N _fzf_ripgrep

# Ctrl+Z: fuzzy-pick a zoxide-ranked directory
_zoxide_interactive() {
  local selected
  local dir

  selected=$(
    zoxide query -ls |
      awk -v home="$HOME" '{
        score = $1
        $1 = ""
        sub(/^[ \t]+/, "")
        path = $0

        if (index(path, home) == 1)
          path = "~" substr(path, length(home) + 1)

        printf "\033[38;2;238;212;159m%8.2f\033[0m\t%s\n", score, path
      }' |
      fzf \
        --no-sort \
        --prompt='zoxide > ' \
        --preview='dir={2}; dir="${dir/#\~/$HOME}"; eza --all --tree --git-ignore --level=2 --color=always --icons=always "$dir"'
  )

  if [[ -n "$selected" ]]; then
    dir=$(printf '%s\n' "$selected" | sed 's/^[[:space:]]*[0-9.]*[[:space:]]*//')
    dir="${dir/#\~/$HOME}"
    cd -- "$dir"
  fi

  zle reset-prompt
}
zle -N _zoxide_interactive

