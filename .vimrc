syntax on
set number
set tabstop=4       
set shiftwidth=4			" Setting tabs to 4 needs 2 commands ???
set softtabstop=4			" Make that 3
set noexpandtab				" DO NOT SET TABS AS FUCKING SPACES
set laststatus=2			" Display filenames in 'bottom' bar
set autoindent
set ttimeoutlen=10			" No delay between switching modes in tmux
set si
set cindent
set backspace=2
let g:term_buf = 0			" No idea what this does
let g:term_win = 0			" No idea what this does
set guioptions-=L			" Disable left scrollbars
set guicursor+=a:blinkon0	" Force disable cursor blinking
set bg=dark
set foldmethod=syntax		" I like code folding
set mouse=a					" There must be a reason why I need this
set clipboard=unnamedplus	" No idea what this does
set colorcolumn=80			" Ugly af but useful
set autochdir
