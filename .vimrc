set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"set guifont=Liberation\ mono\ 12
"set guifont=Dejavu\ Sans\ mono\ 12
"set guifont=xos4\ Terminus\ 15             
set guifont=monaco\ 12
set guioptions-=T  "remove toolbar 
set guioptions-=r  "remove right scrollbar
syntax enable
set number
set cpoptions+=$
set virtualedit=all
set incsearch
set hlsearch
set ignorecase
set smartcase
set autochdir
filetype off                  " required


"if using fish shell
set shell=/bin/bash
" set the runtime path to include Vundle and initialize
" For Linux
set rtp+=~/.vim/bundle/Vundle.vim
" For Windows
set rtp+=C:\Users\Torsho\vimfiles\bundle\Vundle.vim

" Set tabs as spaces
filetype plugin indent on
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

Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'

"Plugin 'easymotion/vim-easymotion'
Plugin 'flazz/vim-colorschemes'

Plugin 'justinmk/vim-gtfo'

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

Plugin 'thaerkh/vim-workspace'
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
let g:ctrlp_cmd = 'CtrlPMixed'
"map <A-p> :CtrlPMRU <CR>

let g:airline#extensions#tabline#enabled = 1

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

"inoremap <Up> : <esc><S-[><i>
"inoremap <Down> : <esc><: S-]><i>
imap <silent> <Left> <C-D>
imap <silent> <Right> <C-T>
inoremap <silent> <Down> <Esc>:call AddEmptyLineAbove()<CR>a
inoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>a
inoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>a
"does not work
inoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()\gEldwi\<CR>a        
"inoremap <silent> <up> <Esc> ddkPi 
"nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
"Cycling between register
"nnoremap <Leader>s :let @x=@" \| let @"=@a \| let @a=@b \| let @b=@x<CR>
                                 
"Easyclip Cut

"let g:EasyClipUseCutDefaults = 0
"nmap d <Plug>MoveMotionPlug
nnoremap gm m
