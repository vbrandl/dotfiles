function! Cond(cond, ...)
  let opts=get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin('~/.vim/plugged')

" colorschemes
Plug 'lifepillar/vim-solarized8'

" editorconfig support
Plug 'editorconfig/editorconfig-vim'

" (un)comment
Plug 'tpope/vim-commentary'

" handle surroundings
Plug 'tpope/vim-surround'

" make plugin commands repeatable
Plug 'tpope/vim-repeat'

" autodetect tabwidth
Plug 'tpope/vim-sleuth'

" dispatch into tmux panes
Plug 'tpope/vim-dispatch', Cond(!empty($TMUX))

" awesome git plugin
Plug 'tpope/vim-fugitive'

" create gist from within vim
Plug 'mattn/gist-vim' | Plug 'mattn/webapi-vim'

" autoclose quotes and brackets
Plug 'Raimondi/delimitMate'
let delimitMate_expand_cr=1

" async linting and making
Plug 'neomake/neomake'

" tmux support if inside tmux
" run cargo in tmux using vimux
Plug 'benmills/vimux', Cond(!empty($TMUX)) | Plug 'jtdowney/vimux-cargo', { 'for': 'rust' }
" vimux mappings
" Prompt for a command
map <Leader>vp :VimuxPromptCommand<CR>
" Prompt for a make command
map <Leader>vm :VimuxPromptCommand("make ")<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
" Close runner
map <Leader>vq :VimuxCloseRunner<CR>
" Rerun last command
map <Leader>vv :VimuxRunLastCommand<CR>
" Stop running command
map <Leader>vs :VimuxInterruptRunner<CR>

" distraction free writing
Plug 'junegunn/goyo.vim'
" close Goyo *and* vim with :q
function! s:goyo_enter()
    let b:quitting=0
    let b:quitting_bang=0
    autocmd QuitPre <buffer> let b:quitting=1
    cabbrev <buffer> q! let b:quitting_bang=1 <bar> q!
endfunction

function! s:goyo_leave()
    " Quit Vim if this is the only remaining buffer
    if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
        if b:quitting_bang
            qa!
        else
            qa
        endif
    endif
endfunction
autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

" highlight unwanted whitespace
Plug 'bronson/vim-trailing-whitespace'

" fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'

" replace text with the content of a register
Plug 'vim-scripts/ReplaceWithRegister'

" paste with indent adjusted to context
Plug 'sickill/vim-pasta'

" rust support
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" run rustfmt when saving a file
let g:rustfmt_autosave=1

" deoplete for auto completion
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup=1
" deoplete completion for rust
Plug 'sebastianmarkow/deoplete-rust'
let g:deoplete#sources#rust#racer_binary='/usr/bin/racer'
" let g:deoplete#sources#rust#rust_source_path = '$(rustc --print sysroot)/lib/rustlib/src/rust/src'
if executable('rustc')
    " if src installed via rustup, we can get it by running
    " rustc --print sysroot then appending the rest of the path
    let rustc_root = systemlist('rustc --print sysroot')[0]
    let rustc_src_dir = rustc_root . '/lib/rustlib/src/rust/src'
    if isdirectory(rustc_src_dir)
        let g:deoplete#sources#rust#rust_source_path = rustc_src_dir
    endif
endif

" Plug 'racer-rust/vim-racer', { 'for': 'rust' }				" rust autocomplete
" let g:racer_cmd = "/usr/bin/racer"

" syntax support for many languages
Plug 'sheerun/vim-polyglot'
" disable latex in polyglot to use vimtex
let g:polyglot_disabled=['latex']

" latex support
Plug 'lervag/vimtex'

" Vimwiki
Plug 'vimwiki/vimwiki'
let g:vimwiki_list=[{'path': '~/Dokumente/notes',
            \ 'syntax': 'markdown',
            \ 'ext': '.md'}]

Plug 'antoyo/vim-licenses'
let g:licenses_copyright_holders_name='Brandl, Valentin <mail@vbrandl.net>'
let g:licenses_authors_name='Brandl, Valentin <mail@vbrandl.net>'

" haskell support
Plug 'neovimhaskell/haskell-vim'

" elm support
Plug 'elmcast/elm-vim'

" clojure support
Plug 'tpope/vim-fireplace'

" purescript
Plug 'frigoeu/psc-ide-vim'

"" nerdtree file manager
"Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
"Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
"" Toggle NERDTree
"nmap <silent> <leader>k :NERDTreeToggle<cr>
"" expand to the path of the file in the current buffer
"nmap <silent> <leader>y :NERDTreeFind<cr>
""autocmd BufWinEnter * NERDTreeMirror
"let NERDTreeShowHidden=1
""let NERDTreeDirArrowExpandable = '▷'
""let NERDTreeDirArrowCollapsible = '▼'

"Plug 'ervandew/supertab'									" simple autocomplete

"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

" Python
"Plug 'davidhalter/jedi-vim', { 'for': 'python' }			" python autocomplete

" Plug 'artur-shaik/vim-javacomplete2'

call plug#end()
