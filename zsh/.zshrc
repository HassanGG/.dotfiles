export EDITOR="nvim"
export VISUAL="nvim"
export ANKI_PATH="$HOME/Projects/anki"

bindkey -e

# Bind Ctrl+X, Ctrl+E to edit command line in neovim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

clear-keep-buffer() {
  zle clear-screen
}

copy-command() {
  echo -n $BUFFER | pbcopy
  zle -M 'Copied to clipboard'
}

zle -N copy-command
bindkey '^Xc' copy-command

zle -N clear-keep-buffer
bindkey '^Xl' clear-keep-buffer


bindkey ' ' magic-space

BREWFILE_PATH="~/Brewfile"
alias install="nvim $BREWFILE_PATH && cd && (brew bundle check || brew bundle install) && brew bundle cleanup --force && cd - > /dev/null"

alias vim="nvim"

alias app-id="mdfind \"kMDItemContentType == 'com.apple.application-bundle'\" -attr kMDItemCFBundleIdentifier | sed \"s/.*kMDItemCFBundleIdentifier\ =\ //\" | grep -v \"(null)\" | fzf"

alias gc="git commit -m"
alias ga="git add"
alias gs="git status"
alias gp="git push"
alias gd="git diff"

alias vimconf="cd ~/.dotfiles/nvim/.config/nvim/ && vim && cd -"
hash -d vc=~/.dotfiles/nvim/.config/nvim/
hash -d aeroc=~/.dotfiles/aerospace/.aerospace.toml
alias oc="opencode --port" 

alias cd="z"

alias ls="ls -a"
alias tree="tree -a -I '.git'"
alias sesh='~/.scripts/tmux-sessionizer.sh'
alias cat='bat'

bindkey "^R" history-incremental-search-backward

chpwd() {
  ls
}

autoload zmv

eval "$(zoxide init zsh)"
