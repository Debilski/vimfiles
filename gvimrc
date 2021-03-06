set guioptions-=T " remove toolbar

function! SolarLight()
  colorscheme solarized
  set background=light
  set transparency=2
endfunction

function! SolarDark()
  colorscheme solarized
  set background=dark
set transparency=2
endfunction

if has("gui_macvim")
  set transparency=2

  let macvim_hig_shift_movement = 1
  set selection=exclusive

  set guifont=Menlo\ for\ powerline:h11

  macmenu &File.Open\.\.\. key=<nop>
  nnoremap <F6> :execute "!vimiterm ".shellescape(getline('.'), 1)<CR>
  map <D-o> :CtrlP<CR>

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
    let path = expand('%:p')
    call system("qlmanage -p 2>/dev/null '" . path . "'")
  endfunction

  map <S-D-Space> :call OpenQuickView()<CR>

else
  map <M-o> :CtrlP<CR>
endif


