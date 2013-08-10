" vimrc by Long Changjin

set gfn=Monospace\ 10
set nocompatible " 关闭兼容模式
syntax on " 打开语法高亮
filetype plugin on " 打开文件类型插件
filetype indent on " 打开缩进
set autoindent " 打开自动缩进
set nu " 显示行号
set showcmd " 显示命令
set title " 显示标题
set lz " 当运行宏时，命令未执行完之前，不要重绘屏幕
set hid " 可以在没有保存得情况下切换buffer
set incsearch " 增量式搜索，边输入边搜索
set hlsearch " 高亮搜索
set viminfo='10,\"100,:20,%,n~/.viminfo
set matchpairs+=<:>

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
"set ignorecase " 忽略大小写搜索
"set nobackup " 关闭备份
""""" Command Line
" Autocomplete features in the status bar
set wildmenu
set wildmode=longest,list
set wildignore=*.o,*~,*.pyc,*.swp
set lazyredraw
set mat=2
set expandtab
set smartindent
set smarttab
set shiftwidth=4
set tabstop=4

set ai " 自动缩进
set si " 智能缩进
set cindent " C缩进
set t_Co=256
set go-=T
set autoread " 文件外部更改时，自动读入
set background=dark
let g:solarized_termcolors=256
color solarized " 颜色主题
" 文件编码
set encoding=utf8
set termencoding=utf-8
set fileencodings=utf8,gb2312,gb18030,ucs-bom,latin1
set laststatus=2 " 总是显示状态栏
set cursorline
"set cursorcolumn
set autochdir  "自动切换目录
" 颜色设置
"highlight CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=#000000
"highlight CursorLine guibg=#000000
"highlight CursorColumn guibg=#000000
highlight Folded guibg=grey30 guifg=gold  "折叠
highlight FoldColumn guibg=grey30 guifg=tan  "折柱
set cc=81 " 81列处高亮
"set nowrap
set list
"set listchars=tab:>-,trail:-
set listchars=tab:>-
set backspace=indent,eol,start   "设置backspace删除

"if has("gui_running")
	"set lines=40 columns=100
"else
	"if exists("+lines")
		"set lines=40
	"endif
	"if exists("+columns")
		"set columns=100
	"endif
"endif


"vundle设置 begine--------------------------------------------------------
"git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
let root = '~/.vim/bundle'
let src = 'http://github.com/gmarik/vundle.git'
if !isdirectory(expand(root, 1).'/vundle')
    exec '!git clone '.src.' '.shellescape(root, 1).'/vundle'
endif

set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

"	需要先安装flake8
Bundle 'vim-flake8'
"	使用vim-syntastic需要flake8
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'groenewege/vim-less'
"Bundle 'lastpos.vim'
"	注释管理插件
Bundle 'scrooloose/nerdcommenter'
"	 python文档查找，使用Pydoc <keyword>，如Pydoc re
"    PydocSearch <keyword>
"    当光标在某个词上时按'\pW'
"Bundle 'fs111/pydoc.vim'
"	Python代码折叠，F换发所有折叠，f触发光标所在位置折叠，Shift+e执行当前脚本
Bundle 'python.vim'
"	Python拼写检查，:cc定位语法错误
Bundle 'pyflakes.vim'
Bundle 'vim-fugitive'

" Edit xml and html easily
Bundle 'xmledit'
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags noci
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags noci
autocmd FileType python.django set omnifunc=pythoncomplete#Complete
autocmd FileType htmldjango.html set omnifunc=htmlcomplete#CompleteTags
"	pyton pep8代码风格检查
"Bundle 'pep8.vim'
"	自动语法检查，需要pyflakes
"	默认迅捷 键是cs
"	g:pcs_hotkey，修改快捷键
"	g:pcs_check_when_saving，保存时检查
"Bundle 'python_check_syntax.vim'
"Bundle 'python_fn.vim'
"	文件浏览器，NerdTree命令
Bundle 'The-NERD-tree'
Bundle 'VimExplorer'
"Bundle 'lookupfile'
Bundle 'genutils'
"	使用Tab补全Python
Bundle 'Pydiction'
"	自动弹出补全窗口
Bundle 'AutoComplPop'
"Bundle 'taglist.vim'
"比taglist更好的代码结构浏览
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-surround'
Bundle 'xolox/vim-notes'
Bundle 'xolox/vim-misc'
:let g:notes_directories = ['~/Documents/Notes']
"Bundle 'winmanager'
"	在vim中运行shell
"Bundle 'Conque-Shell'
"	快速插入内容
Bundle 'snipMate'
Bundle 'mattn/zencoding-vim'
Bundle 'morhetz/gruvbox'

filetype plugin indent on
"    安装所设置插件
"    安装：BundleInstall，更新：BundleInstall!，卸载不在列表的插件：BundleClean
"    au VimEnter * BundleInstall
"vundle设置 end---------------------------------------------------------------

"    python_editing.vim http://www.vim.org/scripts/script.php?script_id=1494	
"    python代码折叠 F键,保存在vim/ftplugin
let NERDTreeShowHidden=1
let NERDTreeShowHidden="left"
"    python_fold  http://vim.sourceforge.net/scripts/script.php?script_id=515
"    pyton代码折叠 zc折叠，zo打开
"	minibufexpl 浏览buffer
"	使用<C-Tab>和<C-S-Tab>切换buffer
"	http://www.vim.org/scripts/script.php?script_id=159
"let g:miniBufExplMapWindowNavVim = 1 
"let g:miniBufExplMapWindowNavArrows = 1 
"let g:miniBufExplMapCTabSwitchBufs = 1 
"let g:miniBufExplModSelTarget = 1 

au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
"au FileType python setlocal foldmethod=indent  "折叠pyton代码
set foldlevel=10 "默认展开所有代码
au FileType c setlocal tabstop=8 shiftwidth=8 softtabstop=8
"au FileType c setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4

"nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"let mapleader = ","
noremap <Leader>e :NERDTreeToggle<CR>
noremap <Leader>t :TagbarToggle<CR>

"AutoComplPop设置
let g:acp_enableAtStartup = 0    "取消运行启用
"Pydiction设置
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
"snipMate设置
let g:snips_author = 'Long Changjin <admin@longchangjin.cn>'
"syntastic 语法检查设置
let g:syntastic_check_on_open=1
let g:syntastic_quiet_warning=0
let g:syntastic_enable_signs=1
let g:syntastic_enable_highlighting=0
let g:syntastic_python_checker_args='--ignore=E501,E302,E231,E261,E201,W402,W293,W291,E225'
nmap cs :SyntasticCheck<CR>
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
""窗口操作
vnoremap <C-x>c "+y
nnoremap <C-x>c "+p
nnoremap <Leader>r :!./% <CR>
nnoremap t :tabe 
nnoremap <Leader>/ :vsplit 
nnoremap <Leader>n :lnext<CR>
nnoremap <Leader>p :lprevious<CR>
nnoremap <Leader>w :w<CR>
inoremap <Leader>w <ESC>:w<CR>
vnoremap J 6j
vnoremap K 6k
nnoremap J 6j
nnoremap K 6k
nnoremap H <C-w><Left>
nnoremap L <C-w><Right>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
inoremap <Leader>( _(<ESC><Right>Ef"a)

set showtabline=2  " 0, 1 or 2; when to use a tab pages line
set tabline=%!MyTabLine()  " custom tab pages line

function! MyTabLine()
  let s = ''
  let t = tabpagenr()
  let i = 1
  while i <= tabpagenr('$')
    let buflist = tabpagebuflist(i)
    let winnr = tabpagewinnr(i)
    let s .= '%' . i . 'T'
    let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
    let bufnr = buflist[winnr - 1]
    let file = bufname(bufnr)
    let buftype = getbufvar(bufnr, 'buftype')
    if buftype == 'nofile'
      if file =~ '\/.'
        let file = substitute(file, '.*\/\ze.', '', '')
      endif
    else
      let file = fnamemodify(file, ':p:t')
    endif
    if file == ''
      let file = '[No Name]'
    endif
    let s .= string(i) . ":"
    let file = strpart(file, 0, 10)
    let s .= file
    let i = i + 1
  endwhile
  let s .= '%T%#TabLineFill#%='
  let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
  return s
endfunction

map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 9gt
map <leader>0 10gt
"inoremap <Leader>( (<ESC><Right>Ef"a)
" To turn off caps lock
" setxkbmap -option ctrl:nocaps
" To reset
" setxkbmap -option
"" when we reload, tell vim to restore the cursor to the saved position
