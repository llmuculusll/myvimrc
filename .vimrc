syntax enable
set background=dark
set t_Co=16
let g:solarized_termcolors=16
colorscheme solarized

 set nocompatible               " be iMproved

 filetype off                   " required!

 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'altercation/vim-colors-solarized'
 Bundle 'tpope/vim-fugitive'
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 Bundle 'joonty/vdebug.git'
 Bundle 'joonty/vim-phpqa.git'
 Bundle 'shawncplus/phpcomplete.vim'
 Bundle 'ervandew/supertab'
 Bundle 'xolox/vim-misc'
 Bundle 'scrooloose/nerdtree'
 Bundle 'tpope/vim-surround.git'
 Bundle 'vim-scripts/Auto-Pairs'
 Bundle 'bling/vim-airline'
 Bundle 'wikitopian/hardmode'
 Bundle 'L9'
 Bundle 'FuzzyFinder'
 " vim-scripts repos

 " non github repos


 set keywordprg=pman


 " git repos on your local machine (ie. when working on your own plugin)
 "  Bundle 'file:///Users/gmarik/path/to/plugin'
 " ...

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..


" Set Tabs and spacing for PHP as recommended by CakePHP
set shiftwidth=4
set softtabstop=4
set tabstop=4
set cindent
set smartindent
set autoindent

" Show lines that exceed 80 characters
" match ErrorMsg '\%80v.\+'

set number
set ruler
set laststatus=2

" Show Tab Bar
set showtabline=2

" Set Search options highlight, and wrap search
set hls is " highlight search text throughout the document.
set wrapscan " wrap the scan around the document
set ic "ignore case in search

" Don't run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0

" Plug-in key maps
" " Toggle Nerd Tree using the F2 Key
"y
map <F2> :NERDTreeToggle<CR>
"map <F2> :echo 'Current time is ' . strftime('%c')<CR>
	" " Tell Nerd tree to ignore backup files, you can add more
" " file types to ignor here...
let NERDTreeIgnore=['\.orig$','\.bak$']

nnoremap <buffer> j gj
nnoremap <buffer> k gk

"set autoread
augroup checktime
    au!
    if !has("gui_running")
        "silent! necessary otherwise throws errors when using command
        "line window.
        autocmd BufEnter        * silent! checktime
        autocmd CursorHold      * silent! checktime
        autocmd CursorHoldI     * silent! checktime
        "these two _may_ slow things down. Remove if they do.
        autocmd CursorMoved     * silent! checktime
        autocmd CursorMovedI    * silent! checktime
    endif
augroup END

set backupdir=~/vimbackupfiles,.
set directory=~/www/vimbackupfiles,.

map <Enter> o<ESC>
map <S-Enter> O<ESC>

"Disable Motions
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


" Source the vimrc file after saving it
 if has("autocmd")
   autocmd bufwritepost .vimrc source $MYVIMRC
 endif

" open up .vimrc in new tab
 let mapleader = ","
 nmap <leader>v :tabedit $MYVIMRC<CR>

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" remove trailing spaces when php or ctp files writes
autocmd BufWritePre *.php,*.ctp :call <SID>StripTrailingWhitespaces()


" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

inoremap jk <esc>

function! Incr()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-a>"
  endif
  normal `<
endfunction
vnoremap <C-a> :call Incr()<CR>
