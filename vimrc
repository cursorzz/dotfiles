set nocompatible 

syntax enable

filetype on

filetype off

set rtp +=~/.vim/bundle/vundle/ " add vundle to runtime path
call vundle#rc()
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
  source ~/.vimrc.bundles.local
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

" looking setting
set nu
set laststatus=2
set list
set listchars=tab:▸\ ,trail:▫
set ruler
set scrolloff=3
set showcmd
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu
set wildmode=longest,list,full

" coding related settings
set expandtab " expand tab to space
set shiftwidth=2 " 正常模式下缩进2空格
set softtabstop=2 " insert mode 回退两格
set tabstop=8     " 实际的tab占8格, ex: 读其他文件
set whichwrap+=<,>,h,l,[,] " Wrap arrow keys between lines

" search settings
set ignorecase " search ignore case
set smartcase
set incsearch

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
