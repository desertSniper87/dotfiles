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
filetype off                  " required

" set the runtime path to include Vundle and initialize
" For Linux
"set rtp+=~/.vim/bundle/Vundle.vim
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

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'

"Install plugins here

"Plugin  'justinmk/vim-sneak'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
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

Plugin 'qualiabyte/vim-colorstepper'


Plugin  'jiangmiao/auto-pairs'

Plugin 'scrooloose/nerdcommenter'

Plugin 'wikitopian/hardmode'

Plugin 'svermeulen/vim-easyclip.git'

Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
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

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''                                              
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '"' . $VIMRUNTIME . '\diff"'
      let eq = '""'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"let g:gtfo#terminals = {'unix' : 'xterm -cd'}

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

"mswin.vim is evil
nnoremap <kPlus> <C-x>
nnoremap <kMinus> <C-a>

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
