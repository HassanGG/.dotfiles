export EDITOR="nvim"
export VISUAL="nvim"

bindkey '^[^?' backward-kill-word

# Load the edit-command-line function
autoload -Uz edit-command-line
zle -N edit-command-line

# Bind Ctrl+X, Ctrl+E to trigger it
bindkey '^X^E' edit-command-line

alias vim="nvim"

BREWFILE_PATH="~/Brewfile"
alias install="nvim $BREWFILE_PATH && cd && (brew bundle check || brew bundle install) && brew bundle cleanup --force && cd - > /dev/null"

alias app-id="mdfind \"kMDItemContentType == 'com.apple.application-bundle'\" -attr kMDItemCFBundleIdentifier | sed \"s/.*kMDItemCFBundleIdentifier\ =\ //\" | grep -v \"(null)\" | fzf"

alias gc="git commit -m"
alias ga="git add"
alias gs="git status"
alias gp="git push"
alias gd="git diff"

alias vimconf="cd ~/.dotfiles/nvim/.config/nvim/ && vim && cd -"
alias aeroconf="vim ~/.dotfiles/aerospace/.aerospace.toml"
alias cdvim="cd ~/.dotfiles/nvim/.config/nvim/" 
alias oc="opencode --port" 

alias ls="ls -a"
alias tree="tree -a -I '.git'"
alias sesh='~/.scripts/tmux-sessionizer.sh'

bindkey "^R" history-incremental-search-backward
