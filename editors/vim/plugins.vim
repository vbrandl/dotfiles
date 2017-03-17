call vundle#begin()

" vundle needs to handle itself
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" colorschemes
" Plug 'dracula/vim'
Plugin 'joshdick/onedark.vim'

Plugin 'editorconfig/editorconfig-vim'

" Notetaking
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'

" reStructuredText
Plugin 'Rykka/riv.vim'
Plugin 'Rykka/InstantRst'					" instant preview

Plugin 'cespare/vim-toml'					" toml highlighting

Plugin 'w0rp/ale'							" syntax checking
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'					" make plugin commands repeatable
Plugin 'tpope/vim-dispatch'					" dispatch into tmux panes
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'mattn/vim-maketable'				" create tables from selection
Plugin 'dhruvasagar/vim-table-mode'			" handle tables
Plugin 'mattn/webapi-vim'					" web api
Plugin 'mattn/gist-vim'						" create gist from within vim
Plugin 'michaeljsmith/vim-indent-object'	" indent as textobject
Plugin 'Raimondi/delimitMate'			" autoclose quotes and brackets
"Plugin 'SirVer/ultisnips'				" snippets
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plugin 'Xuyuanp/nerdtree-git-plugin' | Plugin 'ryanoasis/vim-devicons' 
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'neomake/neomake'
Plugin 'benmills/vimux'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'tpope/vim-sleuth'				" autodetect indent style (tabs vs. spaces)
Plugin 'sickill/vim-pasta'				" context aware pasting
Plugin 'elzr/vim-json'					" JSON support
Plugin 'davidhalter/jedi-vim'			" python autocomplete
Plugin 'junegunn/goyo.vim'				" distraction free writing

" Rust plugins
Plugin 'racer-rust/vim-racer'			" rust autocomplete
Plugin 'rust-lang/rust.vim'				" rust syntax, error checking, etc
Plugin 'jtdowney/vimux-cargo'			" run cargo in tmux using vimux

" LaTeX
Plugin 'lervag/vimtex'

call vundle#end()

" vim: set filetype=vim ts=4 sw=4 tw=120 noet :
