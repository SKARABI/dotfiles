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

" The encoding displayed
set encoding=utf-8

" The encoding written to file
set fileencoding=utf-8

" #######
" Plugins
" #######

call plug#begin('~/.nvim/plugged')

Plug 'benekastah/neomake'
Plug 'chriskempson/base16-vim'
Plug 'othree/html5.vim'
Plug 'szw/vim-tags'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

call plug#end()

" ###################
" Selecta Integration
" ###################

function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!

    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

function! SelectaBuffer()
  let bufnrs = filter(range(1, bufnr("$")), 'buflisted(v:val)')
  let buffers = map(bufnrs, 'bufname(v:val)')

  call SelectaCommand('echo "' . join(buffers, "\n") . '"', "", ":b")
endfunction

nnoremap <leader>p :call SelectaCommand("selecta-command", "", ":e")<cr>
nnoremap <leader>pt :call SelectaCommand("selecta-command", "", ":tabnew")<cr>
nnoremap <leader>ps :call SelectaCommand("selecta-command", "", ":split")<cr>
nnoremap <leader>b :call SelectaBuffer()<cr>

" ################
" Editing settings
" ################

set incsearch
set hlsearch

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
set linebreak

set scrolloff=8
set listchars=tab:>\ ,trail:·,extends:>,precedes:<,nbsp:+,eol:¬

" Run Neomake after saving a file
autocmd! BufWritePost * Neomake

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']

" ###################
" Appearence settings
" ###################

" Tabline

" Statusbar
set statusline=\ » " Firulinha
set statusline+=\ %f\  " Filename
set statusline+=%{fugitive#statusline()} " Git info

set statusline+=%= " Separator

set statusline+=%y " File type
set statusline+=[%{strlen(&fenc)?&fenc:'none'}] " File encoding
set statusline+=[%{&ff}] " File ending
set statusline+=\ %P\ of\ %L\  " Perc. file
set statusline+=(%l\:%c) " Line info
set statusline+=\ «\  " Firula

" Help your brain to calculate line changes
set relativenumber

" Column ruler
set colorcolumn=110

" Highlight current line
set cursorline

" Colors
if filereadable(expand('~/.vim_colorscheme'))
  let base16colorspace=256
  source ~/.vim_colorscheme
endif

hi! LineNR ctermbg=NONE
hi! SignColumn ctermbg=NONE
hi! VertSplit ctermbg=NONE

if &g:background == 'dark'
  " Indent-guides
  " hi! IndentGuidesOdd ctermbg=18
  " hi! IndentGuidesEven ctermbg=18

  " TabLine
  hi! TabLineSel ctermfg=05
else
  " Statusline
  hi! Statusline ctermbg=19 ctermfg=21

  " Indent-guides
  " hi! IndentGuidesOdd ctermbg=21
  " hi! IndentGuidesEven ctermbg=21
endif
