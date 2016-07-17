#!/bin/bash

git submodule init
git submodule update

if [ ! -d ~/.mpd ]; then
  mkdir ~/.mpd
fi

for name in *; do
  target="$HOME/.$name"

  if [[ ! "$name" =~ ^symbolic$|^config$|.sh$|^system$|LICENSE|README ]]; then
    echo "Creating $target"
    cp -rfT "$PWD/$name" "$target"
  fi
done

for name in config/*; do
  target="$HOME/.$name"

  echo "Creating $target"
  cp -rfT "$PWD/$name" "$target"
done

for name in symbolic/*; do
  target="$HOME/.$(basename $name)"

  if [[ ! "$name" =~ \*$ ]]; then
    echo "Linking $target"
    ln -sf "$PWD/$name" "$target"
  fi
done

if [ ! -f $HOME/.config/nvim/autoload/plug.vim ]; then
  curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ ! -d $HOME/.selecta ]; then
  git clone --depth 1 https://github.com/garybernhardt/selecta.git $HOME/.selecta
  cp $HOME/.selecta/selecta $HOME/.bin
fi
