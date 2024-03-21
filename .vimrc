syntax on

set number

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

set laststatus=2

set autoindent

set ttimeoutlen=10

set si

set cindent

set backspace=2

let g:term_buf = 0
let g:term_win = 0

call plug#begin()
    Plug 'preservim/nerdtree'

    Plug 'lervag/vimtex'

    Plug 'morhetz/gruvbox'
call plug#end()

"NERDTree causes problems when mouse hiding is enabled
set nomousehide

nnoremap <C-n> :NERDTreeToggle<CR>

"disable left scrollbars
set guioptions-=L

"disable cursor blinking
set guicursor+=a:blinkon0

set bg=dark

set foldmethod=syntax

set mouse=a

set clipboard=unnamedplus

colorscheme gruvbox

let g:vimtex_view_method = 'zathura'
