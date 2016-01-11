# brennovich dotfiles

My full configuration from development environment to desktop.

## Features

- Awesome dry and performant nvim configuration
- Comprehensive Bash config
- Well integrated TMUX
- [Base16](http://chriskempson.github.io/base16/)
- [Selecta](https://github.com/garybernhardt/selecta)

## Instalation

```shell
git clone --recursive git://github.com/brennovich/dotfiles.git
cd dotfiles
./install
```

## Features

### Bash

#### `colorscheme`

Set a Base16 variation in both vim and shell:

```sh
# background[dark,light] variation
coloscheme light default
coloscheme light eighties
```

### VIM

Actually [NeoVIM](http://neovim.org)!

### i3wm

![My desktop](http://i.imgur.com/vr2R7HG.png)

- Typeface: [Fira](https://www.mozilla.org/en-US/styleguide/products/firefox-os/typeface/)
- Launcher: [rofi](https://davedavenport.github.io/rofi/)
- Notification daemon: [dunst](http://www.knopwob.org/dunst/)
- Top bar info: [i3blocks](https://github.com/vivien/i3blocks)
- Screen locker: [i3lock](https://github.com/i3/i3lock)
- Composition manager:[compton](https://github.com/chjj/compton/)
- Music player: [mpd](http://www.musicpd.org/) + [ncmpcpp](http://ncmpcpp.rybczak.net/)
