# Global aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g C='| wc -l'
alias -g H='| head'
alias -g L="| less"
alias -g N="| /dev/null"
alias -g S='| sort'
alias -g G='| grep' # now you can do: ls foo G something

# Functions
#
# (f)ind by (n)ame
# usage: fn foo 
# to find all files containing 'foo' in the name
function fn() { ls **/*$1* }

alias nmake='ninja -C out/Debug'
alias explorer='nautilus'

export EDITOR=vim
export BROWSER=google-chrome
export TERM=screen-256color-bce

alias -s gz='tar -xzvf'
alias -s bz2='tar -xjvf'
alias -s xz='tar xpvf'
alias -s zip='unzip'
alias -s h=$EDITOR
alias -s c=$EDITOR
alias -s cc=$EDITOR
alias -s txt=$EDITOR
alias -s html=$BROWSER
alias -s mp4=$BROWSER
alias -s pdf=$BROWSER

# Start tmux and attach to session 'remote' on ssh automatically.
if [[ -z "$TMUX" && -z "$EMACS" && -z "$VIM" ]] && [[ -n "$SSH_TTY" ]]; then
  if tmux has-session -t "remote" 2> /dev/null; then
    tmux -2 attach-session -t "remote"
  else
    tmux -2 new-session -s "remote"
  fi
fi
