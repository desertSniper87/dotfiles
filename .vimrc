set nocompatible

"source $VIMRUNTIME/vimrc_example.vim
"set guifont=Liberation\ mono\ 12
"set guifont=Dejavu\ Sans\ mono\ 12
"set guifont=xos4\ Terminus\ 15
"set guifont=xos4\ Terminus\ Bold\ 12
"set guifont=monaco\ 12
"set guifont=Tamzenforpowerline\ Bold\ 12
"set guifont=Droid\ Sans\ Mono\ for\ powerline\ Bold\ 12
set guifont=ProFont\ for\ Powerline\ 13
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right scrollbar
set guioptions-=L  "remove left scrollbar
"set showtabline=0
syntax enable
set number
set cpoptions+=$
set virtualedit=all
set incsearch
set hlsearch
set ignorecase
set smartcase
set autochdir
set clipboard=unnamed  
"set relativenumber
set showcmd
set cursorline
set cursorcolumn

"code folding
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

set backspace=indent,eol,start

" Set tabs as spaces
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

"set hidden
filetype off                  " required
filetype plugin indent on

au! BufRead,BufNewFile *.fish setfiletype fish
au! BufRead,BufNewFile *.vue setfiletype vue
au BufNewFile,BufRead *.html set filetype=htmldjango
au BufNewFile,BufRead *.log set syntax=log

"set tw=79
"set fo=cqt
"set wm=0

"autocmd BufReadPost *.docx :%!pandoc -f docx -t markdown
"autocmd BufWritePost *.docx :!pandoc -f markdown -t docx % > tmp.docx
"au BufNewFile,BufRead *.py
    "\ set softtabstop=4
    "\ set textwidth=79
    "\ set autoindent
    "\ set fileformat=unix
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType vue setlocal shiftwidth=2 tabstop=2

autocmd FileType markdown setlocal conceallevel=0

"Linting xml
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"Macros
"Completed python codes
let @c = '/last modifiedyypnct:Completed	         '
"Python Print
let @p = 'oprint('
let @s = 'yi)ysi)"f"i: ", p'
"let @d = 'oconsole.log(a"% -- l la: �kb�kbA;'
let @d = 'iconsole.log()i'
"let @d = 'iprint("% -- l l'
"if using fish shell

"set shell=/bin/bash

" set the runtime path to include Vundle and initialize
" For Linux
set rtp+=~/.vim/bundle/Vundle.vim
" For Windows
"set rtp+=C:\Users\Torsho\vimfiles\bundle\Vundle.vim

"change font quickly
"from https://vi.stackexchange.com/questions/3093/how-can-i-change-the-font-size-in-gvim
if has("unix")
    function! FontSizePlus ()
      let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole + 1
      let l:new_font_size = ' '.l:gf_size_whole
      let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
    endfunction

    function! FontSizeMinus ()
      let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole - 1
      let l:new_font_size = ' '.l:gf_size_whole
      let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
    endfunction
else
    function! FontSizePlus ()
      let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole + 1
      let l:new_font_size = ':h'.l:gf_size_whole
      let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
    endfunction

    function! FontSizeMinus ()
      let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole - 1
      let l:new_font_size = ':h'.l:gf_size_whole
      let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
    endfunction
endif

if has("gui_running")
    nmap <S-F12> :call FontSizeMinus()<CR>
    nmap <F12> :call FontSizePlus()<CR>
endif

"Persistent undo
if has('persistent_undo')      "check if your vim version supports it
    set undofile                 "turn on the feature
    set undodir=$HOME/.vim/undo/  "directory where the undo files will be stored
    set undolevels=1000
    set undoreload=10000
endif

"Make [[ work
"map ]] :call search("^\\(\\w.*\\)\\?{")<CR>
"map [[ :call search("^\\(\\w.*\\)\\?{", "b")<CR>
"map ][ :call search("^}")<CR>
"map [] :call search("^}", "b")<CR>

"matchit
runtime macros/matchit.vim
packadd! matchit

set wildmenu
set wildmode=list:longest,full

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Install plugins here

"Plugin  'justinmk/vim-sneak'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"
"Plugin 'wincent/command-t'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}

Bundle 'ervandew/supertab'

