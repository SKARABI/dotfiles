set -o vi

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"

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

export CLICOLOR=1
export GREP_COLOR="1;31"
export GREP_OPTIONS='--color=auto'
export LESS="-R"
export EDITOR=vim
export TERM=xterm-256color
export HISTSIZE=5000

export PATH=$HOME/.bin:$PATH

export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin

source ~/.aliases
source ~/.rbenvrc

key_file=~/code/.ssh/id_rsa
if [ -f ~/code/.ssh/id_rsa ]; then
  # Add SSH profile if not already added
  [[ -z $(ssh-add -L | grep $key_file) ]] && ssh-add $key_file
fi

if which brew >/dev/null; then
  export PATH=$HOME/.homebrew/bin:/usr/local/bin:/usr/local/sbin:$PATH

  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi

if [[ -z "$TMUX" ]]; then
  tmux -u new-session -s default -A
fi

function cd_gem () {
  cd $(bundle show "$1");
}
