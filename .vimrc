" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=light

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd        "Show (partial) command in status line.
"set showmatch      "Show matching brackets.
"set ignorecase     "Do case insensitive matching
"set smartcase      "Do smart case matching
"set incsearch      "Incremental search
"set autowrite      "Automatically save before commands like :next and :make
"set hidden         "Hide buffers when they are abandoned
"set mouse=a        "Enable mouse usage (all modes)

" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif

" my additions
call pathogen#infect()
filetype on         "enables filetype detection
filetype plugin on  "enables filetype specific plugins
set guioptions-=T   "remove toolbar
set expandtab
set tabstop=4       "set tabstop at 4
set softtabstop=4
set hlsearch        "highlight searches
set shiftwidth=4    "numbers of spaces to (auto)indent
set ruler           "show the cursor position all the time
set number          "show line numbers
set backspace=2     "make backspace work more as expected - mainly for windows
"set autoindent     "always set autoindenting on
"set smartindent    "smart indent
"set cindent        "cindent
set noautoindent
set nosmartindent
set nocindent
set nocursorcolumn
set encoding=utf-8
set ffs=unix,dos
set t_Co=256
set laststatus=2    " show status bar. CLI vim doesn't show it
set spelllang=en_gb
"Ignore lists roughly broken into types for easier referencing
set wildignore+=*.exe,CVS,*.class,*.dll,*.pyc,*.bak,*.so,*.swp,*.jar,*.desktop
set wildignore+=*.pdf,*.docx,*.doc,*.xls,*.odt,*.ods,*.ots,*.xlsx
set wildignore+=*.jpg,*.gif,*.png,*.bmp,*.jpeg,*.psd,*.pcx
set wildignore+=*.zip,*.rar,*.tar.gz,*.tar
set wildignore+=*.mp3,*.wav,*.mp4,*.mpeg,*.wmv,*.wma,*.m3u,*.flac,*.mid,*.m4a,*aiff,*.mp2,*.aac,*.ogg,*.mov
"Syntax highlight option above unlike on my win machine
set list
" remove preview window option from omnicomplete
" default menu.preview
set completeopt=menu

" remap <leader>
" let mapleader = ","

"Highlight white space
""Change char based on whether it's unix or win
if has("win32")
    set listchars=tab:>-,eol:^,trail:·
else
    set listchars=tab:▸\ ,eol:¬
endif

"Keyboard mappings
"map F1 to open previous buffer
map <F1> :bprev<CR>
"map F2 to open next buffer
map <F2> :bnext<CR>
"map F3 to open NerdTree
map <F3> :NERDTree $HOME<CR>

" Move around windows with Alt + arrow keys
" Note: nmap so it only works in normal mode
if has("gui_macvim")
    nmap <silent> <S-Up> :wincmd k<CR>
    nmap <silent> <S-Down> :wincmd j<CR>
    nmap <silent> <S-Left> :wincmd h<CR>
    nmap <silent> <S-Right> :wincmd l<CR>
else
    nmap <silent> <A-Up> :wincmd k<CR>
    nmap <silent> <A-Down> :wincmd j<CR>
    nmap <silent> <A-Left> :wincmd h<CR>
    nmap <silent> <A-Right> :wincmd l<CR>
endif

" Toggle spell checking
nmap <silent> <leader>s :set spell!<CR>
"Common command line typos
cmap W w
cmap Q q

"----- write out html file
map ,h :source $VIM/vim73/syntax/2html.vim<cr>:w<cr>:clo<cr>

" cursor line for current file only
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

""""""""""""""""""""""""""""""
" Specfic file type settings
""""""""""""""""""""""""""""""
"NOTE for windows use double quotes around % to account for directories with spaces

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

"--php compile
au BufNewFile,BufRead *.php map <buffer><F6> :w!<cr>
\ :!php -l "%"<CR>
"--php run
au BufNewFile,BufRead *.php map <buffer><F7> :w!<cr>
\ :!php "%"<CR>

"--python pylint (-r n = reports no)
au BufNewFile,BufRead *.py map <buffer><F6> :w!<CR>
\ :!pylint -r n "%"<CR>
"--python run (-r n = reports no)
au BufNewFile,BufRead *.py map <buffer><F7> :w!<CR>
\ :!python "%"<CR>

"--perl syntax check / some useful warning checks / taint checks
au BufNewFile,BufRead *.pl map <buffer><F6> :w!<cr>
\ :!perl -cwT "%"<CR>
"--perlrun
au BufNewFile,BufRead *.pl map <buffer><F7> :w!<cr>
\ :!perl "%"<CR>
"--xmllint xml file formatting
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

