
set nocompatible          " get rid of Vi compatibility mode. SET FIRST!
set t_Co=256              " enable 256-color mode.

" solarized: http://www.mrxuri.com/2013/11/09/use-solarized-color-scheme-in-mac-os-x-terminal.html
"syntax enable
syntax on
set background=light
"colorscheme solarized

set synmaxcol=900 " stop syntax highlighting on super-long lines
set nomodeline " don't let individual files hijack my settings: http://vim.wikia.com/wiki/Modeline_magic

set ts=2  " 2-char tab stop
set ruler
"syntax on
set hlsearch

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" examples: ç ± ცᕦဨဢᒦႂႊᅦႪႦ
" TED 20180901
" syntax match nonascii "[^\x00-\x7F]"
" au BufReadPost * highlight nonascii guibg=Red ctermbg=116


" Whitespace character display
"ted set listchars=trail:~,extends:>,precedes:<
" Display them
"ted set list

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

" Show trailing whitespace: http://vim.wikia.com/wiki/Highlight_unwanted_spaces
" doesn't work :%s/\s\+$

" show tabs http://vim.wikia.com/wiki/See_the_tabs_in_your_file
" alt: http://askubuntu.com/a/74503/69983
" alt: http://vimcasts.org/episodes/show-invisibles/
":set list
":set listchars=tab:\|\<Space>

" execute pathogen#infect()

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 2
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_id_checkers = 1
" 
" " let g:syntastic_quiet_messages = { 'regex': 'bad-continuation\|bad-indentation\|missing-docstring\|no-self-use' }
" let g:syntastic_python_checkers = ["pyflakes", "python"]
" "Available checkers: pyflakes pylint python
" let g:syntastic_html_tidy_ignore_errors = [ '<script> proprietary attribute "integrity"', '<script> proprietary attribute "crossorigin"', "'<' + '/' + letter not allowed here" ]
" " ]
" let g:syntastic_html_tidy_exec = 'tidy'
" 


