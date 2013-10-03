set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Defaults everyone can agree on
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-sleuth'

Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'

Bundle 'altercation/vim-colors-solarized'

" Languages
Bundle 'scrooloose/syntastic'

" Scala
Bundle 'derekwyatt/vim-sbt'
Bundle 'derekwyatt/vim-scala'

" Julia
Bundle 'JuliaLang/julia-vim'

" Haskell
Bundle 'dag/vim2hs'
Bundle 'ujihisa/neco-ghc'
Bundle 'eagletmt/ghcmod-vim'
" needed for ghcmod
Bundle 'Shougo/vimproc.vim'

" Clojure
Bundle 'VimClojure'

" Other
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-haml'
Bundle 'jcf/vim-latex'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-liquid'

" Additional plugins
Bundle 'gnupg.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'ack.vim'
Bundle 'lilydjwg/colorizer'
Bundle 'gregsexton/gitv'
Bundle 'sjl/gundo.vim'
Bundle 'sjbach/lusty'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-abolish'
Bundle 'tsaleh/vim-align'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-git'
Bundle 'henrik/vim-qargs'
Bundle 'kshenoy/vim-signature'

" Colour schemes
Bundle 'tomasr/molokai'
Bundle 'zeis/vim-kolor'
Bundle 'morhetz/gruvbox'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'wesgibbs/vim-irblack'
Bundle 'ricardovaleriano/vim-github-theme'
Bundle '29decibel/codeschool-vim-theme'
Bundle 'tpope/vim-vividchalk'

" You complete me needs Python an a new vim
if has('python')
  if v:version >= 704 || ( v:version == 703 && has('patch584'))
    Bundle 'Valloric/YouCompleteMe'
  endif
endif

set number
set list

set hidden
set ignorecase
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set wildignore=*.swp,*.bak,*.pyc,*.class

function SolarLight()
  colorscheme solarized
  set background=light
endfunction

function SolarDark()
  colorscheme solarized
  set background=dark
endfunction

command SolarLight call SolarLight()
command SolarDark call SolarDark()

imap jj <Esc>
inoremap ¿ß ¿
inoremap ¿ \
" noremap ¿ß \
map ¿ \

" There is a problem with <C-^> (buffer switching) on some systems.
" Map it to F12 as well
map <F12> <C-^>

" Tabs mit ä und ö wechseln (besser wäre alt+ä, alt+ö)
nmap ä gt
nmap ö gT

if has("statusline")
    set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif

let NERDTreeIgnore = ['\.pyc$', '\.zwc.*$', '\.o$', '\.class$', '\~$']

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
au BufRead,BufNewFile *.scss set filetype=scss

hi scalaNew gui=underline
hi scalaMethodCall gui=italic
hi scalaValName gui=underline
hi scalaVarName gui=underline

if has("gui_macvim")
  let macvim_hig_shift_movement = 1

  let g:airline_powerline_fonts = 1
else
  let g:airline_left_sep=""
  let g:airline_left_alt_sep="│"
  let g:airline_right_sep=""
  let g:airline_right_alt_sep="│"
endif

