# Base16 Shell
function colorscheme () {
  BASE16_BG=$1
  BASE16_THEME=base16-$2
  BASE16_SHELL="$HOME/.config/base16-shell/${BASE16_THEME}.${BASE16_BG}.sh"

  [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

  echo "colorscheme $BASE16_BG $2" > ~/.term_colorscheme

  if which tmux >/dev/null; then
    tmux source-file $HOME/.tmux_$BASE16_BG  > /dev/null;
  fi

  cat <<VIM_COLORS > ~/.vim_colorscheme
  set background=$BASE16_BG
  colorscheme $BASE16_THEME
VIM_COLORS
}

if [ -f ~/.term_colorscheme ]; then
  source ~/.term_colorscheme
else
  colorscheme dark default
fi

color_off='\e[0m'
black='\e[0;30m'
bright_black='\e[1;30m'
red='\e[0;31m'
green='\e[0;32m'
yellow='\e[0;33m'
blue='\e[0;34m'
purple='\e[0;35m'
cyan='\e[0;36m'
white='\e[0;37m'

function parse_git_branch {
  git_branch=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`

  if [ "$git_branch" ]; then
    printf "(${blue}$git_branch${color_off}) "
  else
    printf ' '
  fi
}

PS1="\[${purple}\]\\W\[${color_off}\]\$(parse_git_branch)\\[${red}\]»\[${color_off}\] "

set -o vi

export CLICOLOR=1
export GREP_COLOR="1;31"
export GREP_OPTIONS='--color=auto'
export LESS="-R"
export EDITOR=vi
export TERM=xterm-256color
export HISTSIZE=5000

export PATH=$HOME/.bin:$PATH

export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin

source ~/.aliases
source ~/.rbenvrc

if which brew >/dev/null; then
  export PATH=$HOME/.homebrew/bin:/usr/local/bin:/usr/local/sbin:$PATH

  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi

if which tmux >/dev/null; then
  if [[ -z "$TMUX" ]]; then
    tmux -u new-session -s default -A
  fi
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD ||
  find * -name ".*" -prune -o -type f -print -o -type l -print) 2> /dev/null'
