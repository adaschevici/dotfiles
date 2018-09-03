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

set clipboard+=unnamedplus

if &compatible
  set nocompatible               " Be iMproved
endif
" Required:
set runtimepath^=/Users/zero/.config/nvim/dein//repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('/Users/zero/.config/nvim/dein/'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

" You can specify revision/branch/tag.
" call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

call dein#add('scrooloose/nerdtree')
call dein#add('scrooloose/syntastic')
call dein#add('kien/ctrlp.vim')
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
call dein#add('Shougo/deoplete.nvim')
call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')
call dein#add('AndrewRadev/linediff.vim')
call dein#add('leafgarland/typescript-vim')
call dein#add('junegunn/fzf.vim')
call dein#add('racer-rust/vim-racer')
call dein#add('terryma/vim-multiple-cursors')

" Required:
call dein#end()

" Required:
filetype plugin indent on

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
set number
" filetype off                  " required
"
" " set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
" Plugin 'gmarik/Vundle.vim'
" Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/syntastic'
" Plugin 'kien/ctrlp.vim'
" Plugin 'fatih/vim-go'
" Plugin 'jimenezrick/vimerl'
" Plugin 'nvie/vim-flake8'
" Plugin 'rust-lang/rust.vim'
" Plugin 'pangloss/vim-javascript'
" Plugin 'maksimr/vim-jsbeautify'
" Plugin 'mxw/vim-jsx.git'
" Plugin 'derekwyatt/vim-scala'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'airblade/vim-gitgutter'
" Plugin 'tpope/vim-fugitive'
" Plugin 'mhinz/vim-signify'
" call vundle#end()            " required
" filetype plugin indent on    " required

set history=700                " Sets how many lines of history VIM has to remember

set nocompatible
colo jellybeans
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
set backup
set backupdir=~/vim/tmp/
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
let g:syntastic_use_quickfix_lists = 0
let g:jsx_ext_required = 0
" Deoplete using yay
" let g:deoplete#enable_at_startup = 1

au FileType python setl sw=4 sts=4 et
au FileType css setl sw=2 sts=2 et
au FileType scss setl sw=2 sts=2 et
au FileType js setl sw=2 sts=2 et
au FileType ts setl sw=2 sts=2 et
au FileType go setl sw=4 sts=4 et
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++14 -stdlib=libc++'
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sw=2 expandtab
let g:neomake_javascript_enabled_makers = ['./node_modules/.bin/eslint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
" let g:syntastic_javascript_eslint_exe = '/Users/artur-iuliandaschevici/.nvm/versions/node/v8.4.0/bin/eslint'
let g:syntastic_javascript_checkers = ['./node_modules/.bin/eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

" let g:syntastic_error_symbol = '❌'
" let g:syntastic_style_error_symbol = '⁉️'
" let g:syntastic_warning_symbol = '!!'
" let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

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
nnoremap \ :Ag<SPACE>
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ["neosnippet"]
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

set rtp+=~/.config/nvim/dein/ultisnips/
set rtp+=~/.config/nvim/dein/deoplete.nvim/
set rtp+=~/.config/nvim/mysnips/

" let g:deoplete#enable_at_startup = 1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/mysnips', 'mysnips']

inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"
" inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<tab>"
let g:typescript_indent_disable = 1
let g:syntastic_go_checkers = ['go']

nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk
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
