"""""""""""""""""""""""""""""""""""Vunble""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off "required!
set rtp+=~/.vim/bundle/vundle/	"rtp runtimepath
call vundle#rc()
" let Vundle manage Vundle
""Bundle 'rdnetto/YCM-Generator',{'branch':'stable'}
""Bundle 'jeaye/color_coded'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/vimshell.vim'
Bundle 'lervag/vimtex'
Bundle 'chumakd/perlomni.vim'
""Bundle 'perlsupport'
Bundle 'gmarik/vundle'
"Bundle 'https://github.com/LoKaltog/vim-powerline.git'
Bundle 'bling/vim-airline'
"vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
"cpp.vim
"Bundle 'cpp.vim'
"NERD tree
Bundle 'https://github.com/scrooloose/nerdtree'
Bundle 'octol/vim-cpp-enhanced-highlight'
""""""语法检查
Bundle 'scrooloose/syntastic'
""""""""""Python
""Bundle 'orenhe/pylint.vim'
""Minibuffer
"Bundle 'minibufexpl.vim'
Bundle 'bling/vim-bufferline'
Bundle 'a.vim'
""xtemplete
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
""Bundle 'drmingdrmer/xptemplate'
"Bundle 'SirVer/ultisnips'
""jedi python的补全
Bundle 'davidhalter/jedi'
""调试gdb
Bundle 'vim-scripts/Conque-GDB'
""CtrlP
Bundle 'kien/ctrlp.vim'
""Tagbar
Bundle 'majutsushi/tagbar'
""easymotion
Bundle 'easymotion/vim-easymotion'
""编码格式
Bundle 'fencview.vim'
""Bundle 'honza/vim-snippets'
""脚本可执行
Bundle 'addexecmod.vim'
""Chinese vim
Bundle "vimcn/vimcdoc"
""
""Bundle 'rdnetto/YCM-Generator'
""Bundle 'robturtle/newycm_extra_conf.py'
filetype plugin indent on "
""""""""""""""""""""""""""""""end of Vundle""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""airline"""""""""""""""""""""""""""""""""""""""""""{{{
set laststatus=2
set t_Co=256 ""If using neovim this shouldn't be set
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#buffline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#buffline#overwrite_variables=1
set encoding=utf-8
set fencs=utf-8,gbk
set fileencodings=utf-8,gb2312,ucs-bom,euc-cn.euc-tw,gb18030,gbk,cp936
""""""""""""""""""""""""""""end of powerline""""""""""""""""""""""""""""""}}}
""""""""""""""""""""""""""""""nerdter"""""""""""""""""""""""""""""""""""""
""autocmd vimenter * NERDTree "if you want nerdter auto open when you open
let g:NERDTreeWinSize=16
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
""""""""""""""""""""""""""""""""""end""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""ctags"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""end"""""""""""""""""""""""""""""""""""""""""""
"-------------------map setting--------------------{{{
let mapleader =","
let maplocalleader=",,"
""快速打开vim配置文件
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
""重读vim配置文件
nnoremap <leader>sv :source $MYVIMRC<cr>
""使用外部粘贴板
"nnoremap <C-v> "+gp
""防止main函数输错的映射
iabbrev mian main
iabbrev csont const
""插入我的邮箱
"iabbrev @@ liuhiter@gmail.com
""自动命令组
""-------------------------------}}}
""C,C++整行注释-------{{{
augroup filetype_cppc
autocmd!
autocmd filetype cpp nnoremap <buffer><localleader>c I//<esc>
autocmd filetype c nnoremap <buffer><localleader>c I//<esc>
autocmd filetype cpp map <F5> <Esc>:w!<CR>:!clang++ -std=c++11 % -o %< <CR>
autocmd filetype c map <F5> <Esc>:w!<CR>:!clang  % -o %< -lm <CR>
autocmd filetype c map <F6> <Esc>:w!<CR>:!clang  -g % -o %< -lm <CR>
autocmd filetype cpp map <F6> <Esc>:w!<CR>:!clang++ -std=c++11 -g % -o %< -lm <CR>
augroup END
""}}}
""""""vim脚本自动折叠""""""""""""""""""""""""""""""""""""""""""""
"""""Vimscript file settings-------------{{{
augroup filetype_vim
autocmd!
autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""<F5>"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""end"""""""""""""""""""""""""""""""""""""""""
"""""""""""other things"""""""""""""""""""""""""""-----{{{
set showcmd ""显示命令
set number ""显示行号
set encoding=utf8
set nocompatible "关闭vi兼容
set tabstop=4	"设定tab = 4
set softtabstop=4
set shiftwidth=4
""实现语法高亮
syntax enable
syntax on
""搜索高亮
set hlsearch incsearch
""背景
colorscheme molokai
let g:molokai_original = 1
""隐藏状态栏，美观一下
set guioptions=P
""覆盖文件时不备份
set nobackup
""编辑时不产生交换文件
set noswapfile
""开启自动缩进
set autoindent
""开启新行时自动缩进
set smartindent
""C样式缩进
set cindent
""使用Tab缩进
set smarttab
""设置字体
set guifont=DejaVu\ Sans\ Mono\ 11
"相对行号
set relativenumber
"高亮当前行
set cursorline
"}}}
""""""""""""""""""""YCM""""""""""""""""""""""""""""""""""""""""""""""""""""
""NOTE:If you use debian/ubuntu/mint you can just using apt-get
""install vim-youcompleteme, Arch user can use yarout to get it.
""This for neovim haven't successful
set completeopt=longest,menu,preview
autocmd InsertLeave * if pumvisible()==0|pclose|endif
inoremap <expr><CR> pumvisible()?'<C-y>':'<CR>'
let g:ycm_collect_identifiers_from_tags_files=0
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
""""""""""""""""""""""""end""""""""""""""""""""""""""""""""
""""""""""""""""""""""""syntastic""""""""""""""""""""""""""
""let g:syntastic_ignore_files=[".*\.py$"]
let g:syntastic_cpp_complier='clang++'
let g:syntastic_cpp_complier_options='-std=c++11 -stdlib=libc++'
let g:syntastic_check_on_open = 1
""""""""""""""""""Tagbar""""""""""""""""""""""""""""""""
nmap <Leader>tb :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=30
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

""let g:xptemplate_vars="SPcmd=&BRloop=\n"
""let g:xptemplate_vars.="&BRfun= "
""let g:xptemplate_vars.="&SParg="
""let g:xptemplate_brace_complete ='([{"<'
""let g:xptemplate_vars.="&author=liu"
""let g:xptemplate_vars.="&email=liuhiter@gmail.com"
""let g:xptemplate_minimal_prefix=0
let g:UltiSnipsJumForwardTrigger="<C-b>"
let g:UltiSnipsJumBackwardTrigger="<C-z>"
inoremap<silent> <C-\> <C-R>=UltiSnips#ExpandSnippet()<CR>
""--------------------{{{
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
""----------}}}

set tags+=/home/liu/perl5/lib/perl5/5.22.1/x86_64-linux-thread-multi/tags
set tags+=/home/liu/perl5/lib/perl5/5.22.1/tags
set tags+=/home/liu/perl5/lib/perl5/x86_64-linux-thread-multi/tags
set tags+=/home/liu/perl5/lib/perl5/tags
set tags+=/usr/lib/perl5/vendor_perl/tags
set tags+=/usr/share/perl5/vendor_perl/tags
set tags+=/usr/lib/perl5/core_perl/tags
set tags+=/usr/share/perl5/core_perl/tags




