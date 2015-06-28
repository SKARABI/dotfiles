# Base16 Shell
function colorscheme () {
  BASE16_BG=$1
  BASE16_THEME=base16-$2

  BASE16_SHELL="$HOME/.config/base16-shell/${BASE16_THEME}.${BASE16_BG}.sh"

  [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

  echo $BASE16_SHELL > ~/.term_colorscheme

  tmux source-file $HOME/.tmux_$BASE16_BG  > /dev/null;

  cat <<NVIM_COLORS > ~/.nvim_colorscheme
  set background=$BASE16_BG
  colorscheme $BASE16_THEME
NVIM_COLORS
}

if [ -f ~/.term_colorscheme ]; then
  source ~/.term_colorscheme
else
  colorscheme dark default
fi

color_off='\e[0m' # Text Reset
black='\e[0;30m' # Black
bright_black='\e[1;30m' # Black
red='\e[0;31m' # Red
green='\e[0;32m' # Green
yellow='\e[0;33m' # Yellow
blue='\e[0;34m' # Blue
purple='\e[0;35m' # Purple
cyan='\e[0;36m' # Cyan
white='\e[0;37m' # White

# Prompt with ruby version
function rbenv_ps1 () {
  rbenv_ruby_version=`rbenv version | sed -e 's/ .*//'`

  printf $rbenv_ruby_version
}

function parse_git_branch {
  git_branch=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`

  if [ "$git_branch" ]; then
    printf "${color_off}on ${red}$git_branch"
  fi
}

PS1="\[${color_off}\]using \[${blue}\]\$(rbenv_ps1) \[${color_off}\]at\[${green}\] \\W \$(parse_git_branch) \n\\[${red}\]\$\[${color_off}\] "

set -o vi

export CLICOLOR=1
export GREP_COLOR="1;31"
export GREP_OPTIONS='--color=auto'
export LESS="-R"
export EDITOR=nvim
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

if [[ -z "$TMUX" ]]; then
  tmux -u new-session -s default -A
fi
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
