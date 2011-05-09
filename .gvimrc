set go-=T
set bg=dark
if &background == "dark"
  hi normal guibg=black
endif
colorscheme ir_black
syntax on

if has("gui_macvim")
  macmenu &File.Open\.\.\. key=<nop>
  map <D-o> :CommandT<CR>
  nnoremap <F6> :execute "!vimiterm ".shellescape(getline('.'), 1)<CR>
  if &background == "dark"
    hi normal guibg=black
    set transp=12
  endif
endif


