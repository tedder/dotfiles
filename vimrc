
set nocompatible          " get rid of Vi compatibility mode. SET FIRST!
set t_Co=256              " enable 256-color mode.

" solarized: http://www.mrxuri.com/2013/11/09/use-solarized-color-scheme-in-mac-os-x-terminal.html
syntax enable
set background=light
colorscheme solarized

set ts=2  " 2-char tab stop
set ruler
syntax on
set hlsearch

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

set directory=/tmp
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

" from here: https://github.com/tpope/vim-markdown/blob/master/ftdetect/markdown.vim
" see also: http://technicalpickles.com/posts/using-markdown-in-vim/
autocmd BufNewFile,BufRead *.markdown,*.md,*.mdown,*.mkd,*.mkdn
      \ if &ft =~# '^\%(conf\|modula2\)$' |
      \   set ft=markdown |
      \ else |
      \   setf markdown |
      \ endif