Plugin 'valloric/youcompleteme'  "Install it from aur/git AND UPDATE IT CAREFULLY
"Plugin 'Shougo/deoplete.nvim'

Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic' "Can use ALE over this

Plugin 'flazz/vim-colorschemes'
"Plugin 'qualiabyte/vim-colorstepper'

Plugin 'justinmk/vim-gtfo'

"Plugin 'dahu/nexus'
"Vim-KWEasy lets you jump to the very character you’ve got your eyeballs on!
"Plugin 'dahu/vim-KWEasy'
"Use leader-k to find hints
Plugin 'easymotion/vim-easymotion'
"Plugin 'haya14busa/incsearch.vim'
Plugin 'dkprice/vim-easygrep'

"Plugin 'jiangmiao/auto-pairs'
Plugin 'raimondi/delimitmate'

Plugin 'scrooloose/nerdcommenter'

Plugin 'wikitopian/hardmode'

Plugin 'svermeulen/vim-easyclip'

Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'

Plugin 'scrooloose/nerdtree'

Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'qdddddd/vim-cycle-airline-theme'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'majutsushi/tagbar'

Plugin 'yggdroot/indentline'
"Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'tpope/vim-abolish'

Plugin 'mileszs/ack.vim'
"Plugin 'albfan/ag.vim'
"Plugin 'thaerkh/vim-workspace'

Plugin 'plasticboy/vim-markdown'

Plugin 'AndrewRadev/switch.vim'

Plugin 'airblade/vim-rooter'
"Plugin 'shougo/neocomplete.vim'

Plugin 'dag/vim-fish'

"Auto close (X)HTML tags
Plugin 'alvan/vim-closetag'

Plugin 'will133/vim-dirdiff'

"Plugin 'python-mode/python-mode'

"Plugin 'fs111/pydoc.vim' "Should be installed in ftpplugin

Plugin 'tell-k/vim-autopep8'

"Plugin 'ap/vim-css-color'
Plugin 'chrisbra/Colorizer'

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

"Plugin 'ludovicchabant/vim-gutentags'

Plugin 'tpope/vim-speeddating'
"Plugin 'sagarrakshe/toggle-bool'

Plugin 'vim-scripts/indentpython'
Plugin 'xolox/vim-session'
 
"Plugin 'Houl/repmo-vim'

Plugin 'vim-python/python-syntax'
"Ultisnips
"Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

"Plugin 'hdima/python-syntax'

"Plugin 'wakatime/vim-wakatime'

"Plugin 'jmcomets/vim-pony'

Plugin 'alpertuna/vim-header'

"http://www.vim.org/scripts/script.php?script_id=2154
"Plugin 'vim-scripts/python.vim'

Plugin 'vim-scripts/python_match.vim'

"Marks management
"https://github.com/vim-scripts/marvim
"Plugin 'kshenoy/vim-signature'

"Markdown
"Plugin 'suan/vim-instant-markdown'

Plugin 'lervag/vimtex'

"Plugin 'vim-pandoc/vim-pandoc'
"Plugin 'vim-pandoc/vim-pandoc-syntax'

Plugin 'rhysd/open-pdf.vim'

Plugin 'godlygeek/tabular'

Plugin 'pangloss/vim-javascript'

Plugin 'alcesleo/vim-uppercase-sql'
Plugin 'posva/vim-vue'
"Plugin 'cosminadrianpopescu/vim-sql-workbench'

Plugin 'dbeniamine/cheat.sh-vim'
Plugin 'kshenoy/vim-signature'

Plugin 'dzeban/vim-log-syntax'
Plugin 'AndrewRadev/splitjoin.vim'

Plugin 'niklasl/vim-rdf'
Plugin 'n3.vim'
Plugin 'omer/vim-sparql'
Plugin 'fatih/vim-go'
Plugin 'mrtazz/simplenote.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"colorscheme industry
"colorscheme morning
"colorscheme breeze
"colorscheme SlateDark
"colorscheme evening
"colorscheme gruvbox

"if has ("gui_running")
    colorscheme Benokai
"else
    "colorscheme ron
    "colorscheme solarized
"endif

"Stop Conceal
set conceallevel=0

