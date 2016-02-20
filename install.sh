#!/bin/sh

git submodule init
git submodule update

for name in *; do
  target="$HOME/.$name"

  if [[ ! "$name" =~ ^config$|.sh$|LICENSE|README ]]; then
    echo "Creating $target"
    cp -rfT "$PWD/$name" "$target"
  fi
done

for name in config/*; do
  target="$HOME/.$name"

  echo "Creating $target"
  cp -rfT "$PWD/$name" "$target"
done

curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ ! -d $HOME/.selecta ]; then
  git clone --depth 1 https://github.com/garybernhardt/selecta.git $HOME/.selecta
  cp $HOME/.selecta/selecta $HOME/.bin
fi
