" colorscheme lightning
" colorscheme gruvbox
colorscheme Benokai



hi Normal guibg=NONE ctermbg=NONE

"hi Normal guibg=none ctermbg=none
"hi LineNr guibg=none ctermbg=none
"hi Folded guibg=none ctermbg=none
"hi NonText guibg=none ctermbg=none
"hi SpecialKey guibg=none ctermbg=none
"hi VertSplit guibg=none ctermbg=none
"hi SignColumn guibg=none ctermbg=none
"hi EndOfBuffer guibg=none ctermbg=none

function ToggleBackgroundOfEditor()
    let &background = &background == "dark" ? "light" : "dark"
endfunction

nnoremap <silent> <F12> :call ToggleBackgroundOfEditor()<cr>
