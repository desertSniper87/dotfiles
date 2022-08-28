nnoremap <Left> :bprevious<Return>
nnoremap <Right> :bnext<Return>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
 
"Visual mode Search and replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
"Visual mode swap
vnoremap <C-x> <Esc>`.``gvP``P
"Visual mode search selected 
vnoremap // y/<C-R>"<CR>


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
 
"Sp_ace mappings

nnoremap <Space>o :only <CR>
nnoremap <Space>b :bd <CR>
nnoremap <Space>p4 $p
nnoremap <Space>p7 "7P
nnoremap <Space>4 $ 
vnoremap <Space>4 $ 
nnoremap <Space>; A:<esc>
nnoremap <Space>w :w <CR>
nnoremap <Space>e :e <CR>
nnoremap <Space>y4 y$ sCR>
nnoremap <Space>ya :%y+ <CR>
"nnoremap <Space>rp :w <bar> :term python % <CR>
nnoremap <Space>rp :w <bar> :!python3.7 % <CR>
nnoremap <Space>rs :source % <CR>
"nnoremap <Space>rc :g++; ./a.out <CR>
nnoremap <Space>rc :!gcc % ; ./a.out <CR>
nnoremap <Space>r :cd %:p:h <CR>
nnoremap <Space><Space> i<Space><esc>
nnoremap <backspace> /[()\[\]{}<>]<CR>:noh<CR>
nnoremap <s-backspace> ?[()\[\]{}<>]<CR>:noh<CR>
nnoremap <leader>p i<c-r><s-"><esc>
nnoremap <leader><space> i<space><esc>
nnoremap <Space>l :execute "normal! iLine No.\ " . ( line(".") )<cr>

imap <silent> <Left> <C-D>
imap <silent> <Right> <C-T>
inoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>
inoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>

imap <Up> <Esc> [<space>A
imap <Down> <Esc> ]<space>A

"Tim Pope's cursor keyscheme 
"Requires vim-unimpaired
nmap <Up> [e
nmap <Down> ]e
vmap <Up> [egv
vmap <Down> ]egv