""""""""""""""""""""""""""""""
" Formatters
""""""""""""""""""""""""""""""
command! -range -nargs=0 JsonFormat :<line1>,<line2>!python -m json.tool
command! -range -nargs=0 Md5 :<line1>,<line2>!openssl dgst -md5
command! -range -nargs=0 Sha1 :<line1>,<line2>!openssl dgst -Sha1
command! -range -nargs=0 Sha256 :<line1>,<line2>!openssl dgst -Sha256
command! -range -nargs=0 Base64Encode :<line1>,<line2>!perl -MMIME::Base64 -e 'while(<>){print encode_base64(pack "H*", $_), qq{\n}}'

function! TrimTrailingSpace() range
  execute a:firstline . "," . a:lastline . 's/\s\+$//e'
endfunction

command -bar -nargs=0 -range=% TrimTrailingSpace <line1>,<line2>call TrimTrailingSpace()


""""""""""""""""""""""""""""""
" Temp / Backup directory
""""""""""""""""""""""""""""""
au BufWritePre * let &bex = '-' . strftime("%Y%m%d-%H%M%S") . '.vimbackup'

"On Windows I'll just dump the stuff in <vim folder>/temp
""otherwise <HOME>/temp
if has("win32")
    set backupdir=$VIM/temp//
    set directory=$VIM/temp//
else
    set backupdir=$HOME/temp//
    set directory=$HOME/temp//
endif

"set nobackup
"set nowritebackup

"set up status bar for buftab - not used but will leave here for now
"set statusline=\ #{buftabs}%=\ \ Ln\ %-5.5l\ Col\ %-4.4v

""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
set lazyredraw
let g:airline_theme             = 'powerlineish'
let g:airline#extensions#branch#enabled     = 1
let g:airline#extensions#syntastic#enabled  = 1
"vim-powerline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if has("win32")
    let g:airline_left_sep          = '►'
    let g:airline_left_alt_sep      = '»'
    let g:airline_right_sep         = '◄'
    let g:airline_right_alt_sep     = '«'
    let g:airline_symbols.branch    = '‡'
else
    let g:airline_left_sep          = '»'
    let g:airline_left_alt_sep      = '▶'
    let g:airline_right_sep         = '«'
    let g:airline_right_alt_sep     = '◀'
    let g:airline_symbols.branch    = '⎇'
endif
let g:airline_symbols.readonly   = '!'
let g:airline_symbols.linenr = 'l:c'
let g:airline#extensions#bufferline#enabled = 1

function! AirlineInit()
  let g:airline_section_z = airline#section#create_right(['%3p%% %{g:airline_symbols.linenr} %03l:%03c %{strftime("[%H:%M %a %d.%b.%y]")}'])
endfunction

autocmd VimEnter * call AirlineInit()


""""""""""""""""""""""""""""""
" bufferline
""""""""""""""""""""""""""""""
"left / right symbols
let g:bufferline_active_buffer_left = '['
let g:bufferline_active_buffer_right = ']'
"show the buffer number
let g:bufferline_show_bufnr = 1
"symbol for modified files
let g:bufferline_modified = '+'
"no highlight if one file
let g:bufferline_solo_highlight = 0
"echo to command line
let g:bufferline_echo = 0
"buffers to exclude
let g:bufferline_excludes = ["^NERD_tree_[0-9]*$"]

""""""""""""""""""""""""""""""
" NerdTree
""""""""""""""""""""""""""""""
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeChDirMode = 0
let g:NERDTreeShowBookmarks = 1
let NERDTreeRespectWildIgnore=1

if has("win32")
    let g:NERDTreeBookmarksFile=''.$VIM.'\temp\nerdtree_bookmarks.txt'
else
    let g:NERDTreeBookmarksFile=''.$HOME.'/temp/nerdtree_bookmarks.txt'
endif

""""""""""""""""""""""""""""""
" Undotree
""""""""""""""""""""""""""""""
if has("win32")
    set undodir=$VIM\temp\undotree\\
else
    set undodir=$HOME/temp/undotree//
endif

set undofile

let g:undotree_WindowLayout = 4
nnoremap <F5> :UndotreeToggle<cr>

""""""""""""""""""""""""""""""
" Jedit
""""""""""""""""""""""""""""""
let g:jedi#show_call_signatures = "0" " Disable - I want to see the mode (visual
                                      "/ insert) and there's a conflict when set
                                      " to 2. setting to 1 is nice but causes
                                      " issues
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"


""""""""""""""""""""""""""""""
" Rainbow Parentheses
""""""""""""""""""""""""""""""

" set let g:rbpt_colorpairs to set
" my own colour pairs. May do later.
" :RainbowParenthesesToggle       " Toggle it on/off
" :RainbowParenthesesLoadRound    " (), the default when toggling
" :RainbowParenthesesLoadSquare   " []
" :RainbowParenthesesLoadBraces   " {}
" :RainbowParenthesesLoadChevrons " <>

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

