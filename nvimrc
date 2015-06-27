" Keep it simple, just use 'Pathogen: manage your runtimepath'
  execute pathogen#infect()

" Bundled plugins
"
" - tpope/vim-sensible
"   Sane defaults for everyone

  set scrolloff=8
  set listchars=tab:>\ ,trail:·,extends:>,precedes:<,nbsp:+,eol:¬

" - tpope/vim-vinegar
"   Better netrw handling
"
" - tpope/vim-eunuch
"   Helpers for UNIX
"
" - tpope/vim-fugitive
"   Git wrapper so awesome, it should be illegal
"
" - nathanaelkane/vim-indent-guides
"   Visually displaying indent levels in code

  let g:indent_guides_auto_colors=0
  let g:indent_guides_start_level=2
  let g:indent_guides_guide_size=1
  let g:indent_guides_enable_on_vim_startup=1

" - chriskempson/base16-vim
"   Base16 for Vim
"   Used in Appearence section
"

" ################
" General settings
" ################
  syntax on
  filetype plugin indent on

  " Default leader key
  let mapleader=','

  " Show invisibles
  set list

  " Reload files changed outside vim
  set autoread

  " Show current mode down the bottom
  set showmode

" ################
" Editing settings
" ################

  " Indentation
  set autoindent
  set smartindent
  set smarttab
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2
  set expandtab

  " Disable swap files and things like that
  set noswapfile
  set nobackup
  set nowb

  " Persistent undo
  silent !mkdir ~/.nvim/backups > /dev/null 2>&1
  set undodir=~/.nvim/backups
  set undofile

  " Completion
  set wildmode=list:longest
  set wildmenu
  set wildignore=*.o,*.obj,*~
  set wildignore+=*vim/backups*
  set wildignore+=*sass-cache*
  set wildignore+=*DS_Store*
  set wildignore+=vendor/rails/**
  set wildignore+=vendor/cache/**
  set wildignore+=vendor/assets/**
  set wildignore+=*.gem
  set wildignore+=.tags
  set wildignore+=log/**
  set wildignore+=tmp/**
  set wildignore+=*.png,*.jpg,*.gif

  " Set min-width of buffer, very useful when spliting panes
  set winwidth=80

  " Wrap lines is for fools
  set nowrap

" ###################
" Appearence settings
" ###################

  " Help your brain to calculate line changes
  set relativenumber

  " Colorscheme
  set t_Co=256
  if filereadable(expand("~/.nvim_colorscheme"))
    let base16colorspace=256
    source ~/.nvim_colorscheme
  endif

  " Highlight current line
  set cursorline

  " Custom colors
  hi! LineNR ctermbg=NONE
  hi! IndentGuidesOdd ctermbg=19
  hi! IndentGuidesEven ctermbg=18
