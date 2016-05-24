"vimrc custom vim settings
"Jeremy Micah Bassi
"5/10/14

set mouse=a
execute pathogen#infect()

" Enable filetype plugins
filetype plugin on
filetype indent on

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set so=7

set history=100

set hid

set number

set autoread

set ruler

set cmdheight=2

set backspace=2
set backspace=eol,start,indent

set wmh=0

set hlsearch

set showmatch
set mat=2

set lazyredraw

"SOLARIZED
syntax enable
set background=dark
colorscheme solarized

"set t_Co=16
set t_Co=256

call togglebg#map("<F5>")

"different background modes depending on terminal/GUI
if has('gui_running')
    set background=light
else
    set background=dark
endif

set expandtab

set smarttab

set shiftwidth=4
set tabstop=4

set ai
set wrap

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

map j gj
map k gk

map <leader>b :echo @%<cr>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

set incsearch

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

set laststatus=2

"abbreviations
ab teh the
ab <, << " " <<

"window splits
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>tw :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tn :tabn<cr>
map <leader>tp :tabp<cr>
map <leader>tl :tabs<cr>
map <leader>te :tabedit

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

set splitbelow
set splitright

set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

map <Leader>n <plug>NERDTreeTabsToggle<CR>

let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"let g:airline#extensions#tabline#enabled = 1

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" `s{char}{label}`
nmap <leader>s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)

nnoremap B ^
nnoremap E $
vnoremap B ^
vnoremap E $

" highlight last inserted text
nnoremap gV `[v`]

au FileType html,xhtml,xml,eruby so ~/.vim/plugin/html_autoclosetag.vim
autocmd FileType html,css,scss,ruby,eruby,javascript,php setlocal shiftwidth=2 tabstop=2

"source ~/.vim/plugin/matchit.vim

"let b:match_words = '\<foo\>:\<bar\>'

inoremap {<cr> {<cr>}<c-o>O
inoremap [<cr> [<cr>]<c-o>O
inoremap (<cr> (<cr>)<c-o>O

let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>ee :call WindowSwap#EasyWindowSwap()<CR>

" toggle between number and relativenumber
function! s:ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunction

" strips trailing whitespace at the end of files
function! s:StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

map <C-w> :call <SID>StripTrailingWhitespaces()<CR>
map <C-m> :call <SID>ToggleNumber()<CR>

let g:tagbar_usearrows = 1
nnoremap <leader>m :TagbarToggle<CR>

let g:multi_cursor_next_key='<C-b>'

let g:loaded_golden_ratio = 0

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T'] "

call pathogen#helptags()

au! BufRead,BufNewFile *.ss setfiletype racket
au! BufRead,BufNewFile *.rkt setfiletype racket

let g:slime_target = "tmux"

autocmd filetype lisp,scheme,art,racket setlocal equalprg=scmindent.rkt
autocmd filetype lisp,scheme,art,racket let maplocalleader = "\\"
autocmd filetype lisp,scheme,art,racket setlocal shiftwidth=2 tabstop=2

let g:niji_matching_filetypes = ['lisp', 'scheme', 'racket', 'haskell']

let g:niji_dark_colours = [
    \ [ '81', '#5fd7ff'],
    \ [ '99', '#875fff'],
    \ [ '1',  '#dc322f'],
    \ [ '76', '#5fd700'],
    \ [ '3',  '#b58900'],
    \ [ '2',  '#859900'],
    \ [ '6',  '#2aa198'],
    \ [ '4',  '#268bd2'],
    \ ]

" Can't get any Repl action going "
" tslime {{{
"let g:tslime_ensure_trailing_newlines = 1
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
let g:tslime_normal_mapping = '<localleader><space>'
let g:tslime_visual_mapping = '<localleader><space>'
let g:tslime_vars_mapping = '<localleader>;'
" }}} 
"

" To open R in terminal rather than RGui (only necessary on OS X)
let vimrplugin_applescript = 0
let vimrplugin_screenplugin = 0
" For tmux support
let g:ScreenImpl = 'Tmux'
let vimrplugin_screenvsplit = 1 " For vertical tmux split
let g:ScreenShellInitialFocus = 'shell' 
" " instruct to use your own .screenrc file
" let g:vimrplugin_noscreenrc = 1
" " For integration of r-plugin with screen.vim
" let g:vimrplugin_screenplugin = 1
" " Don't use conque shell if installed
" let vimrplugin_conqueplugin = 0
" map the letter 'r' to send visually selected lines to R 
let g:vimrplugin_map_r = 1
" " see R documentation in a Vim buffer
let vimrplugin_vimpager = "no"
" "set expandtab
" set shiftwidth=4
" set tabstop=8
" " start R with F2 key
map <F2> <Plug>RStart 
imap <F2> <Plug>RStart
vmap <F2> <Plug>RStart
" " send selection to R with space bar
vmap <Space> <Plug>RDSendSelection 
" " send line to R with space bar
nmap <Space> <Plug>RDSendLine"/Plug>

" select to end of last line
vmap G GE

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

