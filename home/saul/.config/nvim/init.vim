"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SAUL NVIM CONFIG
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" PLUGINS (vim plugged)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" airline statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" git wrapper, just use :Git or :G to run git commands
" it has several improvements over plain old :!git
Plug 'tpope/vim-fugitive'
" provides folding for markdown and synthax highlighting
Plug 'plasticboy/vim-markdown'
" file explorer
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" show indentation guides
Plug 'thaerkh/vim-indentguides'
" autoinserts, edits and removes surroundings: parentheses, quotes, ...
Plug 'tpope/vim-surround'
" comment/uncomment text
Plug 'tomtom/tcomment_vim'
" autoformat markdown tables
Plug 'dhruvasagar/vim-table-mode'
" autoclose quotes and parentheses
Plug 'Raimondi/delimitMate'
" for latex: autocompletion, forward search, and more
Plug 'lervag/vimtex'
" general code completer for many languages
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all'}
" this controls the linting in python and other languages
" it implements black, autopep8, pyflakes and others
" see the configuration part
Plug 'w0rp/ale' 
" proper folding for python, use normal vim commands
Plug 'tmhedberg/SimpylFold'
" shows synthax errors in many languages
Plug 'vim-syntastic/syntastic'
" change conda env from vim
Plug 'cjrh/vim-conda'
" Use jk or kj to escape instead of the hard to reach <Esc>
Plug 'zhou13/vim-easyescape'
" colorscheme
Plug 'tomasr/molokai'
call plug#end()

" GENERAL SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" read .zshrc and aliases
set shell=zsh\ -i
" needed when conda is active for packages to work
" If you have python problems with packages install with pynvim pip (and pip2)
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'
" use the system clipboard
set clipboard=unnamedplus
" activate mouse
set mouse=a
" hide the --INSERT-- and other status (since it is shown by airline)
set noshowmode
" Show special characters
set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<
set list
" do not show indentation like if it is code
let g:indentguides_ignorelist = ['markdown','txt']
" enable powerline fonts in airline
let g:airline_powerline_fonts = 1
" exclude the annoying <:> autocompletion
let delimitMate_matchpairs = "(:),[:],{:}"

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
" cannot use C-v for paste since it is used for visual selection
map <C-p> "+P
" for removing search highlight by hitting ESC
nnoremap <esc> :noh<return><esc>
nnoremap <leader>t :terminal<CR>
" Configuration for zhou13/vim-easyescap/
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 500
cnoremap jk <ESC>
cnoremap kj <ESC>

" FILETYPE-SEPCIFIC CONF
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
let g:ycm_autoclose_preview_window_after_completion=1
" jump to the definition of a variable or to its declaration
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" which fixer to use from w0rp/ale
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
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
au FileType markdown let b:delimitMate_quotes = "\" ' ` $"
au FileType markdown let b:delimitMate_smart_matchpairs = '^\%(\w\|\!\|[£]\|[^[:space:][:punct:]]\)'


" FOLDER-SPECIFIC CONF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable ALE and synthastic in sshfs mount for performance reasons (I can call It manually)
au BufNewFile,BufRead *sshfs_mountpoint/*
    \ let g:ale_fix_on_save = 0 |
    \ let g:ale_lint_on_text_changed = 0 |
    \ let g:ale_lint_on_enter = 0 |
    \ let g:syntastic_python_checkers = [''] |
    \ let g:syntastic_check_on_open = 0 |
    \ let g:syntastic_check_on_wq = 0 |
