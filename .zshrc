# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# For the kitty scrollback
export EDITOR=nvim


if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Directory to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if not already there
if [ ! -d "ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

#Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light jeffreytse/zsh-vi-mode

# Exit insert mode when typing 'jk' quickly
zvm_after_init_commands+=('
  zvm_bindkey viins "jk" zvm_exit_insert_mode
')



# load completions
autoload -U compinit && compinit


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.local/bin:$PATH"

# Keybindings
# bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward


# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups

#Connecting headsets
alias headsets_connect='~/scripts/headsets_connect.sh'

#Disconnecting headsets
alias headsets_disconnect='~/scripts/headsets_disconnect.sh'
alias ls="lsd"
alias c="clear"

# --- FZF WIDGETS ---

# 1️⃣ Ctrl+F — insert selected file into command line
fzf-insert-widget() {
  local selected
  selected=$(find . -type f | fzf --height 40% --reverse --preview 'bat --style=plain --color=always {} 2>/dev/null || ls --color=always {}') || return
  LBUFFER="$LBUFFER$selected"
  zle redisplay
}
zle -N fzf-insert-widget
bindkey '^F' fzf-insert-widget

# 2️⃣ Ctrl+Y — copy selected file path to clipboard (wl-copy)
fzf-copy-widget() {
  local selected
  selected=$(find . -type f | fzf --height 40% --reverse --preview 'bat --style=plain --color=always {} 2>/dev/null || ls --color=always {}') || return
  echo -n "$selected" | wl-copy
  echo "📋 Copied: $selected"
}
zle -N fzf-copy-widget
bindkey '^Y' fzf-copy-widget



eval "$(zoxide init --cmd cd zsh)"
