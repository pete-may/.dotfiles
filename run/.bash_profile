#!/bin/bash

for DOTFILE in `find ~/.dotfiles/system`
do
    [ -f $DOTFILE ] && source $DOTFILE
done

# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# source ~/.dotfiles/git/git-completion.bash
# source ~/.dotfiles/run/.completions

[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

eval "$(rbenv init -)"
