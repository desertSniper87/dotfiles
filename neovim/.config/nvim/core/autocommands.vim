nnoremap <Left> :bprevious<Return>
nnoremap <Right> :bnext<Return>

"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
 
"Visual mode Search and replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <C-r><C-r> "hy:.,$s/<C-r>h//gc<left><left><left>
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

imap <C-Q>f <C-R>=expand("%:t:r")<CR>

"Tim Pope's cursor keyscheme 
"Requires vim-unimpaired
nmap <Up> [e
nmap <Down> ]e
vmap <Up> [egv
vmap <Down> ]egv

"Split next window

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

command! -bang WatchForChanges                  :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0})
command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0, 'while_in_this_buffer_only': 1})
command! -bang WatchForChangesAllFile           :call WatchForChanges('*', {'toggle': 1, 'autoread': <bang>0})
function! WatchForChanges(bufname, ...)
  " Figure out which options are in effect
  if a:bufname == '*'
    let id = 'WatchForChanges'.'AnyBuffer'
    " If you try to do checktime *, you'll get E93: More than one match for * is given
    let bufspec = ''
  else
    if bufnr(a:bufname) == -1
      echoerr "Buffer " . a:bufname . " doesn't exist"
      return
    end
    let id = 'WatchForChanges'.bufnr(a:bufname)
    let bufspec = a:bufname
  end
  if len(a:000) == 0
    let options = {}
  else
    if type(a:1) == type({})
      let options = a:1
    else
      echoerr "Argument must be a Dict"
    end
  end
  let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
  let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
  let disable     = has_key(options, 'disable')     ? options['disable']     : 0
  let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
  let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0
  if while_in_this_buffer_only
    let event_bufspec = a:bufname
  else
    let event_bufspec = '*'
  end
  let reg_saved = @"
  "let autoread_saved = &autoread
  let msg = "\n"
  " Check to see if the autocommand already exists
  redir @"
    silent! exec 'au '.id
  redir END
  let l:defined = (@" !~ 'E216: No such group or event:')
  " If not yet defined...
  if !l:defined
    if l:autoread
      let msg = msg . 'Autoread enabled - '
      if a:bufname == '*'
        set autoread
      else
        setlocal autoread
      end
    end
    silent! exec 'augroup '.id
      if a:bufname != '*'
        "exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
        "exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
        exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
      end
        exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec
      " The following events might slow things down so we provide a way to disable them...
      " vim docs warn:
      "   Careful: Don't do anything that the user does
      "   not expect or that is slow.
      if more_events
        exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
        exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
      end
    augroup END
    let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
  end
  " If they want to disable it, or it is defined and they want to toggle it,
  if l:disable || (l:toggle && l:defined)
    if l:autoread
      let msg = msg . 'Autoread disabled - '
      if a:bufname == '*'
        set noautoread
      else
        setlocal noautoread
      end
    end
    " Using an autogroup allows us to remove it easily with the following
    " command. If we do not use an autogroup, we cannot remove this
    " single :checktime command
    " augroup! checkforupdates
    silent! exec 'au! '.id
    silent! exec 'augroup! '.id
    let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
  elseif l:defined
    let msg = msg . 'Already watching ' . bufspec . ' for external updates'
  end
  "echo msg
  let @"=reg_saved
endfunction

"Autosave and autoload
let autoreadargs={'autoread':1} 
execute WatchForChanges("*",autoreadargs) 
