export ZSH="${ZSH:-$HOME/.oh-my-zsh}"
ZSH_THEME="robbyrussell"

# Syntax highlighting must be loaded last.
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)
source "$ZSH/oh-my-zsh.sh"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS SHARE_HISTORY

alias ll='ls -lah'
alias gs='git status -sb'
alias gl='git log --oneline --graph --all'
alias gfa='git fetch --all --prune'
