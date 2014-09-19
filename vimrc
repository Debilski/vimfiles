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

Plug 'edkolev/tmuxline.vim'

" Languages
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/xptemplate'
Plug 'msanders/snipmate.vim'
Plug 'Shougo/neocomplete.vim'

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
Plug 'zenzike/vim-haskell'
Plug 'enomsg/vim-haskellConcealPlus'
" needed for ghcmod
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Idris
Plug 'idris-hackers/idris-vim'

" Clojure
Plug 'VimClojure'

" Elixir
Plug 'elixir-lang/vim-elixir'

" Other
Plug 'dag/vim-fish'
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
Plug 'mhinz/vim-signify'
" Plugin 'airblade/vim-gitgutter'
Plug 'sjl/gundo.vim'
Plug 'sjbach/lusty'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-abolish'
Plug 'tsaleh/vim-align'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-git'
Plug 'henrik/vim-qargs'
Plug 'kshenoy/vim-signature'
Plug 'jpalardy/vim-slime'

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
    Plug 'Valloric/YouCompleteMe', { 'do': './install.sh', 'on': [] }

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

set smartindent
set expandtab

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

nmap Ä :bnext<CR>
nmap Ö :bprevious<CR>

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
" Enable the list of buffers
  let g:airline#extensions#tabline#enabled = 1
" Show just the filename
  let g:airline#extensions#tabline#fnamemod = ':t'
endif

function PowerlineFonts()
  let g:airline_powerline_fonts = 1
endfunction

function NoPowerlineFonts()
  let g:airline_powerline_fonts = 0

  let g:airline_left_sep=""
  let g:airline_left_alt_sep="│"
  let g:airline_right_sep=""
  let g:airline_right_alt_sep="│"
endfunction

if has('neovim')
  let s:python_host_init = 'python -c "import neovim; neovim.start_host()"'
  let &initpython = s:python_host_init
endif

if has('python3')
  python3 << EOF
try:
    from powerline.vim import setup as powerline_setup
    powerline_setup()
    del powerline_setup
except ImportError:
    pass
EOF
elseif has('python')
  python << EOF
try:
    from powerline.vim import setup as powerline_setup
    powerline_setup()
    del powerline_setup
except ImportError:
    pass
EOF
endif


map <silent> <Leader>e :Errors<CR>
map <Leader>s :SyntasticToggleMode<CR>

let g:syntastic_auto_loc_list=1

" Reload
map <silent> tu :call GHC_BrowseAll()<CR>
" Type Lookup
map <silent> tw :call GHC_ShowType(1)<CR>

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

nmap <leader>= :TagbarToggle<CR>
let g:tagbar_autofocus = 1

let g:slime_target = "tmux"
let g:slime_paste_file = tempname()

autocmd BufEnter *.hs set formatprg=pointfree



