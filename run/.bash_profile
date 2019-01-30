#!/bin/bash

for DOTFILE in `find /Users/peter.may@ibm.com/.dotfiles/system`
do
    [ -f $DOTFILE ] && source $DOTFILE
done

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

source "/Users/peter.may@ibm.com/.dotfiles/git/git-completion.bash"
source "/Users/peter.may@ibm.com/.dotfiles/run/.completions"

[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

eval "$(rbenv init -)"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
