"Plugin Setup
	"Plugins
		call plug#begin()
			Plug 'bling/vim-airline'
			Plug 'sjl/gundo.vim'
			Plug 'whatyouhide/vim-gotham'
			Plug 'Valloric/YouCompleteMe', { 'do': 'python2 ./install.py --gocode-completer --omnisharp-completer --clang-completer' }
		call plug#end()

	"Setup plugins
		nnoremap <leader>u :GundoToggle<CR>
		let g:airline_left_sep = ''
		let g:airline_right_sep = ''

"Basic
	colorscheme gotham256
	set shiftwidth=4
	syntax enable
	set tabstop=4
	set number
	set modelines=1

"Layout
	set showcmd
	set cursorline
	filetype indent on
	set wildmenu
	set lazyredraw
	set showmatch

"Folding
	set foldenable
	set foldignore=\n
	set foldlevelstart=10
	set foldnestmax=10
	nnoremap <space> za
	set foldmethod=syntax

"Backups
	set backup
	set backupdir=/tmp
	set directory=/tmp
	set writebackup

"Mixed
	"Move by visual  line
		nnoremap j gj
		nnoremap k gk

	"Highlight last inserted text
		nnoremap gV `[v`]

	"Set leading char to comma
		let mapleader=","

	"Allow jk to act as escape
		inoremap jk <esc>

	"Strip Whitespace on save
		autocmd BufWritePre * :%s/\s\+$//e

	"Always show statusline
		set laststatus=2
