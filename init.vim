cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev QA qa
cnoreabbrev qA qa
cnoreabbrev WQ wq
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev Wqa wqa

set noeol
set noswapfile
set tags+=tags;$HOME
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Autoclosing custom
inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
inoremap (<CR> (<CR>)<ESC>O
inoremap (;<CR> (<CR>);<ESC>O
inoremap [<CR> [<CR>]<ESC>O
inoremap [;<CR> [<CR>];<ESC>O

""let g:clipboard = {
""  \   'name': 'xclip-custom',
""  \   'copy': {
""  \      '+': 'env DISPLAY=:0 xclip -quiet -i -selection clipboard',
""  \      '*': 'env DISPLAY=:0 xclip -quiet -i -selection primary',
""  \    },
""  \   'paste': {
""  \      '+': 'env DISPLAY=:0 xclip -o -selection clipboard',
""  \      '*': 'env DISPLAY=:0 xclip -o -selection primary',
""  \   },
""  \ }
""let g:clipboard = {
""    \ 'name': 'xsel',
""    \ 'copy': {
""    \     '+': 'xsel -ib',
""    \     '*': 'xsel -ip'
""    \ },
""    \ 'paste': {
""    \     '+': 'xsel -ob',
""    \     '*': 'xsel -op'
""    \ },
""    \ 'cache_enabled': 1
""    \ }
set clipboard=unnamed
let g:clipboard = {
  \ 'name': 'pbcopy',
  \ 'copy': {
  \    '+': 'pbcopy',
  \    '*': 'pbcopy',
  \  },
  \ 'paste': {
  \    '+': 'pbpaste',
  \    '*': 'pbpaste',
  \ },
  \ 'cache_enabled': 0,
  \ }


" Required:
set rtp+=/Users/arturdaschevici/.config/nvim/dein/repos/github.com/Shougo/dein.vim
set rtp+=/Users/arturdaschevici/.config/nvim/dein/repos/github.com/epilande/vim-react-snippets/UltiSnips
set rtp+=~/.fzf

let g:python3_host_prog='/usr/local/opt/python36/bin/python3.6'
let g:python2_host_prog='/usr/local/opt/python27/bin/python2.7'

" Required:
if dein#load_state('/Users/arturdaschevici/.config/nvim/dein')
  call dein#begin('/Users/arturdaschevici/.config/nvim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/arturdaschevici/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  " call dein#add('Shougo/neosnippet.vim')
  " call dein#add('Shougo/neosnippet-snippets')

  call dein#add('scrooloose/nerdtree')
  call dein#add('scrooloose/syntastic')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('fatih/vim-go')
  call dein#add('jimenezrick/vimerl')
  call dein#add('nvie/vim-flake8')
  call dein#add('rust-lang/rust.vim')
  call dein#add('pangloss/vim-javascript')
  call dein#add('maksimr/vim-jsbeautify')
  call dein#add('mxw/vim-jsx.git')
  call dein#add('derekwyatt/vim-scala')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')
  call dein#add('mhinz/vim-signify')
  call dein#add('chrisbra/csv.vim')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('AndrewRadev/linediff.vim')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('junegunn/fzf.vim')
  call dein#add('racer-rust/vim-racer')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('mattn/emmet-vim')
  call dein#add('w0rp/ale')
  call dein#add('dag/vim-fish')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('jasonshell/vim-svg-indent')
  call dein#add('epilande/vim-react-snippets')
  call dein#add('ncm2/ncm2')
  call dein#add('SirVer/ultisnips')
  call dein#add('Shougo/deoplete.nvim')

  ""call dein#add('Shougo/neosnippet.vim')
  ""call dein#add('Shougo/neosnippet-snippets')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('elixir-editors/vim-elixir')
  call dein#add('Valloric/MatchTagAlways')
  call dein#add('skywind3000/asyncrun.vim')
  call dein#add('jremmen/vim-ripgrep')
  call dein#add('junegunn')
  " Required:
  call dein#end()
  call dein#save_state()
endif

" "call plug#begin('~/.vim/plugged')
" "
" "Plug 'SirVer/ultisnips'
" "Plug 'epilande/vim-es2015-snippets'
" "Plug 'epilande/vim-react-snippets'
" "
" "call plug#end()

" Required:
filetype plugin indent on
syntax enable
let g:NERDTreeWinSize=60

" Python flake8 config options
" "let g:flake8_cmd="/Users/arturdaschevici/Projects/.venv/bin/flake8"
" "let g:flake8_show_in_file=1
" "" to use colors defined in the colorscheme
" "highlight link Flake8_Error      Error
" "highlight link Flake8_Warning    WarningMsg
" "highlight link Flake8_Complexity WarningMsg
" "highlight link Flake8_Naming     WarningMsg
" "highlight link Flake8_PyFlake    WarningMsg
" "
" "autocmd BufWritePost *.py call flake8#Flake8()
" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

" fugitive git bindings
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>

" set nocompatible              " be iMproved, required
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set history=700                " Sets how many lines of history VIM has to remember

set nocompatible
set background=dark
colo solarized
syntax on

set showmode

set autoindent
set smartindent
set backspace=eol,start,indent

set expandtab
set tabstop=4
set shiftwidth=4
set ruler

set ignorecase
set smartcase
set hlsearch
set nowrap
set laststatus=2
set cmdheight=2
if exists('loaded_trailing_whitespace_plugin') | finish | endif
let loaded_trailing_whitespace_plugin = 1

if !exists('g:extra_whitespace_ignored_filetypes')
    let g:extra_whitespace_ignored_filetypes = []
endif

function! ShouldMatchWhitespace()
    for ft in g:extra_whitespace_ignored_filetypes
        if ft ==# &filetype | return 0 | endif
    endfor
    return 1
endfunction

" Highlight EOL whitespace, http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=darkred guibg=#382424
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * if ShouldMatchWhitespace() | match ExtraWhitespace /\s\+$/ | endif

" The above flashes annoyingly while typing, be calmer in insert mode
autocmd InsertLeave * if ShouldMatchWhitespace() | match ExtraWhitespace /\s\+$/ | endif
autocmd InsertEnter * if ShouldMatchWhitespace() | match ExtraWhitespace /\s\+\%#\@<!$/ | endif

function! s:FixWhitespace(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
    call setpos('.', l:save_cursor)
endfunction
highlight Search ctermbg=LightBlue ctermfg=white
vnoremap // y/<C-R>"<CR>
let g:go_fmt_command = "goimports"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
" let g:go_fmt_fail_silently = 1

set ttimeoutlen=50
let g:airline_theme = 'powerlineish'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

if !exists('g:airline_symbols')
      let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" "let g:syntastic_use_quickfix_lists = 1
let g:jsx_ext_required = 0
" Deoplete using yay
" let g:deoplete#enable_at_startup = 1

au FileType python setl sw=4 sts=4 et
au FileType css setl sw=2 sts=2 et
au FileType scss setl sw=2 sts=2 et
au FileType js setl sw=2 sts=2 et
au FileType ts setl sw=2 sts=2 et
au FileType go setl sw=4 sts=4 et
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
au FileType json setlocal ts=2 sts=2 sw=2 expandtab
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++14 -stdlib=libc++'
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sw=2 expandtab
let g:neomake_javascript_enabled_makers = ['./node_modules/eslint/bin/eslint.js']
let g:syntastic_javascript_checkers = ['./node_modules/eslint/bin/eslint.js']

" "let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
" "let g:syntastic_auto_loc_list = 0
" "let g:syntastic_check_on_open = 1
" "let g:syntastic_check_on_wq = 1
" "let g:syntastic_javascript_checkers = ['./node_modules/eslint/bin/eslint.js']
" let g:syntastic_javascript_eslint_exe = '/Users/artur-iuliandaschevici/.nvm/versions/node/v8.4.0/bin/eslint'
""let g:syntastic_javascript_eslint_exe = 'npm run lint -- %f'

" let g:syntastic_error_symbol = '❌'
" let g:syntastic_style_error_symbol = '⁉️'
" let g:syntastic_warning_symbol = '!!'
" let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

let g:ale_linters = {
\      'javascript': ['eslint'],
\      'js': ['eslint'],
\      'jsx': ['eslint']
\}

let g:ale_linters_explicit = 1
let g:ale_javascript_prettier_use_local_config = 1

let g:ale_fixers = {}
let g:ale_fixers = {
\      'javascript': ['prettier'],
\      'js': ['prettier'],
\      'jsx': ['prettier'],
\      'json': ['prettier'],
\      'graphql': ['prettier'],
\      'css': ['prettier']
\}

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_fix_on_save = 1

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
" nnoremap \ :Ag<SPACE>
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#ignore_sources = {}
" let g:deoplete#ignore_sources._ = ["neosnippet"]
" I want to use my tab more smarter. If we are inside a completion menu jump
" to the next item. Otherwise check if there is any snippet to expand, if yes
" expand it. Also if inside a snippet and we need to jump tab jumps. If none
" of the above matches we just call our usual 'tab'.
function! s:neosnippet_complete()
  if pumvisible()
    return "\<c-n>"
  else
    if neosnippet#expandable_or_jumpable()
      return "\<Plug>(neosnippet_expand_or_jump)"
    endif
    return "\<tab>"
  endif
endfunction

imap <expr><TAB> <SID>neosnippet_complete()

" "set rtp+=~/.config/nvim/dein/ultisnips/
" "set rtp+=~/.config/nvim/dein/deoplete.nvim/
" "set rtp+=~/.config/nvim/mysnips/

set rtp+=~/.config/nvim/dein/ultisnips/
set rtp+=~/.config/nvim/dein/deoplete.nvim/
set runtimepath+=~/.vim/my-snippets/

" let g:deoplete#enable_at_startup = 1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories = [expand('~/.vim/my-snippets'), 'my-snippets']

let g:deoplete#enable_at_startup = 1
""let g:neosnippet#enable_snipmate_compatibility = 1
""let g:neosnippet#snippets_directory='~/.vim/my-snippets'

inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"
" inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<tab>"
let g:typescript_indent_disable = 1
""let g:syntastic_go_checkers = ['go']

" ----configure GitGutter
nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk
let g:gitgutter_log = 1
" --end--configure GitGutter
"  ------configure Fugitive
"  --end-configure Fugitive

" Convert slashes to backslashes for Windows.
if has('win32')
  nmap ,cs :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
  nmap ,cl :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>

  " This will copy the path in 8.3 short format, for DOS and Windows 9x
  nmap ,c8 :let @*=substitute(expand("%:p:8"), "/", "\\", "g")<CR>
else
  nmap ,cs :let @*=expand("%")<CR>
  nmap ,cl :let @*=expand("%:p")<CR>
endif
let NERDTreeShowHidden=1

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \}
" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif
"End dein Scripts-------------------------
