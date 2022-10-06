" MVIM Config - Updated 2022.06.13
" Mostly a port of a nvimconfig and a work in progress with a view to make
" compatible with nvim and vim.


" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

filetype on            "enables filetype detection
filetype plugin on     "enables filetype specific plugins
set guioptions-=T      "remove toolbar
set expandtab
set tabstop=4          "set tabstop at 4
set softtabstop=4
set hlsearch           "highlight searches
set shiftwidth=4       "numbers of spaces to (auto)indent
set ruler              "show the cursor position all the time
set number             "show line numbers
set backspace=2        "make backspace work more as expected - mainly for windows
"set autoindent        "always set autoindenting on
"set smartindent       "smart indent
"set cindent           "cindent
set noautoindent
set nosmartindent
set nocindent
set nocursorcolumn
set fileencoding=utf-8 "set the encoding of files written
set encoding=utf-8
set ffs=unix,dos
set t_Co=256
set laststatus=2       "show status bar. CLI vim doesn't show it
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

" remap <leader> - while commented out use \
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
" Note move <F3> -> NERDTree mapping into NERDTree group


" Move around windows with Alt + arrow keys
" Note: nmap so it only works in normal mode
" TODO: I think the 'else' is windows so reverse and simplify?
if !has('win32')
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

:autocmd Filetype ruby set softtabstop=2
:autocmd Filetype ruby set shiftwidth=2
:autocmd Filetype ruby set tabstop=2
:autocmd Filetype yaml set softtabstop=2
:autocmd Filetype yaml set shiftwidth=2
:autocmd Filetype yaml set tabstop=2

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

nmap <F10> :TrimTrailingSpace<CR>
vmap <F10> :TrimTrailingSpace<CR>


""""""""""""""""""""""""""""""
" Vim Plug
""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/bundle')

" TODO: Investigate https://github.com/liuchengxu/vim-clap

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-airline-colornum'

"Plug 'SirVer/ultisnips'
Plug 'majutsushi/tagbar'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'bling/vim-bufferline'
Plug 'vim-scripts/VST'
Plug 'dense-analysis/ale'
Plug 'Yggdroot/indentLine'

" Languages
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'davidhalter/jedi-vim'
Plug 'alfredodeza/pytest.vim'
Plug 'keith/swift.vim'
Plug 'vim-ruby/vim-ruby'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'jontrainor/TaskList.vim'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

" Git related
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" may be worth reviewing https://github.com/benawad/dotfiles/blob/master/init.vim
" Documentation
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'

" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""
" Temp / Backup directory
""""""""""""""""""""""""""""""
au BufWritePre * let &bex = '-' . strftime("%Y%m%d-%H%M%S") . '.vimbackup'

"On Windows I'll just dump the stuff in <vim folder>/temp
""otherwise <HOME>/temp
if has("win32")
    set backupdir=$VIM/temp/
    set directory=$VIM/temp/
else
    set backupdir=$HOME/temp/
    set directory=$HOME/temp/
endif


""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
set lazyredraw
let g:airline_theme             = 'powerlineish'
"vim-powerline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif


if has("win32")
    let g:airline_left_sep           = '►'
    let g:airline_left_alt_sep       = '»'
    let g:airline_right_sep          = '◄'
    let g:airline_right_alt_sep      = '«'
    let g:airline_symbols.branch     = '‡'
    let g:airline_symbols.whitespace = 'Ξ'
    let g:airline_symbols.linenr     = 'l:c'
    let g:airline_symbols.paste      = 'ρ'
else
    let g:airline_left_sep           = '»'
    let g:airline_left_alt_sep       = '▶'
    let g:airline_right_sep          = '«'
    let g:airline_right_alt_sep      = '◀'
    let g:airline_symbols.branch     = '⎇'
    let g:airline_symbols.whitespace = 'Ξ'
    let g:airline_symbols.linenr     = '␤'
    let g:airline_symbols.paste      = 'ρ'
endif
let g:airline_symbols.readonly       = '!'
let g:airline#extensions#branch#enabled     = 1
let g:airline#extensions#hunks#enabled      = 1
let g:airline#extensions#bufferline#enabled = 1

let g:airline_section_y = '%3p%% %{g:airline_symbols.linenr} %03l:%03c'
let g:airline_section_z = '%{strftime("[%H:%M %a %d.%b.%y]")}'


""""""""""""""""""""""""""""""
" NerdTree
""""""""""""""""""""""""""""""
let g:NERDTreeQuitOnOpen = 0
let g:NERDTreeChDirMode = 0
let g:NERDTreeShowBookmarks = 1
let NERDTreeRespectWildIgnore=1

if has("win32")
    let g:NERDTreeBookmarksFile=''.$VIM.'\temp\nerdtree_bookmarks.txt'
else
    let g:NERDTreeBookmarksFile=''.$HOME.'./config/temp/nerdtree_bookmarks.txt'
endif

"map F3 to open NerdTree in cwd
map <F3> :NERDTreeToggle<CR>

" Close nvim if NERDTree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


""""""""""""""""""""""""""""""
" Deoplete
""""""""""""""""""""""""""""""
"let g:deoplete#enable_at_startup = 1
" use tab to forward cycle
"inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
"inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" Close the documentation window when completion is done
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


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
" Undotree
""""""""""""""""""""""""""""""
if has("win32")
    set undodir=$VIM\temp\undotree\\
else
    set undodir=$HOME/.vim/temp/undotree//