noremap <silent> <F11> :RainbowParenthesesToggle<CR>

au FileType python RainbowParenthesesActivate
au syntax python RainbowParenthesesLoadRound
au syntax python RainbowParenthesesLoadSquare
au syntax python RainbowParenthesesLoadBraces

au FileType perl RainbowParenthesesActivate
au syntax perl RainbowParenthesesLoadRound
au syntax perl RainbowParenthesesLoadSquare
au syntax perl RainbowParenthesesLoadBraces

au FileType javascript RainbowParenthesesActivate
au syntax javascript RainbowParenthesesLoadRound
au syntax javascript RainbowParenthesesLoadSquare
au syntax javascript RainbowParenthesesLoadBraces

au FileType ruby RainbowParenthesesActivate
au syntax ruby RainbowParenthesesLoadRound
au syntax ruby RainbowParenthesesLoadSquare
au syntax ruby RainbowParenthesesLoadBraces

au FileType java RainbowParenthesesActivate
au syntax java RainbowParenthesesLoadRound
au syntax java RainbowParenthesesLoadSquare
au syntax java RainbowParenthesesLoadBraces

au FileType c RainbowParenthesesActivate
au syntax c RainbowParenthesesLoadRound
au syntax c RainbowParenthesesLoadSquare
au syntax c RainbowParenthesesLoadBraces

au FileType cpp RainbowParenthesesActivate
au syntax cpp RainbowParenthesesLoadRound
au syntax cpp RainbowParenthesesLoadSquare
au syntax cpp RainbowParenthesesLoadBraces

""""""""""""""""""""""""""""""
" IndentLine
""""""""""""""""""""""""""""""
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*', '*.pytest']

""""""""""""""""""""""""""""""
" TaskList
""""""""""""""""""""""""""""""
map T :TaskList<CR>
let g:tlWindowPosition = 1           "open at the bottom - 0 for top
let g:tlRememberPosition = 1

""""""""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""""""""
let g:ctrlp_clear_cache_on_exit = 0
"sling cache into temp dir for now. Will likely give it a new dir for this and
"NerdTree bookmarks
if has("win32")
    let g:ctrlp_cache_dir = $VIM.'\temp\ctrlp'
else
    let g:ctrlp_cache_dir = $HOME.'/temp/ctrlp'
endif
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

""""""""""""""""""""""""""""""
" TagBar
""""""""""""""""""""""""""""""
nmap <F12> :TagbarToggle<CR>

if has("win32")
    let g:tagbar_ctags_bin=$VIM.'\vimfiles\bundle\tagbar\win\ctags.exe'
endif

let g:tagbar_width=45
let g:tagbar_autoclose=1
let g:tagbar_autofocus=1
let g:tagbar_indent=2
let g:tagbar_expand=0
let g:tagbar_foldlevel=1

""""""""""""""""""""""""""""""
" Ale
""""""""""""""""""""""""""""""
let g:ale_sign_column_always = 1

" move between errors / warnings
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8', 'pylint']
let g:ale_python_flake8_options = '--max-line-length=120'
let g:ale_python_pylint_options = '--max-line-length=120'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:airline#extensions#ale#enabled = 1

""""""""""""""""""""""""""""""
" Git Gutter
""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
let g:gitgutter_avoid_cmd_prompt_on_windows=0
noremap <silent> <F4> :call ToggleGitGutter()<cr>


""""""""""""""""""""""""""""""
" Vim Grepper
""""""""""""""""""""""""""""""
let g:grepper = { 'open': 0 }
autocmd User Grepper copen 20


""""""""""""""""""""""""""""""
" Various Functions
""""""""""""""""""""""""""""""
" Removes trailing spaces
function TrimSpace()
  %s/\s*$//
  ''
endfunction

nmap <F10> :call TrimSpace()<CR>

""""""""""""""""""""""""""""""
" Various visual settings
""""""""""""""""""""""""""""""

let g:airline_theme='lucius'
colorscheme lucius
LuciusWhite

if has("gui_running")
    highlight SpellBad term=underline gui=undercurl guisp=Red
    set lines=64
    set columns=170
    winpos 10 10
endif

set colorcolumn=80,100
"highlight ColorColumn ctermbg=black guibg=#222222

"Set Windows font - will likely change but this will
""do for now
if has ("win32")
    set guifont=Courier_New:h11:cANSI
elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h12
endif

" Toggle background color
function! BgToggle()
    let &background = ( &background == "dark"? "light" : "dark" )
endfunction

noremap <silent> <F9> :call BgToggle()<cr>


