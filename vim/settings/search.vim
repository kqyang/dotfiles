function! GetVisual()
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save
  return '"' . substitute(selection, '"', '\\"', 'g') . '"'
endfunction

"grep the current word using K (mnemonic Kurrent)
nnoremap <silent> K :Ag <cword><CR>

"grep visual selection
vnoremap K :<C-U>execute "Ag " . GetVisual()<CR>

"grep current word up to the next exclamation point using ,K
nnoremap ,K viwf!:<C-U>execute "Ag " . GetVisual()<CR>

"grep for 'def foo'
nnoremap <silent> ,gd :Ag 'def <cword>'<CR>

"steal from szw/vim-g
if !exists("g:vim_g_open_command")
  if has("win32")
    let g:vim_g_open_command = "start"
  elseif substitute(system('uname'), "\n", "", "") == 'Darwin'
    let g:vim_g_open_command = "open"
  else
    let g:vim_g_open_command = "xdg-open"
  endif
endif

function! SearchWithUrl(url, query)
  silent! execute "! goo_query=\"$(perl -MURI::Escape -e 'print uri_escape($ARGV[0]);' " . a:query . ")\" && " .  g:vim_g_open_command . ' "' . a:url . "$goo_query" . '" > /dev/null 2>&1 &'
endfunction

"google

if !exists("g:vim_g_query_url")
  let g:vim_g_query_url = "http://google.com/search?q="
endif
command! -nargs=1 Gg :call SearchWithUrl(g:vim_g_query_url, <f-args>)

nnoremap <silent> ,gg :Gg <cword><CR>
vnoremap <silent> ,gg :<C-U>execute "Gg " . GetVisual()<CR>

"code search

if !exists("g:vim_g_cs_url")
  let g:vim_g_cs_url = "http://cs/"
endif
command! -nargs=1 Cs :call SearchWithUrl(g:vim_g_cs_url, <f-args>)

nnoremap <silent> ,cs :Cs <cword><CR>
vnoremap <silent> ,cs :<C-U>execute "Cs " . GetVisual()<CR>

"Grep Current Partial
function! AgCurrentPartial()
  let l:fileNameWithoutExtension = expand('%:t:r')
  let l:fileNameWithoutUnderscore = substitute(l:fileNameWithoutExtension, '^_','','g')
  let l:grepPattern = "render.*[\\\'\\\"].*" . l:fileNameWithoutUnderscore . "[\\\'\\\"]$"
  exec 'Ag "' . l:grepPattern . '"'
endfunction

command! AgCurrentPartial call AgCurrentPartial()
"
nnoremap ,gcp :AgCurrentPartial<CR>

"Grep for usages of the current file
nnoremap ,gcf :exec "Ag " . expand("%:t:r")<CR>
