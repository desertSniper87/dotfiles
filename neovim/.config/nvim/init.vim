set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   " allows auto-indenting depending on file type
set tabstop=4               " number of columns occupied by a tab character
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set clipboard=unnamedplus
" check if we have the lastest stable version of nvim
" let s:expect_ver = printf('nvim-%s', '0.7.2')
" let s:actual_ver = matchstr(execute('version'), 'NVIM v\zs[^\n]*')

" if !has(s:expect_ver)
"   echohl Error | echomsg printf("%s required, but got nvim %s!", s:expect_ver, s:actual_ver) | echohl None
"   finish
" endif

let s:core_conf_files = [ 
            \ 'plugins.vim',
            \ 'autocommands.vim',
            \ 'options.vim',
            \ 'themes.vim',
            \ 'neovide.vim'
            \ ]

            " \ 'globals.vim'
     " \ 'mappings.vim',

for s:fname in s:core_conf_files
   execute printf('source %s/core/%s', stdpath('config'), s:fname)
endfor