endif

set undofile

let g:undotree_WindowLayout = 4
nnoremap <F5> :UndotreeToggle<cr>

""""""""""""""""""""""""""""""
" Jedi
""""""""""""""""""""""""""""""
"let g:jedi#show_call_signatures = "0" " Disable - I want to see the mode (visual
                                      "/ insert) and there's a conflict when set
                                      " to 2. setting to 1 is nice but causes
                                      " issues
"let g:jedi#use_tabs_not_buffers = 0
"let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_definitions_command = "<leader>d"
"let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>n"
"let g:jedi#completions_command = "<C-Space>"
"let g:jedi#rename_command = "<leader>r"
"let g:jedi#environment_path = "/usr/bin/python3.9"


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
nmap <c-l> :CtrlPLine<CR>
nmap <c-b> :CtrlPBuffer<CR>


""""""""""""""""""""""""""""""
" Ale
""""""""""""""""""""""""""""""
let g:ale_sign_column_always = 1

" move between errors / warnings
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let b:ale_linters = {
        \   'ruby': ['standardrb'],
        \   'python': ['flake8', 'pylint'],
        \}
let g:ale_fixers = {
      \    'ruby': ['standardrb'],
      \}

" Check Python files with flake8 and pylint.
"let b:ale_linters = ['flake8', 'pylint']
let g:ale_python_flake8_options = '--max-line-length=120'
let g:ale_python_pylint_options = '--max-line-length=120'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:airline#extensions#ale#enabled = 1


""""""""""""""""""""""""""""""
" ultisnips
""""""""""""""""""""""""""""""
"   g:UltiSnipsExpandTrigger               <tab>
"   g:UltiSnipsListSnippets                <c-tab>
"   g:UltiSnipsJumpForwardTrigger          <c-j>
"   g:UltiSnipsJumpBackwardTrigger         <c-k>
let g:UltiSnipsExpandTrigger="<tab>"
if has("win32")
    let g:UltiSnipsSnippetsDir = ''.$VIM.'/ultisnips/'
else
    let g:UltiSnipsSnippetsDir = ''.$HOME.'/.vim/ultisnips/'
endif
let g:UltiSnipsEditSplit="vertical"

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
" Git Gutter
""""""""""""""""""""""""""""""

if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

let g:gitgutter_signs = 1
let g:gitgutter_enabled=1
let g:gitgutter_avoid_cmd_prompt_on_windows=0
noremap <silent> <F4> :GitGutterToggle<cr>


""""""""""""""""""""""""""""""
" Vim Grepper
""""""""""""""""""""""""""""""
let g:grepper = { 'open': 0 }
autocmd User Grepper copen 20

""""""""""""""""""""""""""""""
" Groovy / Jenkinss
""""""""""""""""""""""""""""""
au BufNewFile,BufRead Jenkinsfile setf groovy

""""""""""""""""""""""""""""""
" Various Functions
""""""""""""""""""""""""""""""
" n/a


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
elseif has("nvim")
    set guifont=JetBrainsMono-Regular:h14
else
    "set guifont=JetBrainsMono-Regular:h10
    set gfn=JetBrains\ Mono\ Semi-Bold\ 12
endif

" Toggle background color
function! BgToggle()
    let &background = ( &background == "dark"? "light" : "dark" )
endfunction

noremap <silent> <F9> :call BgToggle()<cr>


" Neovim specific
if !has('nvim')
    set ttymouse=xterm2
endif


""""""""""""""""""""""""""""""
"  Vim Clap
""""""""""""""""""""""""""""""

"let g:clap_theme = 'peachpuff'


""""""""""""""""""""""""""""""
"  Pandoc
""""""""""""""""""""""""""""""
let g:pandoc#modules#disabled = ["folding"]

let g:pandoc#syntax#conceal#use = 0


" TODO: Does not work but not urgent enough to fix now
function! TogglePDConceal()
    if g:pandoc#syntax#conceal#use != 0
        let g:pandoc#syntax#conceal#use = 0
    else
        let g:pandoc#syntax#conceal#use = 1
    endif
endfunction

noremap <silent> <F8> :call TogglePDConceal()<cr>


""""""""""""""""""""""""""""""
"  JavaScript / JSON
""""""""""""""""""""""""""""""

" Do NOT hide double-quotes for JSON
autocmd FileType json let g:indentLine_enabled=0


""""""""""""""""""""""""""""""
"  Go
""""""""""""""""""""""""""""""

" Run goimports along gofmt on each save
let g:go_fmt_command = "goimports"

" Automatically get signature/type info for object under cursor
let g:go_auto_type_info = 1

" TIPS
"
" :GoRun :GoBuild :GoInstall
"
" :GoDef          # goto definition of object under cursor
" gd              # also has the same effect
" Ctrl-O / Ctrl-I # hop back to your source file/return to definition
"
" :GoDoc          # opens up a side window for quick documentationn
" K               # also has the same effect
"
" :GoTest         # run every *_test.go file and report results
" :GoTestFunc     # or just test the function under your cursor
" :GoCoverage     # check your test coverage
" :GoAlternate # switch bewteen your test case and implementation
"
" :GoImport       # manage and name your imports
" :GoImportAs
" :GoDrop
"
" :GoRename       # precise renaming of identifiers
"
" :GoLint         # lint your code
" :GoVer
" :GoErrCheck
"
" :GoAddTags      # manage your tags
" :GoRemoveTags
