set nocompatible 

syntax enable

filetype on

filetype off

set rtp +=~/.vim/bundle/vundle/ " add vundle to runtime path
call vundle#rc()
if filereadable(expand("~/.vimrc.bundle"))
  source ~/.vimrc.bundle
  "source ~/.vimrc.bundle.local
endif

filetype plugin indent on

"=================
"vim related settings
set autoindent
set autoread " 文件变动时自动加载
set backspace=2 " ?
"set backupcopy=yes "unix open it by default
set clipboard=unnamed

set directory-=. " swap会被保存在tmp中
set encoding=utf-8
set viminfo='10,\"100,:20,%,n~/.viminfo
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

" looking setting
set nu
set laststatus=2
set list
set listchars=tab:▸\ ,trail:▫
set ruler
set scrolloff=3
set showcmd
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc,*.pyc
set wildmenu
set wildmode=longest,list,full

" coding related settings
set expandtab " expand tab to space
set shiftwidth=4 " 正常模式下缩进2空格
set softtabstop=4 " insert mode 回退两格
set tabstop=4     " 实际的tab占8格, ex: 读其他文件
"set whichwrap+=<,>,h,l,[,] " Wrap arrow keys between lines
set autochdir  "自动切换目录
"set foldlevel=1
colorscheme molokai

" terminal related setting
set t_Co=256 " this will effect statusline color

" search settings
set ignorecase " search ignore case
set smartcase
set incsearch
set hlsearch

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif



" #######default the statusline to green when entering Vim
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cray ctermfg=11 guifg=Black ctermbg=0
  elseif a:mode == 'v'
    hi statusline guibg=Purple ctermfg=11 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=15 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15
" Formats the statusline
set statusline+=[%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=\ %F                           " file name
"set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=\ %=                        " align left
set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n                    " Buffer number
