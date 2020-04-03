let mapleader =" "

" need when conda is active
let g:python3_host_prog = '/usr/bin/python'

" set system clipboard
set clipboard+=unnamedplus

" activate mouse
set mouse=a

" set cwd to the one open
set autochdir

" all plugins here, managed by vim-plugged
call plug#begin('~/.vim/plugged')

Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'thinca/vim-quickrun'			"allows execution of code in a separate window
Plug 'vim-latex/vim-latex'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'			" git wrapper for vim
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer'}
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'lervag/vimtex'
Plug 'thaerkh/vim-indentguides'
Plug 'tpope/vim-surround'
Plug 'tmhedberg/simpylfold'
Plug 'python-mode/python-mode'
Plug 'kamykn/spelunker.vim'
Plug 'psf/black', { 'tag': '19.10b0' }
Plug 'tomtom/tcomment_vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/goyo.vim'
Plug 'Raimondi/delimitMate'

" colorschemes
Plug 'morhetz/gruvbox'	"color scheme
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
Plug 'gosukiwi/vim-atom-dark'
Plug 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call plug#end()

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

" format with :Black when saving py files
autocmd BufWritePre *.py execute ':Black'

" config for terminal mode
let s:term_buf = 0
let s:term_win = 0

function! TermToggle(height)
    if win_gotoid(s:term_win)
        hide
    else
        new terminal
        exec "resize " . a:height
        try
            exec "buffer " . s:term_buf
            exec "bd terminal"
            set nonumber norelativenumber
            set signcolumn=no
            set nocursorline
        catch
            call termopen($SHELL, {"detach": 0})
            let s:term_buf = bufnr("")
            set nonumber norelativenumber
            set signcolumn=no
            set nocursorline
        endtry
        startinsert!
        let s:term_win = win_getid()
    endif
endfunction

nnoremap <silent><A-t> :call TermToggle(12)<CR>
inoremap <silent><A-t> <Esc>:call TermToggle(12)<CR>
tnoremap <silent><A-t> <C-\><C-n>:call TermToggle(12)<CR>

" YouCompleteMe confs
let g:ycm_autoclose_preview_window_after_insertion = 1
