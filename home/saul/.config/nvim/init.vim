"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SAUL NVIM CONFIG
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" PLUGINS (vim plugged)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" general plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'                   " git wrapper
Plug 'plasticboy/vim-markdown'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'SirVer/ultisnips'
Plug 'thaerkh/vim-indentguides'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/goyo.vim'
Plug 'Raimondi/delimitMate'
Plug 'lervag/vimtex'

" general code completers
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all'}
Plug 'w0rp/ale' " this controls the linting in python and other languages
                " it implements black, autopep8, pyflakes and others
                " see the configuration part

" python stuff
"Plug 'psf/black', { 'tag': '19.10b0' } " provided by ale
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-syntastic/syntastic'
"Plug 'davidhalter/jedi-vim' " provided by YCM

" colorschemes
Plug 'morhetz/gruvbox'	"color scheme
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
Plug 'gosukiwi/vim-atom-dark'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'

" All of your Plugins must be added before the following line
call plug#end()

" GENERAL SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype on
filetype plugin indent on
syntax enable
syntax on
set nospell
set encoding=utf-8
set hlsearch
" needed when conda is active
let g:python3_host_prog = '/usr/bin/python'
" set system clipboard
set clipboard+=unnamedplus
" activate mouse
set mouse=a
" set cwd to the one open
set autochdir
" hide the --INSERT-- and other status (since it is shown by airline)
set noshowmode 
" enable autocompletion
set wildmode=longest,list,full
" disable autocommenting on new line (fo=formatoptions)
autocmd FileType * setlocal fo-=c fo-=r fo-=o fo+=l
" open split on the right or bottom by default
set splitbelow splitright
" Show special characters
set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<
set list
" shows the current row and coloumn
set ruler
" do not show indentation like if it is code
let g:indentguides_ignorelist = ['markdown']
" fold according to the syntax of the language
set foldmethod=syntax
" but do not fold by default
set nofoldenable
" show line number column
"set number relativenumber
" show absolute numbers in insert mode
"augroup numbertoggle
"  autocmd!
"  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END

" APPEARANCE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable true colors in terminal
set termguicolors
" sets theme
colorscheme molokai
" Since I am using termguicolors, I need to declare colors for gui not cterm!
" Disable background to use transparency in terminal
highlight Normal guibg=none



" SHORTCUTS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the leader charachter to space
let mapleader =" "
" for tabs
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <Tab> :tabedit<Space>
" call the complier script and show the output
nnoremap <leader>c : !compiler.sh %:p<CR>
nnoremap <leader>p : !show_output.sh %:p<CR><CR>
" configure cross-program copy-paste
vnoremap <C-c> "+y
map <C-p> "+P
" for removing search highlight by hitting ESC
nnoremap <esc> :noh<return><esc>

" AIRLINE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme= "minimalist"
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

" FILE-SEPCIFIC CONF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" .py
""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set colorcolumn=80
let g:SimpylFold_docstring_preview=1
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ale_fixers = {
  \   'python': [
  \       'add_blank_lines_for_python_control_statements',
  \       'autopep8',
  \       'black',
  \       'isort',
  \       'reorder-python-imports',
  \       'isort',
  \       'yapf',
  \       'remove_trailing_lines',
  \       'trim_whitespace',
  \   ],
  \}
let g:ale_fix_on_save = 1
let g:ale_python_black_options = '--line-length=79'
" python linting for pymode
let g:pymode_options_max_line_length = 88

" .tex
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear.sh %
" zathura forward search
function! SyncTexForward()
    let execstr = "silent !zathura --synctex-forward ".line(".").":".col(".").":%:p %:p:r.pdf &"
    exec execstr
endfunction
au FileType tex nmap <Leader>f :call SyncTexForward()<CR>
let g:vimtex_latexmk_build_dir = './build'
let g:vimtex_latexmk_progname = 'nvr'
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'
au FileType tex,bib let b:delimitMate_quotes = "\" ' ` $"
au FileType tex,bib let b:delimitMate_smart_matchpairs = '^\%(\w\|\!\|[£]\|[^[:space:][:punct:]]\)'

" .md
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" config for vim-markdown
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
au FileType markdown let b:delimitMate_quotes = "\" ' ` $"
au FileType markdown let b:delimitMate_smart_matchpairs = '^\%(\w\|\!\|[£]\|[^[:space:][:punct:]]\)'
