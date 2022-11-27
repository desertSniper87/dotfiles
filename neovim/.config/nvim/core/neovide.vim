if exists("g:neovide")
    let g:neovide_cursor_vfx_mode = "railgun"
    "set guifont=TerminessTTF\ Nerd\ Font\ Mono:h11
    "set guifont=Profont\ for\ Powerline:h11
    "set guifont=DejaVu\ Sans\ Mono:h11
    set mouse=a

    let g:gui_font_size = 11
    silent! execute('set guifont=DejaVu\ Sans\ Mono:h'.g:gui_font_size)

    function! ResizeFont(delta)
        let g:gui_font_size = g:gui_font_size + a:delta
        execute('set guifont=DejaVu\ Sans\ Mono:h'.g:gui_font_size)
    endfunction

    noremap <expr><C-Up> ResizeFont(1)
    noremap <expr><C-Down> ResizeFont(-1)
endif
