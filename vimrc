set nocompatible               " be iMproved
filetype off                   " required!

call plug#begin('~/.vim/plugged')

" Defaults everyone can agree on
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'

Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'

Plug 'altercation/vim-colors-solarized'

Plug 'tpope/timl'

" Languages
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/xptemplate'

" Pandoc
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Scala
Plug 'derekwyatt/vim-sbt'
Plug 'derekwyatt/vim-scala'
Plug 'rompetroll/vim-scalariform'

" Julia
Plug 'JuliaLang/julia-vim'

" Haskell
Plug 'dag/vim2hs'
Plug 'ujihisa/neco-ghc'
Plug 'eagletmt/ghcmod-vim'
" needed for ghcmod
Plug 'Shougo/vimproc.vim'

" Clojure
Plug 'VimClojure'

" Elixir
Plug 'elixir-lang/vim-elixir'

" Other
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-haml'
Plug 'jcf/vim-latex'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-liquid'

" Additional plugins
Plug 'jamessan/vim-gnupg'
Plug 'kien/ctrlp.vim'
Plug 'ack.vim'
Plug 'lilydjwg/colorizer'
Plug 'gregsexton/gitv'
Plug 'sjl/gundo.vim'
Plug 'sjbach/lusty'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-abolish'
Plug 'tsaleh/vim-align'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-git'
Plug 'henrik/vim-qargs'
Plug 'kshenoy/vim-signature'

" Colour schemes
Plug 'tomasr/molokai'
Plug 'zeis/vim-kolor'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug 'wesgibbs/vim-irblack'
Plug 'ricardovaleriano/vim-github-theme'
Plug '29decibel/codeschool-vim-theme'
Plug 'tpope/vim-vividchalk'

" You complete me needs Python an a new vim
if has('python')
  if v:version >= 704 || ( v:version == 703 && has('patch584'))
    Plug 'Valloric/YouCompleteMe', { 'on': [] }

    augroup load_ycm
      autocmd!
      autocmd InsertEnter * call plug#load('YouCompleteMe')
                         \| call youcompleteme#Enable() | autocmd! load_ycm
    augroup END
  endif
endif

call plug#end()                " required
filetype plugin indent on      " required

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

