" Make it beautiful - colors and fonts

if has("gui_running")
  " Show tab number (useful for Cmd-1, Cmd-2.. mapping)
  " For some reason this doesn't work as a regular set command,
  " (the numbers don't show up) so I made it a VimEnter event
  autocmd VimEnter * set guitablabel=%N:\ %t\ %M

  set lines=60
  set columns=190

  if has("gui_gtk2") || has("gui_gtk3")
    set guifont=DejaVu\ Sans\ Mono\ 12,Inconsolata\ 13,Inconsolata\ XL\ 12,Monaco\ 12
  else
    set guifont=Monaco:h14,Inconsolata:h17,Inconsolata\ XL:h14,
  end
else
  let g:CSApprox_loaded = 1

  " For people using a terminal that is not Solarized
  if exists("g:yadr_using_unsolarized_terminal")
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
  end
endif

" Tell the term has 256 colors.
set t_Co=256

colorscheme solarized
set background=dark

" Remove menu bar and tool bar.
set go=aei
