alias vim="nvim"

BREWFILE_PATH="~/Brewfile"
alias install="nvim $BREWFILE_PATH && cd && (brew bundle check || brew bundle install) && (brew bundle cleanup || brew bundle cleanup --force) && (cd - > /dev/null)"

alias app-id="mdfind \"kMDItemContentType == 'com.apple.application-bundle'\" -attr kMDItemCFBundleIdentifier | sed \"s/.*kMDItemCFBundleIdentifier\ =\ //\" | grep -v \"(null)\" | fzf"

alias gc="git commit -m"
alias ga="git add"
alias gs="git status"
alias gp="git push"
alias gd="git diff"

alias vimconf="vim ~/.dotfiles/nvim/.config/nvim/"
alias aeroconf="vim ~/.dotfiles/aerospace/.aerospace.toml"
alias cdvim="cd ~/.dotfiles/nvim/.config/nvim/" 
alias oc="opencode" 

alias ls="ls -a"
alias tree="tree -a"


