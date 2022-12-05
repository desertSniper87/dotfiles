autocmd FileType markdown call Markdown_settings()

function! Markdown_settings()
    let b:surround_{char2nr('s')} = "```bash\n\r\n```"
    let b:surround_{char2nr('b')} = "**\r**"

    let @a=":%s/[•–○␣]/-/gc"
endfunction
    vnoremap <leader>s :s/\(,\<bar>and\<bar>\.\)/\r/g<Enter>
    ",and.

autocmd FileType tex call Latex_settings()

function! Latex_settings()
    syntax on
endfunction

autocmd FileType sh call Shell_settings()

function! Shell_settings()
    nnoremap <F9> :!%:p<Enter>
endfunction


autocmd FileType html call HTML_settings()

function! HTML_settings()
    nnoremap <leader>a :s/<[^>]*>/\r&\r/g<Enter>
    nnoremap <leader>s :g/^$/d<Enter>
endfunction

autocmd FileType python call Python_settings()

function! Python_settings()
    nnoremap <F9> :w <bar> :!python3 % <CR>
endfunction

autocmd FileType vim call Vim_settings()

function! Vim_settings()
    nnoremap <F9> :source % <CR>
endfunction

au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
