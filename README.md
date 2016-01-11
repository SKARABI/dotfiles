# brennovich dotfiles

My full configuration from development environment to desktop.

## Features

- Awesome, dry and performant nvim configuration
- Comprehensive Bash config
- Well integrated TMUX
- Consistent colorscheme across applications with [Base16](http://chriskempson.github.io/base16/)
- Fuzzy finder wide available with [Selecta](https://github.com/garybernhardt/selecta)

## Instalation

```shell
git clone --recursive git://github.com/brennovich/dotfiles.git
cd dotfiles
./install
```

_Note: it isn't installing desktop environment related dependencies yet_

## Scripts

#### `colorscheme`

Set a Base16 variation in both vim and shell:

```sh
# background[dark,light] variation
coloscheme light default
coloscheme light eighties
```

Take a look into available variations: http://chriskempson.github.io/base16/

#### `disable-dpms-on-fullscreen-window`

Very handful script to avoid display sleep when any fullscreen window is open, it is automatically started
by `i3` via `exec_always` instruction in `i3/config`

#### `mpd-notify`

Displays dunst notification about current song being played

## Desktop Environment

Very ViM like, any possible applications is configured to work always with your hands on the keyboard, from
the window manager itself to the browser.

![My desktop](http://i.imgur.com/OUTue95.png)

### Window manager: [i3-gaps](https://github.com/Airblader/i3)

Mod key is `super` (a.k.a Command, or Super depending on your keyboard)

- Gaps control mode `mod + g`
- System control mode `mod + Shift +e` (you can logout, reboot, etc)
- Resize mode `mod + r`
- Top bar info: [i3blocks](https://github.com/vivien/i3blocks)
- Screen locker: [i3lock](https://github.com/i3/i3lock). It's super nice:

![Screen locker](http://i.imgur.com/GTanbsy.png)

### Theme

- Typeface: [Fira](https://www.mozilla.org/en-US/styleguide/products/firefox-os/typeface/)
- Composite manager: [compton](https://github.com/chjj/compton/)

### Applications

- Launcher: [rofi](https://davedavenport.github.io/rofi/)

![Rofi](http://i.imgur.com/PQtBEQQ.png)

- Notification daemon: [dunst](http://www.knopwob.org/dunst/)
- Music player: [mpd](http://www.musicpd.org/) + [ncmpcpp](http://ncmpcpp.rybczak.net/)

## Roadmap

- Make `colorscheme` works across desktop environment using whiskers
