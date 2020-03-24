" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

if has('nvim')
    " ~/.config/nvim/init.vim
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = $runtimepath
    set clipboard+=unnamedplus
    let g:python3_host_prog = $NVIM_PY3
endif

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
"
" CXTags
Plugin 'chuanxiang/vim-tags.git'

" CX Toogle Comment
Plugin 'chuanxiang/vim-toggle-comment.git'

" CX Toogle Comment
Plugin 'chuanxiang/vim-cflags.git'

" NERD Tree
" Plugin 'scrooloose/nerdtree'

" Tag List
Plugin 'vim-scripts/taglist.vim'

" netrw
" Plugin 'eiginn/netrw'

" ctrlp
Plugin 'ctrlpvim/ctrlp.vim'

" mark
" Plugin 'vim-scripts/Mark--Karkat'
Plugin 'chuanxiang/Mark--Karkat'

" yaml
Plugin 'chase/vim-ansible-yaml'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'embear/vim-localvimrc'

Plugin 'jlanzarotta/bufexplorer'

Plugin 'chazy/cscope_maps'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Eslint take care of this
" Plugin 'prettier/prettier'

Plugin 'w0rp/ale'

" Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-easytags'

" Plugin 'JamshedVesuna/vim-markdown-preview'

" Auto Completion
Plugin 'davidhalter/jedi-vim'
Plugin 'Valloric/YouCompleteMe'

Plugin 'will133/vim-dirdiff'

Plugin 'tpope/vim-cucumber'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

imap jk <Esc>
let g:localvimrc_debug = 0
let g:localvimrc_sandbox = 1

set hlsearch
set incsearch
syntax on
set shiftwidth=4
set expandtab
set softtabstop=4 
set tabstop=4
set cindent
set autoindent
set number
set encoding=utf-8
set ruler
set tpm=20
set ffs=unix,dos  "Set new file format to unix
set ssop=buffers,curdir,folds,help ",options,tabpages,winsize,globals
let mapleader = '\'
set ic
set nofoldenable
set mouse=a
set colorcolumn=100

" set foldmethod=marker

if has('gui_running')
    colorscheme evening
else
    colorscheme delek
endif

if has("win32")
    let $PYTHONPATH = "C:\\Python27\\Lib;C:\\Python27\\DLLs;C:\\Python27\\Lib\\lib-tk"
    if has("gui_running")
        set guifont=Consolas:h11:cANSI

        " Maximize GVim Window on Startup {{{
        if has('gui_running') && has("win32")
            au GUIEnter * simalt ~x
        endif
        " }}}
    endif
elseif has("unix")

elseif has("macunix")

else
    echom "unknown os"
endif

nnoremap <silent><expr> <f2> ':set wrap! go'.'-+'[&wrap]."=b\r"
nnoremap <silent><expr> <f3> 'Nzz'
nnoremap <silent><expr> <f4> 'nzz'


" Map Ctrl-C {{{
map <C-c> "+y<CR>
" }}}

" Remove all mouse actions {{{
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
imap <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>
" }}}


" Edit/Source vimrc {{{
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}


" P4 operations {{{
nnoremap <silent> <leader>pe :exec "!cxp4co.py co " . shellescape(expand('%:p'))<cr>
nnoremap <silent> <leader>pr :exec "!cxp4co.py revert " . shellescape(expand('%:p'))<cr>
nnoremap <silent> <leader>pd :exec "!cxp4co.py diff " . shellescape(expand('%:p'))<cr>
" }}}

" Jump to tag and put it in center
nnoremap z] g]zz


""""For CtrlP""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.UDS,*.uds,*.lod,*.LOD,*.dmp,*.7z     " MacOSX/Linux
" use ctrlp_user_command instead
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$\|node_modules'
" let g:ctrlp_custom_ignore = '\v[\/]\.(DS_Storegit|hg|svn|optimized|compiled|node_modules)$'
nnoremap <leader>tag :CtrlPTag<cr>

" Fast serach
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
else
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
    let g:ctrlp_prompt_mappings = {
                \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
                \ }
endif

autocmd BufNewFile,BufRead *.ss,*.gls,*.es,*.ts   setfiletype c
autocmd BufNewFile,BufRead *.cmm   setfiletype trace
autocmd BufNewFile,BufRead *.json,*.yaml,*.yml,*.js,*.md,*.feature  set shiftwidth=2 | set softtabstop=2 | set tabstop=2

" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" command! -nargs=? Filter let @z='' | execute 'g/<args>/y Z' | vnew | setlocal bt=nofile | put! z
" command! -nargs=? FilterH let @z='' | execute 'g/<args>/y Z' | new | setlocal bt=nofile | put! z
" command! -nargs=? ListErrors let @z='' | execute 'g/ERROR-\|^\s*\d\./y Z' | vnew | setlocal bt=nofile | put! z

" nnoremap <silent> <S-Tab> :TlistToggle<cr>:SrcExplToggle<cr>
" Config TagList {{{
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
nmap <silent> <leader>tt :TlistToggle<cr>
" }}}

" For ALE
let g:ale_sign_column_always = 1
let g:ale_python_flake8_args="--max-line-length=110"
"--ignore D100,E111,E302,E201,E202,E114,E501,E251,E261"
"
let g:ale_linters = {
\   'c': [],
\   'cpp': [],
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'python': ['autopep8'],
\}
nmap <leader>d <Plug>(ale_fix)

" For markdown preview
let vim_markdown_preview_hotkey='<C-m>'

let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_min_num_identifier_candidate_chars = 3
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
nnoremap <leader>jd :YcmCompleter GoTo<CR>

"set completeopt-=preview
"let g:ycm_add_preview_to_completeopt = 0

" Change search highlight color
hi Search ctermfg=darkgrey
hi ColorColumn ctermbg=darkgrey guibg=darkgrey
