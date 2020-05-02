let g:python_host_prog='/usr/bin/python2'
let g:mapleader = "\<Space>"

" Autoinstall vim-plug {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}

call plug#begin('~/.vim/plugged')

" Theme {{{
Plug 'vim-airline/vim-airline'
  let g:airline_powerline_fonts = 1
" }}}

Plug 'tpope/vim-sensible'

" Indentation lines {{{
colorscheme default
Plug 'nathanaelkane/vim-indent-guides'
  let g:indent_guides_default_mapping = 0
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_start_level = 2
  let g:indent_guides_exclude_filetypes = ['help', 'startify', 'man', 'rogue']
  let g:indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=3
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgray ctermbg=4
" }}}

" Whitespace {{{
Plug 'ntpeters/vim-better-whitespace'
  let g:better_whitespace_enabled=1
  let g:strip_whitespace_on_save=1
" }}}

Plug 'tpope/vim-surround'

Plug 'scrooloose/nerdtree'

" Fuzzy finder {{{
Plug 'kien/ctrlp.vim'
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlPMixed'
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_show_hidden = 1
" }}}

Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'

call plug#end()

" Line numbering {{{
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
" }}}

" Misc {{{
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro " disable continuation of comments
" }}}

" Indentation {{{
set expandtab     " replace <Tab with spaces
set tabstop=4     " number of spaces that a <Tab> in the file counts for
set softtabstop=4 " remove <Tab> symbols as it was spaces
set shiftwidth=4  " indent size for << and >>
set shiftround    " round indent to multiple of 'shiftwidth' (for << and >>)
" }}}

" Search {{{
set ignorecase " ignore case of letters
set smartcase  " override the 'ignorecase' when there is uppercase letters
set gdefault   " when on, the :substitute flag 'g' is default on
" }}}
