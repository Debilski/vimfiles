set t_Co=256

set nocompatible

filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" Better indentation
filetype plugin indent on

set showcmd

set autoindent
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2

set number

set hidden

set ignorecase
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title

" show whitespace
set list listchars=tab:\ \ ,trail:·

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
let g:Tex_ViewRule_pdf = 'Preview'

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" set backup
" set backupdir=~/.vim/backup
" set directory=~/.vim/tmp

if has("gui_macvim")
    colorscheme evening
    set bg=light
    let macvim_hig_shift_movement = 1
    set selection=exclusive
endif

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

" NERDCommenter ----------------------------------------------------------{{{2

let NERDSpaceDelims = 1

" NERDTree ---------------------------------------------------------------{{{2

let NERDTreeIgnore = ['\.pyc$', '\.zwc.*$', '\.o$', '\.class$', '\~$']

set laststatus=2

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

let g:LustyJugglerSuppressRubyWarning = 1

let g:Powerline_symbols = 'unicode'

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <space>y :Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

