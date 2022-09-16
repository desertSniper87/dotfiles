
autocmd FileType markdown call Markdown_settings()


function! Markdown_settings()
    let b:surround_{char2nr('b')} = "```bash\n\r\n```"
endfunction