"let g:HardMode_level = 'wannabe'
"let g:HardMode_hardmodeMsg = "Don't fucking use this!"
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

"set diffexpr=MyDiff()
"function MyDiff()
  "let opt = '-a --binary '
  "if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  "if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  "let arg1 = v:fname_in
  "if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  "let arg2 = v:fname_new
  "if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  "let arg3 = v:fname_out
  "if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  "let eq = ''
  "if $VIMRUNTIME =~ ' '
    "if &sh =~ '\<cmd'
      "let cmd = '"' . $VIMRUNTIME . '\diff"'
      "let eq = '""'
    "else
      "let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    "endif
  "else
    "let cmd = $VIMRUNTIME . '\diff'
  "endif
  "silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction

"let g:gtfo#terminals = {'unix' : 'termite & -d'}

"ctrlP options
"let g:ctrlp_map = '<c-p>p'
let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_cmd = 'CtrlPMixed'
"map <s-f9> :CTRLpmru <cr>
"Map <A-F9> :CtrlPMixed<CR>
map <c-p><c-o> :CtrlPMixed<CR>
map <c-p><c-p> :CtrlPBuffer<CR>
map <c-p><c-i> :CtrlPRoot<CR>
map <c-p><c-l> :CtrlPTag<CR>
map <c-p><c-[> :CtrlPMRU<CR>
let g:ctrlp_cmd = 'CtrlPMRU'

"let g:colorizer_auto_color = 1
"Is this wrong?
let g:colorizer_auto_filetype='css,html,dosini,xdefaults'

"airline
let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='qwq'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 1

"Syntastic
let g:syntastic_python_checkers = ['python3.7']
let g:syntastic_vue_checkers = ['eslint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = ['eslint']

"let g:pymode_python = 'python3'
"let g:pymode_lint_ignore = "E116"
"vim-go
let g:go_gopls_enabled = 0
"vim-workspace
"let g:workspace_autocreate =1
"let g:workspace_persist_undo_history = 1
"let g:workspace_autosave = 1

" _   _            _____                       _      _
"| \ | |          /  __ \                     | |    | |
"|  \| | ___  ___ | /  \/ ___  _ __ ___  _ __ | | ___| |_ ___
"| . ` |/ _ \/ _ \| |    / _ \| '_ ` _ \| '_ \| |/ _ | __/ _ \
"| |\  |  __| (_) | \__/| (_) | | | | | | |_) | |  __| ||  __/
"\_| \_/\___|\___/ \____/\___/|_| |_| |_| .__/|_|\___|\__\___|
"                                       | |
"                                       |_|

""Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 1
"" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
"" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3

"" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
    "\ 'default' : '',
    "\ 'vimshell' : $HOME.'/.vimshell_hist',
    "\ 'scheme' : $HOME.'/.gosh_completions'
        "\ }

"" Define keyword.
"if !exists('g:neocomplete#keyword_patterns')
    "let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'

"" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()

"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
  "return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  "" For no inserting <CR> key.
  ""return pumvisible() ? "\<C-y>" : "\<CR>"
"endfunction
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"" Close popup by <Space>.
""inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

"" AutoComplPop like behavior.
""let g:neocomplete#enable_auto_select = 1

"" Shell like behavior(not recommended).
""set completeopt+=longest
""let g:neocomplete#enable_auto_select = 1
""let g:neocomplete#disable_auto_complete = 1
""inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
  "let g:neocomplete#sources#omni#input_patterns = {}
"endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim

"Youcompleteme
"let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '/home/torsho/.vim/bundle/youcompleteme/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_seed_identifiers_with_syntax = 1
"Django recommended settings
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
"let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_filetype_blacklist = {}

"rooter
let g:rooter_silent_chdir = 1
"let g:rooter_change_directory_for_non_project_files = 'current'

"vim-easytags
"let g:easytags_cmd = '/usr/bin/ctags'
"Gutentags
let g:gutentags_generate_on_missing = 1

"Keymappings

"Visual mode Search and replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
"vnoremap <C-r> "hy::,$s/<C-r>h//gc|1,''-&&<left><left><left><left><left><left><left><left><left><left><left>
"Visual mode swap
vnoremap <C-x> <Esc>`.``gvP``P
"Visual mode search selected 
vnoremap // y/<C-R>"<CR>

"Easymotion configs
"let g:Easymotion_mapping_{easymotion-bd-w} = '<c-\>'
"nmap <c-;> <plug>(easymotion-bd-f)
"map s <plug>Sneak_s
"let g:sneak#label = 1
  
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

"Tim Pope's cursor keyscheme
nmap <Up> [e
nmap <Down> ]e
vmap <Up> [egv
vmap <Down> ]egv

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"nmap <silent> <A-Up> :wincmd k<CR>
"nmap <silent> <A-Down> :wincmd j<CR>
"nmap <silent> <A-Left> :wincmd h<CR>
"nmap <silent> <A-Right> :wincmd l<CR>

nnoremap <Left> :bprevious<Return>
nnoremap <Right> :bnext<Return>

map <F2> :NERDTreeToggle<CR>
map <F4> :NERDTreeFind<CR>
"tagbar
nnoremap <silent> <F9> :TagbarToggle<CR>

"vim-header
let g:header_auto_add_header = 0
let g:header_field_author = 'desertsniper87'
let g:header_field_author_email = 'torshobuet@gmail.com'
let g:header_field_filename = 0
"let g:header_field_timestamp
let g:header_field_modified_timestamp = 1
let g:header_field_modified_by = 0
"let g:header_field_timestamp_format 
"map <F4> :AddHeader<CR>
"extra keycommands
nmap <A-a> :%y+<CR>
"insert mode

function! DelEmptyLineAbove()
    if line(".") == 1
        return
    endif
    let l:line = getline(line(".") - 1)
    if l:line =~ '^s*$'
        let l:colsave = col(".")
        .-1d
        silent normal! <C-y>
        call cursor(line("."), l:colsave)
    endif
endfunction

function! AddEmptyLineAbove()
    let l:scrolloffsave = &scrolloff
    " Avoid jerky scrolling with ^E at top of window
    set scrolloff=0
    call append(line(".") - 1, "")
    if winline() != winheight(0)
        silent normal! <C-e>
    endif
    let &scrolloff = l:scrolloffsave
endfunction

function! DelEmptyLineBelow()
    if line(".") == line("$")
        return
    endif
    let l:line = getline(line(".") + 1)
    if l:line =~ '^s*$'
        let l:colsave = col(".")
        .+1d
        ''
        call cursor(line("."), l:colsave)
    endif
endfunction

function! AddEmptyLineBelow()
    call append(line("."), "")
endfunction

" If you are using a console version of Vim, or dealing
" with a file that changes externally (e.g. a web server log)
" then Vim does not always check to see if the file has been changed.
" The GUI version of Vim will check more often (for example on Focus change),
" and prompt you if you want to reload the file.
"
" There can be cases where you can be working away, and Vim does not
" realize the file has changed. This command will force Vim to check
" more often.
"
" Calling this command sets up autocommands that check to see if the
" current buffer has been modified outside of vim (using checktime)
" and, if it has, reload it for you.
"
" This check is done whenever any of the following events are triggered:
" * BufEnter
" * CursorMoved
" * CursorMovedI
" * CursorHold
" * CursorHoldI
"
" In other words, this check occurs whenever you enter a buffer, move the cursor,
" or just wait without doing anything for 'updatetime' milliseconds.
"
" Normally it will ask you if you want to load the file, even if you haven't made
" any changes in vim. This can get annoying, however, if you frequently need to reload
" the file, so if you would rather have it to reload the buffer *without*
" prompting you, add a bang (!) after the command (WatchForChanges!).
" This will set the autoread option for that buffer in addition to setting up the
" autocommands.
"
" If you want to turn *off* watching for the buffer, just call the command again while
" in the same buffer. Each time you call the command it will toggle between on and off.
"
" WatchForChanges sets autocommands that are triggered while in *any* buffer.
" If you want vim to only check for changes to that buffer while editing the buffer
" that is being watched, use WatchForChangesWhileInThisBuffer instead.
"
command! -bang WatchForChanges                  :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0})
command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0, 'while_in_this_buffer_only': 1})
command! -bang WatchForChangesAllFile           :call WatchForChanges('*', {'toggle': 1, 'autoread': <bang>0})
" WatchForChanges function
"
" This is used by the WatchForChanges* commands, but it can also be
" useful to call this from scripts. For example, if your script executes a
" long-running process, you can have your script run that long-running process
" in the background so that you can continue editing other files, redirects its
" output to a file, and open the file in another buffer that keeps reloading itself
" as more output from the long-running command becomes available.
"
" Arguments:
" * bufname: The name of the buffer/file to watch for changes.
"     Use '*' to watch all files.
" * options (optional): A Dict object with any of the following keys:
"   * autoread: If set to 1, causes autoread option to be turned on for the buffer in
"     addition to setting up the autocommands.
"   * toggle: If set to 1, causes this behavior to toggle between on and off.
"     Mostly useful for mappings and commands. In scripts, you probably want to
"     explicitly enable or disable it.
"   * disable: If set to 1, turns off this behavior (removes the autocommand group).
"   * while_in_this_buffer_only: If set to 0 (default), the events will be triggered no matter which
"     buffer you are editing. (Only the specified buffer will be checked for changes,
"     though, still.) If set to 1, the events will only be triggered while
"     editing the specified buffer.
"   * more_events: If set to 1 (the default), creates autocommands for the events
"     listed above. Set to 0 to not create autocommands for CursorMoved, CursorMovedI,
"     (Presumably, having too much going on for those events could slow things down,
"     since they are triggered so frequently...)
function! WatchForChanges(bufname, ...)
  " Figure out which options are in effect
  if a:bufname == '*'
    let id = 'WatchForChanges'.'AnyBuffer'
    " If you try to do checktime *, you'll get E93: More than one match for * is given
    let bufspec = ''
  else
    if bufnr(a:bufname) == -1
      echoerr "Buffer " . a:bufname . " doesn't exist"
      return
    end
    let id = 'WatchForChanges'.bufnr(a:bufname)
    let bufspec = a:bufname
  end
  if len(a:000) == 0
    let options = {}
  else
    if type(a:1) == type({})
      let options = a:1
    else
      echoerr "Argument must be a Dict"
    end
  end
  let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
  let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
  let disable     = has_key(options, 'disable')     ? options['disable']     : 0
  let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
  let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0
  if while_in_this_buffer_only
    let event_bufspec = a:bufname
  else
    let event_bufspec = '*'
  end
  let reg_saved = @"
  "let autoread_saved = &autoread
  let msg = "\n"
  " Check to see if the autocommand already exists
  redir @"
    silent! exec 'au '.id
  redir END
  let l:defined = (@" !~ 'E216: No such group or event:')
  " If not yet defined...
  if !l:defined
    if l:autoread
      let msg = msg . 'Autoread enabled - '
      if a:bufname == '*'
        set autoread
      else
        setlocal autoread
      end
    end
    silent! exec 'augroup '.id
      if a:bufname != '*'
        "exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
        "exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
        exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
      end
        exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec
      " The following events might slow things down so we provide a way to disable them...
      " vim docs warn:
      "   Careful: Don't do anything that the user does
      "   not expect or that is slow.
      if more_events
        exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
        exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
      end
    augroup END
    let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
  end
  " If they want to disable it, or it is defined and they want to toggle it,
  if l:disable || (l:toggle && l:defined)
    if l:autoread
      let msg = msg . 'Autoread disabled - '
      if a:bufname == '*'
        set noautoread
      else
        setlocal noautoread
      end
    end
    " Using an autogroup allows us to remove it easily with the following
    " command. If we do not use an autogroup, we cannot remove this
    " single :checktime command
    " augroup! checkforupdates
    silent! exec 'au! '.id
    silent! exec 'augroup! '.id
    let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
  elseif l:defined
    let msg = msg . 'Already watching ' . bufspec . ' for external updates'
  end
  echo msg
  let @"=reg_saved
endfunction

"Autosave and autoload
let autoreadargs={'autoread':1} 
execute WatchForChanges("*",autoreadargs) 

"Vim-easyclip 

let g:EasyClipUsePasteToggleDefaults = 0

nmap <space>f <plug>EasyClipSwapPasteForward
nmap <space>d <plug>EasyClipSwapPasteBackwards

let g:EasyClipUseSubstituteDefaults = 1

"nmap <c-s> <plug>SubstituteOverMotionMap

"Delitimate
au FileType html let b:delimitMate_matchpairs = "(:),[:],{:}"
au FileType htmldjango let b:delimitMate_matchpairs = "(:),[:],{:}"

"python-syntax
let g:python_highlight_all = 1
let python_highlight_indent_errors = 0
let python_highlight_space_errors = 0

"ultisnips/supertab
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"vim-session
let g:session_autosave = "yes"
let g:session_autoload = "no"
let g:session_default_to_last = 1 

"open-pdf
let g:pdf_convert_on_read = 1

"closetag.vim
let g:closetag_filenames = '*.html,*.xml,*.phtml,*.conf'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

"Easygrep
let g:EasyGrepMode = 1

"Vim-javascript
"Enables syntax highlighting for JSDocs.
let g:javascript_plugin_jsdoc = 1

"Enables some additional syntax highlighting for NGDocs. Requires JSDoc plugin to be enabled as well.
let g:javascript_plugin_ngdoc = 1

let g:javascript_plugin_flow = 1

"vimlatex
let g:Tex_ViewRule_pdf = 'zathura'
let g:tex_conceal = ""

"vim-vue
let g:vue_disable_pre_processors=1

"splitjoin.vim
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''

nmap <Leader>j :SplitjoinJoin<cr>
nmap <Leader>s :SplitjoinSplit<cr>

" SimpleNote

let g:SimplenoteUsername = "torshobuet@gmail.com"

"Indentline  
"let g:indentLine_conceallevel = 0

"Sp_ace mappings

nnoremap <Space>o :only <CR>
nnoremap <Space>b :bd <CR>
nnoremap <Space>p4 $p
nnoremap <Space>p7 "7P
nnoremap <Space>4 $ 
vnoremap <Space>4 $ 
nnoremap <Space>; A:<esc>
nnoremap <Space>w :w <CR>
nnoremap <Space>e :e <CR>
nnoremap <Space>y4 y$ sCR>
nnoremap <Space>ya :%y+ <CR>
"nnoremap <Space>rp :w <bar> :term python % <CR>
nnoremap <Space>rp :w <bar> :!python3.7 % <CR>
nnoremap <Space>rs :source % <CR>
"nnoremap <Space>rc :g++; ./a.out <CR>
nnoremap <Space>rc :!gcc % ; ./a.out <CR>
nnoremap <Space>r :cd %:p:h <CR>
nnoremap <Space><Space> i<Space><esc>
nnoremap <backspace> /[()\[\]{}<>]<CR>:noh<CR>
nnoremap <s-backspace> ?[()\[\]{}<>]<CR>:noh<CR>
nnoremap <leader>p i<c-r><s-"><esc>
nnoremap <leader><space> i<space><esc>
nnoremap <Space>l :execute "normal! iLine No.\ " . ( line(".") )<cr>

"Vimpager configs
"let vimpager_disable_x11 = 1
"let g.less.number = 0

"au BufNewFile,BufRead *.py
        "\ nnoremap <Space>l :!reindent -n % <CR>
"nnoremap <Space>l "+p
"nnoremap <Space>L "+P

"inoremap <Up> : <esc><S-[><i>
"inoremap <Down> : <esc><: S-]><i>
imap <silent> <Left> <C-D>
imap <silent> <Right> <C-T>
"inoremap <silent> <Down> <Esc>:call AddEmptyLineAbove()<CR>a
inoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>a
inoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>a
"does not work
"inoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()\gEldwi\<CR>a

imap <Up> <Esc> [<space>A
imap <Down> <Esc> ]<space>A

"inoremap <silent> <up> <Esc> ddkPi
"nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
"Cycling between register
"nnoremap <Leader>s :let @x=@" \| let @"=@a \| let @a=@b \| let @b=@x<CR>

"Easyclip Cut

"let g:EasyClipUseCutDefaults = 0
"nmap d <Plug>MoveMotionPlug
nnoremap gm m

" ColorStepper Keys
"nmap <F6> <Plug>ColorstepPrev
"nmap <F7> <Plug>ColorstepNext
"nmap <S-F7> <Plug>ColorstepReload
