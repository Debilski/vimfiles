set go-=T
set bg=dark
if &background == "dark"
  hi normal guibg=black
endif
colorscheme ir_black
syntax on

if has("gui_macvim")
  macmenu &File.Open\.\.\. key=<nop>
  nnoremap <F6> :execute "!vimiterm ".shellescape(getline('.'), 1)<CR>
  if &background == "dark"
    hi normal guibg=black
    set transp=12
  endif
  map <D-o> :CommandT<CR>

  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert


  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

  " Command-Shift-F for Ack
  map <D-F> :Ack<space>

  " Command-Option-ArrowKey to switch viewports
  map <D-M-Up> <C-w>k
  imap <D-M-Up> <Esc> <C-w>k
  map <D-M-Down> <C-w>j
  imap <D-M-Down> <Esc> <C-w>j
  map <D-M-Right> <C-w>l
  imap <D-M-Right> <Esc> <C-w>l
  map <D-M-Left> <C-w>h
  imap <D-M-Left> <C-w>h

  " Command-e for ConqueTerm
  map <D-e> :call StartTerm()<CR>

  " ConqueTerm wrapper
  function StartTerm()
    execute 'ConqueTerm ' . $SHELL . ' --login'
    setlocal listchars=tab:\ \ 
  endfunction

  function FancyFull()
    set lines=60 columns=130
    set fuoptions=background:#00002b36
    hi NonText guifg=bg
    set fullscreen
  endfunction

  map <D-S-CR> :call FancyFull()<CR>

  function OpenQuickView()
    ! qlmanage -p %:p
  endfunction

else
  map <M-o> :CommandT<CR>
endif


