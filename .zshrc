# Set up the prompt
# autoload -Uz promptinit
# promptinit
# prompt adam1

setopt histignorealldups sharehistory
setopt interactivecomments

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Show version control system information
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' %F{red}(%b)%f '

# Prompt customization
setopt PROMPT_SUBST
PROMPT='%B%F{green}%n@%m%f:%F{blue}%~%f${vcs_info_msg_0_}%#%b '

alias ls="ls --color"

# Environment
export VISUAL=vim
export EDITOR="$VISUAL"
export TERM=screen-256color # for tmux color issues.

# Path configuration
export PATH=$PATH:~/.local/bin:/opt/node/bin
export PATH=$PATH:/opt
export PATH=$PATH:/usr/games
export PATH=$PATH:/opt/flutter/bin

# Prevent overwriting an existing file. To overwrite use 'echo "" >| <filename>'.
set -o noclobber

export GPG_TTY=/dev/pts/0
