# .zshrc

# ===========================================================
# =========                Bash                     =========
# ===========================================================

for DOTFILE in `find ~/.dotfiles/bash -d 1`
do
    [ -f $DOTFILE ] && source $DOTFILE
done


# ===========================================================
# =========                Prompt                   =========
# ===========================================================

# Pure
fpath+=("$HOME/.dotfiles/zsh/pure")

autoload -U promptinit; promptinit

# zstyle ':prompt:pure:path' color 009  # old one
zstyle ':prompt:pure:path' color 131
zstyle ':prompt:pure:prompt:success' color 104
zstyle ':prompt:pure:prompt:error' color 104
zstyle ':prompt:pure:git:branch' color 242

PURE_PROMPT_SYMBOL=""
prompt pure


# ===========================================================
# ========                  Kube                     ========
# ===========================================================

# autoload -U colors; colors
# source ~/.dotfiles/zsh/zsh-kubectl-prompt/kubectl.zsh
# RPROMPT='%{$fg[yellow]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'


# ===========================================================
# ========                 History                   ========
# ===========================================================

source $HOME/.dotfiles/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=""       # turn off search highlight on found
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=""   # turn off searhc highlight on not found

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


# ===========================================================
# ========                Completion                 ========
# ===========================================================

fpath+=("$HOME/.dotfiles/zsh/zsh-completions/src")

autoload -U compinit

rm -f ~/.zcompdump

compinit -i

zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

bindkey '^[[Z' reverse-menu-complete


# ===========================================================
# ========                   fzf                     ========
# ===========================================================

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# ===========================================================
# ========                Settings                   ========
# ===========================================================

# General zshzle options
setopt autocd                     # cd by just typing in a directory name
setopt nomatch                    # warn me if a glob doesn't match anything
setopt no_case_glob               # globbing is case insensitive
setopt interactive_comments       # commands preceded with '#' aren't run
setopt share_history

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line

# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

export KEYTIMEOUT=1
export WORDCHARS='-'

export ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;&'


# # fix for cmd-arrow keys movement
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[7~" beginning-of-line
bindkey "\e[8~" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

# set zle to vi mode
# bindkey -v

# bindkey "^W" backward-kill-word
# bindkey "^?" backward-delete-char
# bindkey "^H" backward-delete-char      # Control-h also deletes the previous char
# bindkey "^U" backward-kill-line
#
# bindkey 'jk' vi-cmd-mode
# bindkey 'kj' vi-cmd-mode


# ===========================================================
# ========                  New stuff                ========
# ===========================================================

#eval "$(rbenv init -)"
#export PATH="/usr/local/opt/libpq/bin:$PATH"

#export NVM_DIR=~/.nvm
#source $(brew --prefix nvm)/nvm.sh

#export JAVA_HOME=$(/usr/libexec/java_home)

# source `icdctl setup zsh`

# export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"
export PATH="/opt/homebrew/opt/pyqt@5/5.15.4_1/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fpath=(~/.config/zsh/completion $fpath)
autoload -Uz compinit ; compinit

# Allow Ctrl-z to toggle between suspend and resume 
function Resume {
    if [[ -z $BUFFER ]] then
        if [[ $(jobs) != "" ]] then
            fg &> /dev/null
        zle accept-line
    fi
    else
        zle expand-or-complete
    fi
}
zle -N Resume
# bindkey "^Z" Resume
bindkey "^I" Resume


bindkey '^\' backward-delete-char

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Created by `pipx` on 2026-01-26 14:58:57
export PATH="$PATH:/Users/petermay/.local/bin"
