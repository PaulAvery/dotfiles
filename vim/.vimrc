"Plugin Setup
	"Plugins
		call plug#begin()
			Plug 'vim-airline/vim-airline'
			Plug 'vim-airline/vim-airline-themes'
			Plug 'sjl/gundo.vim'
			Plug 'kristijanhusak/vim-hybrid-material'
			Plug 'Valloric/YouCompleteMe', { 'do': 'python2 ./install.py --gocode-completer --omnisharp-completer --clang-completer' }
		call plug#end()

	"Setup plugins
		nnoremap <leader>u :GundoToggle<CR>
		let g:airline_powerline_fonts = 1
		let g:airline_theme = 'hybrid'

"Basic
	set background=dark
	colorscheme hybrid_material
	autocmd ColorScheme * highlight Normal ctermbg=None
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
