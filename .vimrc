" Vundle {{{ "
filetype off 
set runtimepath+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'gmarik/vundle'
Plugin 'jeaye/color_coded' "高亮变量，宏
Plugin 'vim-scripts/fcitx.vim'
Plugin 'icecity96/IC_VimL_Quick_Help'
Plugin 'kmyk/sdl2.vim'
Plugin 'rdnetto/YCM-Generator'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'bling/vim-airline'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'jiangmiao/auto-pairs' "自动补全括号
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'lervag/vimtex'
Plugin 'chumakd/perlomni.vim'
Plugin 'a.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'scrooloose/syntastic' "静态语法检查
Plugin 'bling/vim-bufferline'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'davidhalter/jedi' "python补全
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'easymotion/vim-easymotion'
Plugin 'fencview.vim' "编码格式
Plugin 'vimcn/vimcdoc' "中文帮助文档，建议还是直接看英文的，如果感觉英文不好理解再参考下翻译
Plugin 'suan/vim-instant-markdown'
call vundle#end()
filetype plugin indent on "
" }}} Fold description "
" airline {{{ "
set laststatus=2	"总是显示状态栏(always show status-line)
set t_Co=256		"neovim 不需要设置(if using neovim this option shouldn't be set)
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline#extensions#bufferline#enable = 1
let g:airline#extensions#bufferline#overwrite_variables = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#branch#enable = 1
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#branch#format = 0
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#symbol = '!'
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long' ]
let g:airline#extensions#whitespace#trailing_format = 'trailing[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'mixed-indent[%s]'
let g:airline#extensions#whitespace#long_format = 'long[%s]'
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
set encoding=utf-8 
set fencs=utf-8,gbk                                                   
set fileencodings=utf-8,gb2312,ucs-bom,euc-cn.euc-tw,gb18030,gbk,cp936

" }}} airline "
" basic map settings {{{ "
let mapleader = ","
let maplocalleader=",,"
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
"使用外部剪贴板
nnoremap <leader>cp "+gp
autocmd filetype cpp map <F5> <Esc>:w!<CR>:!clang++ -std=c++11 % -o %< <CR>
autocmd filetype c map <F5> <Esc>:w!<CR>:!clang  % -o %< -lm <CR>
autocmd filetype c map <F6> <Esc>:w!<CR>:!clang  -g % -o %< -lm <CR>
autocmd filetype cpp map <F6> <Esc>:w!<CR>:!clang++ -std=c++11 -g -D DEBUG % -o %< -lm <CR>
"使用空格来折叠和展开
nnoremap <space> za
autocmd filetype vim setlocal foldmethod=marker
"快速将单词转换成大写
noremap <C-u> <esc>bvwhUw
" }}} basic map settings "
" YouCompleteMe {{{ "
" More options see the help document of YCM 
set completeopt=longest,menu,preview
"当离开插入模式时关闭弹出菜单
auto InsertLeave * if pumvisible()==0 | pclose | endif
inoremap <expr><CR> pumvisible()?'<C-y>':'<CR>'
"默认YCM配置文件路径
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
"提供python补全
let g:ycm_python_binary_path = '/usr/bin/python'
"获取一个变量的类型，支持c,cpp,oc,js
nnoremap <leader>gt :YcmCompleter GetType
"获取变量父类，支持c,cpp,oc
nnoremap <leader>gp :YcmCompleter GetParent
"获取文档
nnoremap <leader>gd :YcmCompleter GetDoc
"quickfix
nnoremap <leader>qf :YcmDiags<CR>
" 设置启动补全的最小字符数
let g:ycm_min_num_of_chars_for_completion = 1
"如果想一直开启quickfix 将下列选项值改为1
let g:ycm_open_loclist_on_ycm_diags = 0
"如果希望写注释的时候也开启不全下列值设置为1
let g:ycm_complete_in_commments = 0
"如果希望字符串和注释中的东西也被记录，下列值设置为1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"如果希望从tags中提取记录下面设置为1(before use tags,READ YCM DOCUMENT!!)
let g:ycm_collect_identifiers_from_tags_files = 0
"记录语法文件中的记录
let g:ycm_seed_identifiers_with_syntax = 1
"预览菜单向下
let g:ycm_key_list_select_completion = ['<C-n>','<Down>']
"预览菜单向上
let g:ycm_key_list_previous_completion = ['<C-n>','<Up>']
" }}} YouCompleteMe "
" syntastic {{{ "
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
" }}} syntastic "
" Tagbar {{{ "
" learn more :h tagbar
nnoremap <leader>tb :Tagbar<CR>
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_width = 30
"如果想自动开启将下面一行的注释去掉
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
" }}} Tagbar "
" UltiSnips {{{ "
" learn more :h UltiSnips
" 使用TAB展开snips,使用TAB的前提是你已经把ycm中补全键改了
inoremap<silent> <TAB> <C-R>=UltiSnips#ExpandSnippet()<CR>
inoremap<silent> <C-j> <C-R>=UltiSnips#JumpForwards()<CR>
inoremap<silent> <C-k> <C-R>=UltiSnips#JumpBackwards()<CR>
" }}} UltiSnips "
" EasyMotion {{{ "
" learn more :h EasyMotion
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_smartcase = 1
nnoremap <leader>j <Plug>(easymotion-j)
nnoremap <leader>k <Plug>(easymotion-k)
" }}} EasyMotion "
" settings {{{ "
""显示命令
set showcmd 
set number
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
set encoding=utf-8
set fileencoding=utf-8
let g:tex_flavor = "latex"
" }}} settings "
" Add x permetion {{{ "
" 为脚本增加x权限，默认脚本是用#！开头
function! ICaddx()
	if strpart(getline(1),0,2) == "#!"
		call system("chmod +x ".bufname("%"))
	endif
endfunction
autocmd BufWritePost * :call ICaddx()
" }}} Add x permetion "
" IC_VimL_Quick_help {{{ "
let g:IC_quick_help_language = "@cn"
" }}} IC_VimL_Quick_help "
" function {{{ "
" }}} function "
