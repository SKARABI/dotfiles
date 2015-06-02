set colorcolumn=110
set background=light

colorscheme solarized

set cursorline " Highlight current line"
set showtabline=2 " Always show the tab bar
set cmdheight=1 " Set command line height (default)
set title " Show the filename in the window titlebar
set shortmess=atI " Don't show the Vim intro message"

" tell the term has 256 colors
set t_Co=256

if has("gui_running")
  " Show tab number (useful for Cmd-1, Cmd-2.. mapping)
  " For some reason this doesn't work as a regular set command,
  " (the numbers don't show up) so I made it a VimEnter event
  autocmd VimEnter * set guitablabel=%N:\ %t\ %M

  set lines=60
  set columns=190
  set guifont=Inconsolata\ for\ Powerline:h18
else
  let g:solarized_termtrans = 0

  set laststatus=2
endif
