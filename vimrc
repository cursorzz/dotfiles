set nocompatible 


filetype on

filetype off
filetype plugin indent off
set rtp +=~/.vim/bundle/vundle/ " add vundle to runtime path
"set runtimepath+=$GOPATH/go/misc/vim
call vundle#rc()
if filereadable(expand("~/.vimrc.bundle"))
  source ~/.vimrc.bundle
  "source ~/.vimrc.bundle.local
endif

filetype plugin indent on
syntax enable

"=================
"vim related settings
set autoindent
set autoread " 文件变动时自动加载
set backspace=2 " ?
"set backupcopy=yes "unix open it by default
"set clipboard+=unnamed

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
au FileType ruby setl sw=2 sts=2 et
au BufRead,BufNewFile *.haml setl sw=2 sts=2 et
"set whichwrap+=<,>,h,l,[,] " Wrap arrow keys between lines
set autochdir  "自动切换目录
set foldlevel=10
"let g:kolor_italic=1                    " Enable italic. Default: 1
"let g:kolor_bold=1                      " Enable bold. Default: 1
"let g:kolor_underlined=1                " Enable underline for 'Underlined'. Default: 0
"let g:kolor_alternative_matchparen=1    " Gray 'MatchParen' color. Default: 0
"colorscheme kolor
"let g:loaded_matchparen=1 
"highlight MatchParen ctermfg=none ctermbg=none cterm=bold
"highlight MatchParen      guifg=White    guibg=none    gui=bold

" terminal related setting
set t_Co=256 " this will effect statusline color
colorscheme badwolf

" search settings
set ignorecase " search ignore case
set smartcase
set incsearch
set hlsearch
set mouse=a " enable mouse in terminal

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

