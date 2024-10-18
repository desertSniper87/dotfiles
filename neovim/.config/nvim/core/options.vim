"Persistent undo
if has('persistent_undo')      "check if your vim version supports it
    set undofile                 "turn on the feature
    set undodir=$HOME/.nvim/undo/  "directory where the undo files will be stored
    set undolevels=1000
    set undoreload=10000
endif

if has('mac')
    let g:python3_host_prog = '/opt/homebrew/bin/python3.11'
endif
