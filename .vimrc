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

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'preservim/nerdtree'

    Plug 'lervag/vimtex'

    Plug 'morhetz/gruvbox'

    Plug 'bfrg/vim-cpp-modern'
call plug#end()

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"NERDTree causes problems when mouse hiding is enabled
set nomousehide

nnoremap <C-n> :NERDTreeToggle<CR>

"disable left scrollbars
set guioptions-=L

"disable cursor blinking
set guicursor+=a:blinkon0

"K to show documentation of a function
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

set bg=dark

set foldmethod=syntax

set mouse=a

set clipboard=unnamedplus

colorscheme gruvbox

let g:coc_start_at_startup = 0

let g:vimtex_view_method = 'zathura'
