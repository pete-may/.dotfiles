# .zshrc

# ===========================================================
# ========                 Bash                      ========
# ===========================================================

for DOTFILE in `find ~/.dotfiles/bash`
do
    [ -f $DOTFILE ] && source $DOTFILE
done


# ===========================================================
# ========                 Prompt                    ========
# ===========================================================

# Pure
fpath+=("$HOME/.dotfiles/zsh/pure")

autoload -U promptinit; promptinit

# zstyle ':prompt:pure:path' color 009 
zstyle ':prompt:pure:path' color 048
zstyle ':prompt:pure:prompt:success' color 104 
zstyle ':prompt:pure:prompt:error' color 104 
zstyle ':prompt:pure:git:branch' color 242 

PURE_PROMPT_SYMBOL=""
prompt pure


# ===========================================================
# ========                  Kube                     ========
# ===========================================================

autoload -U colors; colors

source ~/.dotfiles/zsh/zsh-kubectl-prompt/kubectl.zsh

RPROMPT='%{$fg[yellow]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'


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

eval "$(rbenv init -)"
export PATH="/usr/local/opt/libpq/bin:$PATH"
