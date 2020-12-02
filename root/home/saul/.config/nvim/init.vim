"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" SAUL NVIM CONFIG
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" must be before plugins are loaded
" I use Coc for LSP
let g:ale_disable_lsp = 1

" PLUGINS (vim plugged)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" airline statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" git wrapper, just use :Git or :G to run git commands
" it has several improvements over plain old :!git
Plug 'tpope/vim-fugitive'
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
" proper folding for python, use normal vim commands
Plug 'tmhedberg/SimpylFold'
" change conda env from vim (does not work for Coc)
Plug 'cjrh/vim-conda'
" Use jk or kj to escape instead of the hard to reach <Esc>
Plug 'zhou13/vim-easyescape'
" replace, for instance, \pi with the actual charachter
Plug 'khzaw/vim-conceal' " for python
" markdown concealing is managed by vim-markdown
" tex concealing is managed by vimtex

" provides folding for markdown and synthax highlighting
Plug 'plasticboy/vim-markdown'
" for latex: forward search, syntax highlighting, and more
" this is a complete plugin that does not try to replace linters (ALE)
" or to create an IDE
" I installed also its Coc integration
Plug 'lervag/vimtex'

" this controls the linting in python and other languages
Plug 'dense-analysis/ale' 

" general code completer for many languages with intellisense (with extensions)
" plugin installation requires yarn
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Microsoft LSP for python
Plug 'fannheyward/coc-pyright', {'do': 'yarn install --forzen-lockfile'}
" Microsoft LSP for tex
Plug 'fannheyward/coc-texlab', {'do': 'yarn install --forzen-lockfile'}
" Integration for vimtex autocompletion
Plug 'neoclide/coc-vimtex', {'do': 'yarn install --forzen-lockfile'}
" provides bash-language-server
Plug 'josa42/coc-sh', {'do': 'yarn install --forzen-lockfile'}
" autocompletions for json settings in coc config
Plug 'neoclide/coc-json', {'do': 'yarn install --forzen-lockfile'}

" colorscheme
Plug 'tomasr/molokai'
call plug#end()

" GENERAL SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" read .zshrc and aliases
set shell=zsh\ -i
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
" Which fixers to use
let g:ale_fixers = {
    \   'python': [
    \       'add_blank_lines_for_python_control_statements',
    \       'black',
    \       'isort',
    \       'remove_trailing_lines',
    \       'trim_whitespace',
    \   ],
    \   'markdown': [
    \       'prettier',
    \       'remove_trailing_lines',
    \       'trim_whitespace',
    \   ],
    \   'tex': [
    \       'latexindent',
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
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#coc#enabled = 1
" I want to see where the error comes from
let g:ale_echo_msg_format = '[ALE] [%linter%] %s [%severity%]'

" Coc.nvim configurations (edited from the official github)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute nh '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif

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
nnoremap <leader>t :!$TERMCMD -d "%:p:h"&<CR><CR>
" Configuration for zhou13/vim-easyescap/
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 500
cnoremap jk <ESC>
cnoremap kj <ESC>

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
" change the conda environment in ALE and pyright (Coc python LSP)
" NOTE: this works only once, if you want to change twice, close and open vim
" again
function! CondaActivate()
" this is provided by vim-conda and works for ALE
    CondaChangeEnv
" set the first entry in $PATH (set by the previous command) to the Coc config file
    !pyright_change_env.sh
    ALEReset
    ALELint
endfunction
autocmd FileType python nnoremap ca :call CondaActivate()<CR><CR>


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
" to be same with the deafult linting
autocmd FileType tex,bib set shiftwidth=8
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

" json
""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType json set shiftwidth=4

" FOLDER-SPECIFIC CONF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable ALE and in sshfs mount for performance reasons (I can call It manually)
autocmd BufNewFile,BufRead *sshfs_mountpoint/* let g:ale_fix_on_save = 0
autocmd BufNewFile,BufRead *sshfs_mountpoint/* let g:ale_lint_on_text_changed = 0
autocmd BufNewFile,BufRead *sshfs_mountpoint/* let g:ale_lint_on_enter = 0
" Disable also Coc (note that must be b, not g)
autocmd BufNewFile,BufRead *sshfs_mountpoint/* let b:coc_enabled = 0
