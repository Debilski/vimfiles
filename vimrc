set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" Defaults everyone can agree on
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-sleuth'

Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'

Plugin 'altercation/vim-colors-solarized'

Plugin 'tpope/timl'

" Languages
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/xptemplate'

" Scala
Plugin 'derekwyatt/vim-sbt'
Plugin 'derekwyatt/vim-scala'
Plugin 'rompetroll/vim-scalariform'

" Julia
Plugin 'JuliaLang/julia-vim'

" Haskell
Plugin 'dag/vim2hs'
Plugin 'ujihisa/neco-ghc'
Plugin 'eagletmt/ghcmod-vim'
" needed for ghcmod
Plugin 'Shougo/vimproc.vim'

" Clojure
Plugin 'VimClojure'

" Elixir
Plugin 'elixir-lang/vim-elixir'

" Other
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-haml'
Plugin 'jcf/vim-latex'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-liquid'

" Additional plugins
Plugin 'jamessan/vim-gnupg'
Plugin 'kien/ctrlp.vim'
Plugin 'ack.vim'
Plugin 'lilydjwg/colorizer'
Plugin 'gregsexton/gitv'
Plugin 'sjl/gundo.vim'
Plugin 'sjbach/lusty'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-abolish'
Plugin 'tsaleh/vim-align'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-git'
Plugin 'henrik/vim-qargs'
Plugin 'kshenoy/vim-signature'

" Colour schemes
Plugin 'tomasr/molokai'
Plugin 'zeis/vim-kolor'
Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'wesgibbs/vim-irblack'
Plugin 'ricardovaleriano/vim-github-theme'
Plugin '29decibel/codeschool-vim-theme'
Plugin 'tpope/vim-vividchalk'

" You complete me needs Python an a new vim
if has('python')
  if v:version >= 704 || ( v:version == 703 && has('patch584'))
    Plugin 'Valloric/YouCompleteMe'
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

