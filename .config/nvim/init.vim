"for compatibility with vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

"set system clipboard
set clipboard+=unnamedplus

"from my old .vimrc-----------------------------------------------------------------------

let mapleader =" "

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" for gvim
set guifont=Source\ Code\ Pro

call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'thinca/vim-quickrun'			"allows execution of code in a separate window
Plugin 'vim-latex/vim-latex'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'			" git wrapper for vim
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer'}
Plugin 'w0rp/ale'
Plugin 'SirVer/ultisnips'
Plugin 'lervag/vimtex'
Plugin 'thaerkh/vim-indentguides'
Plugin 'tpope/vim-surround'
Plugin 'tmhedberg/simpylfold'
Plugin 'python-mode/python-mode'
Plugin 'kamykn/spelunker.vim'
" colorschemes
Plugin 'morhetz/gruvbox'	"color scheme
Plugin 'tomasr/molokai'
Plugin 'sjl/badwolf'
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomtom/tcomment_vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'junegunn/goyo.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" some basics
set nocompatible              " required
filetype on                  " not so sure about this
filetype plugin indent on    " required
syntax enable
syntax on
set nospell
set encoding=utf-8
set number relativenumber
set hlsearch

" for gvim
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar

" enable autocompletion
set wildmode=longest,list,full

" disable autocommenting on new line (fo=formatoptions)
autocmd FileType * setlocal fo-=c fo-=r fo-=o fo+=l

" open split on the right or bottom by default
set splitbelow splitright

" Show special characters
set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<
set list

" show absolute numbers in insert mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" restore correct colouring for spelling
augroup my_colours
  autocmd!
  autocmd ColorScheme gruvbox hi SpellBad cterm=reverse
augroup END

" sets theme
colorscheme gruvbox
set background=dark


" Map F5 key to code execution through quickrun and hsplit
nnoremap <F5> :QuickRun<CR>

" shows the current row and coloumn
set ruler

" for indentation guides
let g:indentguides_ignorelist = ['markdown']

" enables folding of indented code using space key
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" shortcuts for tabs
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <Tab> :tabedit<Space>

" spelunker settings
let g:enable_spelunker_vim=0

" call the complier script and show the output
nnoremap <leader>c : !compiler.sh %:p<CR>
nnoremap <leader>p : !show_output.sh %:p<CR><CR>
nnoremap <leader>t : vert terminal<CR>

" configure cross-program copy-paste
" this requires gvim installed
vnoremap <C-c> "+y
map <C-p> "+P

" airline configs
let g:airline_powerline_fonts = 1
let g:airline_theme="gruvbox"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" nerdtree shortcut and close vim if nerdtree is the only open tab
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" python-specific configs
autocmd BufWritePre *.py execute ':Black'

let g:black_linelength=80
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Configurations for vim-latex
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear.sh %

" config for vim-markdown
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0

" change font size
let g:fnt_type = 'Source\ Code\ Pro'
let g:fnt_size = 11

" all of this required only for gvim
"function! ResetFont ()
"  if has('gui_running')
"    exe ':set guifont=' . g:fnt_type . '\ ' . string(g:fnt_size)
"  endif
"endfunction
"
"call ResetFont()
"
"function! FontSizePlus ()
"  let g:fnt_size = g:fnt_size + 0.5
"  call ResetFont()
"endfunction
"
"function! FontSizeMinus ()
"  let g:fnt_size = g:fnt_size - 0.5
"  call ResetFont()
"endfunction
"
"nnoremap <C-ScrollWheelUp> :call FontSizePlus()<cr>
"nnoremap <C-ScrollWheelDown> :call FontSizeMinus()<cr>

" zathura forward search
function! SyncTexForward()
    let execstr = "silent !zathura --synctex-forward ".line(".").":".col(".").":%:p %:p:r.pdf &"
    exec execstr
endfunction
au FileType tex nmap <Leader>f :call SyncTexForward()<CR>

" zathura backward search nvim
let g:vimtex_latexmk_build_dir = './build'
let g:vimtex_latexmk_progname = 'nvr'
let g:vimtex_view_method = 'zathura'

" for removing search highlight by hitting ESC
nnoremap <esc> :noh<return><esc>
