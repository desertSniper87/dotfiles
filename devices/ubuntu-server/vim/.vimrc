set nocompatible
syntax enable
set relativenumber
set cpoptions+=$
set virtualedit=all
set incsearch
set hlsearch
set ignorecase
set smartcase
set autochdir
set clipboard=unnamed  
set showcmd
set backspace=indent,eol,start
set cursorline

set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

set tabstop=4
set shiftwidth=4
set expandtab


if has('persistent_undo')
    let target_path = expand('$HOME/.vim/undo/')

    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif

    set undofile                 
    set swapfile backup undofile
    set undodir=$HOME/.vim/undo/ 
    set undolevels=1000
    set undoreload=10000
endif




nnoremap <F9> :!%:p

