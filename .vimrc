set nocompatible
filetype plugin indent on
syntax on
set nowrap
set confirm
"set foldmethod=syntax
set cursorline
set history=10000
set number
set wildmenu
set colorcolumn=120
set hidden
" indent
    "set tabstop=4
    "set shiftwidth=4
    "set expandtab
    "set cindent
    "set cinoptions=+0
    "set cinkeys-=0#
    "set indentkeys-=0#
    "set autoindent
" encoding
    set encoding=utf-8
    set fileencoding=utf-8
" list mode
    set listchars=eol:$,tab:>·,trail:~,extends:>,precedes:<,space:␣
    "set list
"set spell
" search
    set hlsearch
    set incsearch
set background=dark
colorscheme solarized

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes
call plug#begin('~/.vim/plugged')

" Style

    " lean & mean status/tabline for vim that's light as air
    Plug 'vim-airline/vim-airline'
        let g:airline#extensions#tabline#enabled=1 " Enable the list of buffers
        let g:airline_powerline_fonts=1

    " a collection of themes for vim-airline
    Plug 'vim-airline/vim-airline-themes'
        let g:airline_theme='bubblegum'

    " better rainbow parentheses
    Plug 'kien/rainbow_parentheses.vim'

    " place, toggle and display marks
    Plug 'kshenoy/vim-signature'

    " Solarized colorscheme for vim
    Plug 'altercation/vim-colors-solarized'
        let g:solarized_diffmode='high'

" File Management

    " fuzzy file, buffer, mru, tag, etc finder
    Plug 'ctrlpvim/ctrlp.vim'
        let g:ctrlp_working_path_mode='rc'
        let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

" Motions

    " useful word motions for snake case and camel case
    Plug 'chaoren/vim-wordmotion'

    " "surroundings": parentheses, brackets, quotes, XML tags, and more
    Plug 'tpope/vim-surround'

" Git

    " shows a git diff in the gutter (sign column) and stages/undoes hunks
    Plug 'airblade/vim-gitgutter'

    " git wrapper
    Plug 'tpope/vim-fugitive'

" Development

    " provides support for expanding abbreviations similar to emmet (improves HTML & CSS workflow)
    Plug 'mattn/emmet-vim'

    " always highlight enclosing tags
    Plug 'valloric/MatchTagAlways'

    " automatically adjusts 'shiftwidth' and 'expandtab' heuristically
    Plug 'tpope/vim-sleuth'

    " snippets engine
    Plug 'SirVer/ultisnips'
        let g:UltiSnipsExpandTrigger="<tab>"
        let g:UltiSnipsJumpForwardTrigger="<c-b>"
        let g:UltiSnipsJumpBackwardTrigger="<c-z>"

    " Snippets separated from the ultisnips engine
    Plug 'honza/vim-snippets'

    " Asynchronous linting/fixing
    Plug 'w0rp/ale'

" Initialize plugin system
call plug#end()
