# Base16 Shell
function colorscheme () {
  BASE16_BG=$1
  BASE16_THEME=base16-$2
  BASE16_SHELL="$HOME/.config/base16-shell/${BASE16_THEME}.${BASE16_BG}.sh"

  [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

  echo "colorscheme $BASE16_BG $2" > ~/.term_colorscheme

  if which tmux >/dev/null; then
    if [[ -s $TMUX ]]; then
      tmux source-file $HOME/.tmux_$BASE16_BG  > /dev/null;
    fi
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
  index=`if [ -d .git ]; then git status -s; fi;`

  color=${green}

  if echo ${index} >/dev/null; then
    if [[ ${index} =~ "M" ]]; then color=${yellow}; fi
    if [[ ${index} =~ "??" ]]; then color=${red}; fi
  fi

  if [ "$git_branch" ]; then
    printf "(${color}$git_branch${color_off}) "
  else
    printf ' '
  fi
}

PS1="\[${purple}\]\\W\[${color_off}\]\$(parse_git_branch)\\n\[${red}\]»\[${color_off}\] "

set -o vi

export CLICOLOR=1
export LESS="-R"
export EDITOR=nvim
export TERM=xterm-256color
export HISTSIZE=5000

export PATH=$HOME/.bin:$PATH

export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin

source ~/.aliases
source ~/.rbenvrc

export TEST_CLUSTER_PARAMS="-Des.security.manager.enabled=false -Des.default.path.conf=/etc/elasticsearch/elasticsearch.yml -Des.default.path.logging=/etc/elasticsearch/logging.yml"
export TEST_CLUSTER_LOGS="/tmp/elasticsearch_logs"

