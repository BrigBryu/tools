export PATH="/opt/homebrew/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin

#auto complete
autoload -Uz compinit
compinit

zstyle ':completion:*' insert-unambiguous true

setopt NO_BEEP
# tab take best tab esc cycle
bindkey '^I' complete-word
bindkey '\e\t' menu-complete
# ────────────────────────────────────────────────────────────────
#alias
alias vi='nvim'
alias Todo='nvim ~/Documents/tools/text/todo.txt'
alias ViHelp='nvim ~/Documents/tools/text/vim_help.txt'
alias PyHelp='nvim ~/Documents/tools/text/py_help.txt'
alias pgo='pomo start --track'
alias ps='pomo --status'
