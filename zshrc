export PATH="/opt/homebrew/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin

#auto complete
autoload -Uz compinit
compinit

#    (so Tab will take that first result if it’s unique)
zstyle ':completion:*' insert-unambiguous true

setopt NO_BEEP

#    • Tab → complete the current word to the “best” (first) match
#    • Esc Tab → cycle through all other matches
bindkey '^I' complete-word
bindkey '\e\t' menu-complete
# ────────────────────────────────────────────────────────────────
#alias
alias vi='nvim'
alias Todo='nvim ~/Documents/text/todo.txt'
alias ViHelp='nvim ~/Documents/text/vim_help.txt'
alias PyHelp='nvim ~/Documents/text/py_help.txt'
alias pgo='pomo start --track'
alias ps='pomo --status'
