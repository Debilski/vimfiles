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

Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-fugitive'

Bundle 'altercation/vim-colors-solarized'

" Additional plugins
Bundle 'ack.vim'
Bundle 'lilydjwg/colorizer'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'gregsexton/gitv'
Bundle 'gnupg.vim'
Bundle 'sjl/gundo.vim'
Bundle 'sjbach/lusty'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-abolish'
Bundle 'tsaleh/vim-align'
Bundle 'VimClojure'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'wgibbs/vim-irblack'
Bundle 'pangloss/vim-javascript'
Bundle 'jcf/vim-latex'
Bundle 'tpope/vim-liquid'
Bundle 'tpope/vim-markdown'
Bundle 'Lokaltog/vim-powerline'
Bundle 'derekwyatt/vim-sbt'
Bundle 'derekwyatt/vim-scala'
Bundle 'tpope/vim-vividchalk'
Bundle 'JuliaLang/julia-vim'
Bundle 'henrik/vim-qargs'

set hidden

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
