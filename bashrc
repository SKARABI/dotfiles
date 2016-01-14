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
    if [[ ${index} =~ "D" ]]; then color=${yellow}; fi
    if [[ ${index} =~ "??" ]]; then color=${red}; fi
  fi

  if [ "$git_branch" ]; then
    printf "(${color}$git_branch${color_off}) "
  else
    printf ' '
  fi
}

PS1="\[${blue}\]\\W\[${color_off}\]\$(parse_git_branch)\\n\[${red}\]»\[${color_off}\] "

set -o vi

export CLICOLOR=1
export LESS="-R"
export EDITOR=nvim
export TERM=rxvt-unicode-256color
export HISTSIZE=5000

export PATH=$HOME/.bin:$PATH

source ~/.aliases
source ~/.rbenvrc
