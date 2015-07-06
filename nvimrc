" Keep it simple, just use 'Pathogen: manage your runtimepath'
  execute pathogen#infect()

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

" ###############
" Bundled plugins
" ###############
"
" - tpope/vim-sensible
"   Sane defaults for everyone

  set scrolloff=8
  set listchars=tab:>\ ,trail:·,extends:>,precedes:<,nbsp:+,eol:¬

" - tpope/vim-vinegar
"   Better netrw handling
"
" - tpope/vim-projectionist
"   projectionist.vim: project configuration
"
" - tpope/vim-fugitive
"   Git wrapper so awesome, it should be illegal
"
" - tpope/vim-commentary
"   Comment stuff out
"
" - tpope/vim-rbenv
"   Minimal rbenv support
"
" - tpope/vim-surround
"   Quoting/parenthesizing made simple
"
" - tpope/vim-unimpaired
"   unimpaired.vim: pairs of handy bracket mappings
"
" - tpope/vim-ragtag
"   Ghetto HTML/XML mappings

  let g:ragtag_global_maps=1

"
" - tpope/vim-endwise
"   wisely add 'end' in ruby, endfunction/endif/more in vim script, etc
"
" - tpope/vim-sleuth
"   Heuristically set buffer options
"
" - tpope/vim-flagship
"   Configurable and extensible tab line and status line

  let g:tabprefix=" »"
  let g:tablabel="%N %{flagship#tabcwds('shorten',',')}%{flagship#tabmodified()} »"

  autocmd User Flags call Hoist("window", -100, "%m")

  set statusline=\ » " Firulinha
  set statusline+=\ %t\  " Filename

  set statusline+=%= " Separator

  set statusline+=%y " File type
  set statusline+=[%{strlen(&fenc)?&fenc:'none'}] " File encoding
  set statusline+=[%{&ff}] " File ending
  set statusline+=\ %P\ of\ %L\  " Perc. file
  set statusline+=(%l\:%c) " Line info
  set statusline+=\ «\  " Firula

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
" - vim-ruby/vim-ruby
"   Vim/Ruby Configuration Files
"
" - szw/vim-tags
"   Ctags generator for Vim

  autocmd FileType ruby compiler ruby

" - othree/html5.vim
"   HTML5 omnicomplete and syntax

" - junegunn/fzf
"   A command-line fuzzy finder written in Go

  set rtp+=~/.fzf

  nnoremap <leader>p :FZF!<cr>

  " Select and open buffer
  function! s:buflist()
    redir => ls
    silent ls
    redir END
    return split(ls, '\n')
  endfunction

  function! s:bufopen(e)
    execute 'buffer' matchstr(a:e, '^[ 0-9]*')
  endfunction

  nnoremap <silent> <Leader>b :call fzf#run({
  \   'source':  reverse(<sid>buflist()),
  \   'sink':    function('<sid>bufopen'),
  \   'down':    20,
  \ })<CR>

  " Jump to tags through whole project
  command! -bar FZFTags if !empty(tagfiles()) | call fzf#run({
  \   'source': "sed '/^\\!/d;s/\t.*//' " . join(tagfiles()) . ' | uniq',
  \   'sink':   'tag',
  \ }) | else | echo 'Preparing tags' | call system('ctags -R') | FZFTag | endif

  nnoremap <leader>tp :FZFTags<CR>

  command! FZFTagFile if !empty(tagfiles()) | call fzf#run({
  \   'source': "cat " . tagfiles()[0] . ' | grep "' . expand('%:@') . '"' . " | sed -e '/^\\!/d;s/\t.*//' ". ' |  uniq',
  \   'sink':   'tag',
  \   'down':     20,
  \ }) | else | echo 'No tags' | endif

  nnoremap <leader>t :FZFTagFile<cr>

" ################
" Editing settings
" ################

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

" ###################
" Appearence settings
" ###################

  " Always show tabline
  set showtabline=2

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

  " Column ruler
  set colorcolumn=110

  " Custom colors
  hi! LineNR ctermbg=NONE

  if &g:background == 'dark'
    " Indent-guides
    hi! IndentGuidesOdd ctermbg=18
    hi! IndentGuidesEven ctermbg=18

    " TabLine
    hi! TabLineSel ctermfg=05
  else
    " Statusline
    hi! Statusline ctermbg=19 ctermfg=21

    " Indent-guides
    hi! IndentGuidesOdd ctermbg=21
    hi! IndentGuidesEven ctermbg=21
  endif
