autocmd FileType markdown call Markdown_settings()

function! Markdown_settings()
    let b:surround_{char2nr('s')} = "```bash\n\r\n```"
    let b:surround_{char2nr('b')} = "**\r**"

    let @a=":%s/[•–]/-/gc"
endfunction

autocmd FileType tex call Latex_settings()

function! Latex_settings()
    syntax on
endfunction
