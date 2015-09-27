#!/bin/sh

git submodule init
git submodule update

cutstring="DO NOT EDIT BELOW THIS LINE"

for name in *; do
  target="$HOME/.$name"
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      cutline=`grep -n -m1 "$cutstring" "$target" | sed "s/:.*//"`
      if [ -n "$cutline" ]; then
        cutline=$((cutline-1))
        echo "Updating $target"
        head -n $cutline "$target" > update_tmp
        startline=`sed '1!G;h;$!d' "$name" | grep -n -m1 "$cutstring" | sed "s/:.*//"`
        if [ -n "$startline" ]; then
          tail -n $startline "$name" >> update_tmp
        else
          cat "$name" >> update_tmp
        fi
        mv update_tmp "$target"
      else
        echo "WARNING: $target exists but is not a symlink."
      fi
    fi
  else
    if [ "$name" != 'install.sh' ]; then
      echo "Creating $target"
      if [ -n "$(grep "$cutstring" "$name")" ]; then
        cp "$PWD/$name" "$target"
      else
        ln -s "$PWD/$name" "$target"
      fi
    fi
  fi
done

if [ ! -d $HOME/.selecta ]; then
  git clone --depth 1 https://github.com/garybernhardt/selecta.git $HOME/.selecta
  cp $HOME/.selecta/selecta $HOME/.bin
fi

# if [ ! -d $HOME/.bin/devstep ]; then
#   L=$HOME/.bin/devstep && curl -sL https://github.com/fgrehm/devstep-cli/releases/download/v0.4.0/linux_amd64 > $L && chmod +x $L
#   curl -sL https://github.com/codegangsta/cli/raw/master/autocomplete/bash_autocomplete | sed 's/$PROG/devstep/' | sudo tee /etc/bash_completion.d/devstep
# fi
