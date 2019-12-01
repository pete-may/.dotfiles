# this is my .zshrc
#
# plugins used
#   - zsh-history-substring-search (brew)
#   - zsh-completions (brew)
# prompt
#   - pure (npm, located in $HOME) 


source $HOME/.bash_profile       # load my dot files

fpath+=("$HOME/.dotfiles/zsh/zsh-completions/src")
fpath+=("$HOME/.dotfiles/zsh/pure")


# kill non-alphanumeric characters
#backward-kill-dir () {
#    local WORDCHARS=${WORDCHARS/\/}
#    zle backward-kill-word
#}
#zle -N backward-kill-dir
#bindkey '^[^?' backward-kill-dir

export WORDCHARS='-'

# paste stuff
paste_widget() LBUFFER+=$(pbpaste) 
zle -N paste_widget
bindkey "\ev" paste_widget


# PROMPT 
####################
autoload -U promptinit; promptinit
#source ~/zsh_stuff/lean/lean.plugin.zsh
# change the path color
#zstyle :prompt:pure:path color 111 
#zstyle :prompt:pure:path color 108
#zstyle :prompt:pure:path color 114 
#zstyle :prompt:pure:path color 123
zstyle :prompt:pure:path color 009 
 

# change the color for both `prompt:success` and `prompt:error`
zstyle ':prompt:pure:prompt:success' color 104 
zstyle ':prompt:pure:prompt:error' color 104 
#zstyle ':prompt:pure:git:branch' color 229
zstyle ':prompt:pure:git:branch' color 242 
#zstyle ':prompt:pure:prompt:success' color 110 
#zstyle ':prompt:pure:prompt:error' color 110
PURE_PROMPT_SYMBOL=""
prompt pure

## kube
autoload -U colors; colors
source ~/.dotfiles/zsh/zsh-kubectl-prompt/kubectl.zsh
RPROMPT='%{$fg[yellow]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'
####################


# HISTORY 
####################
source $HOME/.dotfiles/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=""       # turn off search highlight on found
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=""   # turn off searhc highlight on not found
####################


# COMPLETION 
####################
autoload -U compinit
rm -f ~/.zcompdump
compinit

#fpath=(/usr/local/share/zsh-completions /usr/local/share/zsh/site-functions /usr/share/zsh/site-functions /usr/share/zsh/5.3/functions)

zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

bindkey '^[[Z' reverse-menu-complete
####################


# MISC (not sure these work yet)
####################

# fix for cmd-arrow keys movement 
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[7~" beginning-of-line
bindkey "\e[8~" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

# General zshzle options
setopt autocd                     # cd by just typing in a directory name
setopt nomatch                    # warn me if a glob doesn't match anything
setopt no_case_glob               # globbing is case insensitive
setopt interactive_comments       # commands preceded with '#' aren't run
#setopt menu_complete              # Show completions like Vim (cycle through)
setopt share_history

alias zload="source $HOME/.zshrc" # reload .zshrc
####################

# terraform
export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"
