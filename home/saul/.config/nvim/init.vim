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
" change conda env from vim
Plug 'cjrh/vim-conda'
" Use jk or kj to escape instead of the hard to reach <Esc>
Plug 'zhou13/vim-easyescape'
" replace, for instance, \pi with the actual charachter
Plug 'khzaw/vim-conceal' " for python
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
" markdown concealing is managed by vim-markdown
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
" the encoding for special chars
set fileformat=unix
" auto-indent after enter
set autoindent
" the level of conceling of text, see :help conceallevel for more details
set conceallevel=2
" indent settings matches tab setting
set smartindent
" enable powerline fonts in airline
let g:airline_powerline_fonts = 1
" exclude the annoying <:> autocompletion
let delimitMate_matchpairs = "(:),[:],{:}"
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
" I want to see where the error comes from
let g:ale_echo_msg_format = '[ALE] [%linter%] %s [%severity%]'
" Which fixers to use
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
    \   'markdown': [
    \       'prettier',
    \       'remark-lint',
    \       'textlint',
    \       'remove_trailing_lines',
    \       'trim_whitespace',
    \   ],
    \   'sh': [
    \       'shfmt',
    \       'remove_trailing_lines',
    \       'trim_whitespace',
    \   ],
    \}
" Run ALE fixers on save
let g:ale_fix_on_save = 1
" jump to the definition of a variable or to its declaration
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_autoclose_preview_window_after_completion=1

" APPEARANCE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable true colors in terminal
set termguicolors
" sets theme
colorscheme molokai
" Since I am using termguicolors, I need to declare colors for gui not cterm!
" Disable background to use transparency in terminal
highlight Normal guibg=none
" hide background in concealed text and change its color
highlight Conceal guibg=none guifg=cyan

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
noremap <C-p> "+P
" for removing search highlight by hitting ESC
nnoremap <esc> :noh<return><esc>
nnoremap <leader>t :terminal<CR>
" Configuration for zhou13/vim-easyescap/
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 500
cnoremap jk <ESC>
cnoremap kj <ESC>
" call the gitup alias (see .zsh_aliases)
nnoremap <C-G> <C-O>:!gitup<CR>

" FILETYPE-SEPCIFIC CONF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim files
""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType vim set shiftwidth=4
autocmd FileType vim set textwidth=79
autocmd FileType vim set expandtab
autocmd FileType vim set colorcolumn=80
autocmd FileType vim let b:delimitMate_quotes = "' ` $"
autocmd FileType vim let b:delimitMate_smart_matchpairs = '^\%(\w\|\!\|[£]\|[^[:space:][:punct:]]\)'

" shell scripts
""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType sh,bash,zsh set shiftwidth=4
autocmd FileType sh,bash,zsh set textwidth=79
autocmd FileType sh,bash,zsh set expandtab
autocmd FileType sh,bash,zsh set colorcolumn=80

" python scripts
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_python_black_options = '--line-length=79'
autocmd FileType python set shiftwidth=4
autocmd FileType python set textwidth=79
autocmd FileType python set expandtab
autocmd FileType python set colorcolumn=80

" latex and biblatex
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Runs a script that cleans out tex build files whenever I close out of a .tex file.
" zathura forward search
function! SyncTexForward()
    let execstr = "silent !zathura --synctex-forward ".line(".").":".col(".").":%:p %:p:r.pdf &"
    exec execstr
endfunction
let g:vimtex_latexmk_build_dir = './build'
let g:vimtex_latexmk_progname = 'nvr'
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'
autocmd VimLeave *.tex !texclear.sh %
autocmd FileType tex nmap <Leader>f :call SyncTexForward()<CR>
autocmd FileType tex,bib let b:delimitMate_quotes = "\" ' ` $"
autocmd FileType tex,bib let b:delimitMate_smart_matchpairs = '^\%(\w\|\!\|[£]\|[^[:space:][:punct:]]\)'

" markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" disable conceal in math mode
let g:tex_conceal = ""
" highlight math mode appropriately
let g:vim_markdown_math = 1
" auto-indent in bullet list
let g:vim_markdown_new_list_item_indent = 1
" put automatically bullets after enter
let g:vim_markdown_auto_insert_bullets = 1
" highlight the yaml preamble
let g:vim_markdown_frontmatter = 1
" ~~this text~~ will be striked through
let g:vim_markdown_strikethrough = 1
autocmd FileType markdown set shiftwidth=2
autocmd FileType markdown set expandtab
autocmd FileType markdown set noautoindent
autocmd FileType markdown let b:delimitMate_quotes = "\" ' ` $"
autocmd FileType markdown let b:delimitMate_smart_matchpairs = '^\%(\w\|\!\|[£]\|[^[:space:][:punct:]]\)'

" FOLDER-SPECIFIC CONF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable ALE and in sshfs mount for performance reasons (I can call It manually)
autocmd BufNewFile,BufRead *sshfs_mountpoint/* let g:ale_fix_on_save = 0
autocmd BufNewFile,BufRead *sshfs_mountpoint/* let g:ale_lint_on_text_changed = 0
autocmd BufNewFile,BufRead *sshfs_mountpoint/* let g:ale_lint_on_enter = 0
