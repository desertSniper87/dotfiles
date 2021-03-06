source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
set guifont=Consolas:h12:cANSI:qDRAFT 
set guioptions-=T  "remove toolbar 
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
"set hidden
filetype off                  " required

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


"Macros
"Completed python codes
let @c = '/last modifiedyypnct:Completed	         '
"Python Print
let @p = 'oprint('
let @s = 'yi)ysi)"f"i: ", p'

"if using fish shell
set shell=/bin/bash
" set the runtime path to include Vundle and initialize
" For Linux
"set rtp+=~/.vim/bundle/Vundle.vim
" For Windows
set rtp+=C:\Users\Torsho\vimfiles\bundle\Vundle.vim

" Set tabs as spaces
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
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
    set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif

"Make [[ work
"map ]] :call search("^\\(\\w.*\\)\\?{")<CR>
"map [[ :call search("^\\(\\w.*\\)\\?{", "b")<CR>
"map ][ :call search("^}")<CR>
"map [] :call search("^}", "b")<CR>

"matchit
runtime macros/matchit.vim

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
"Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'

"Plugin 'easymotion/vim-easymotion'
Plugin 'flazz/vim-colorschemes'

"Plugin 'justinmk/vim-gtfo'

Plugin 'dahu/nexus'
Plugin 'dahu/vim-KWEasy'
"Vim-KWEasy lets you jump to the very character you’ve got your eyeballs on! 
Plugin 'qualiabyte/vim-colorstepper'


Plugin 'jiangmiao/auto-pairs'

Plugin 'scrooloose/nerdcommenter'

Plugin 'wikitopian/hardmode'

Plugin 'svermeulen/vim-easyclip.git'

Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'

Plugin 'scrooloose/nerdtree'

Plugin 'vim-airline/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'majutsushi/tagbar'

Plugin 'yggdroot/indentline'

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
"Plugin 'xolox/vim-easytags'

Plugin 'ludovicchabant/vim-gutentags'

Plugin 'tpope/vim-speeddating'
Plugin 'sagarrakshe/toggle-bool'

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

Plugin 'wakatime/vim-wakatime'

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
Plugin 'cosminadrianpopescu/vim-sql-workbench'
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
if has ("gui_running")
    colorscheme Benokai
else
    "colorscheme ron
    colorscheme thor
endif

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

let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='qwq'
let g:airline_powerline_fonts = 0

"Syntastic
let g:syntastic_python_checkers = ['python']

"vim workspace
let g:workspace_persist_undo_history = 1
let g:workspace_autosave = 1

"Keymappings
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
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

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

nnoremap <Left> :bprevious<Return>
nnoremap <Right> :bnext<Return>

map <F2> :NERDTreeToggle<CR> 
map <S-F2> :NERDTreeFind<CR> 
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
map <F4> :AddHeader<CR>
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
let g:session_autoload = "yes"
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
nnoremap <Space>rp :!python % <CR>
nnoremap <Space>rs :source % <CR>
nnoremap <Space>rc :g++; ./a.out <CR>
nnoremap <Space>r :cd %:p:h <CR>
nnoremap <backspace> /[()\[\]{}<>]<CR>:noh<CR>
nnoremap <s-backspace> ?[()\[\]{}<>]<CR>:noh<CR>
nnoremap <leader>p i<c-r><s-"><esc>
"au BufNewFile,BufRead *.py
        "\ nnoremap <Space>l :!reindent -n % <CR>
"nnoremap <Space>l "+p
"nnoremap <Space>L "+P

"inoremap <Up> : <esc><S-[><i>
"inoremap <Down> : <esc><: S-]><i>
imap <silent> <Left> <C-D>
imap <silent> <Right> <C-T>
inoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()<CR>a
inoremap <silent> <Down> <Esc>:call AddEmptyLineAbove()<CR>a
inoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>a
inoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>a

"Cycling between register
"nnoremap <Leader>s :let @x=@" \| let @"=@a \| let @a=@b \| let @b=@x<CR>

"Easyclip Cut

"let g:EasyClipUseCutDefaults = 0
"nmap d <Plug>MoveMotionPlug
nnoremap gm m
