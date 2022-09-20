
autocmd FileType markdown call Markdown_settings()
autocmd FileType tex call Latex_settings()


function! Markdown_settings()
    let b:surround_{char2nr('b')} = "```bash\n\r\n```"
endfunction

function! Latex_settings()
    syntax on
endfunction
 
