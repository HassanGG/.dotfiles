alias vim="nvim"

BREWFILE_PATH="~/Brewfile"
alias install="vim $BREWFILE_PATH && cd && (brew bundle check || brew bundle install) && (cd - > /dev/null)"

alias app-id="mdfind \"kMDItemContentType == 'com.apple.application-bundle'\" -attr kMDItemCFBundleIdentifier | sed \"s/.*kMDItemCFBundleIdentifier\ =\ //\" | grep -v \"(null)\" | fzf"
