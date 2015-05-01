" febef vim config

"no vi-compatible
set nocompatible

"===============================================================================

" Setting up Vundle - Vim plugin manager.
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
   echo "Installing Vundle..."
   echo ""
   silent !mkdir -p ~/.vim/bundle
   silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
   let iCanHazVundle=0
endif

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"let Vundle manage Vundle
Bundle 'gmarik/vundle'

"===============================================================================

"Vim plugins here!

Bundle 'scrooloose/nerdtree'

Bundle 'scrooloose/nerdcommenter'

Bundle 'bling/vim-airline'

Bundle 'fisadev/fisa-vim-colorscheme'

Bundle 'motemen/git-vim'

Bundle 'tpope/vim-fugitive'

Bundle 'mhinz/vim-signify'

Bundle 'Shougo/neocomplete.vim'

Bundle 'tpope/vim-surround'

Bundle 'scrooloose/syntastic'

Bundle 'micheljsmith/vim-indent-object'

Bundle 'majutsushi/tagbar'

" Snippets manager (SnipMate), dependencies, and snippets repo
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'

Bundle 'jelera/vim-javascript-syntax'

Bundle 'burnettk/vim-angular'

Bundle 'IndexedSearch'

Bundle 'matchit.zip'

Bundle 'Wombat'

Bundle 'YankRing.vim'

Bundle 'nathanaelkane/vim-indent-guides'

Bundle 'wavded/vim-stylus'

Bundle 'digitaltoad/vim-jade'

"===============================================================================
" Install plugins the frist time vim runs
if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :BundleInstall
endif
"===============================================================================

"Vim settings and mappings

"allow plugins by file type (required for plugins)
filetype plugin on
filetype indent on

set shell=bash
"tabs and spaces handling
set expandtab
set tabstop=3
set softtabstop=3
set shiftwidth=3

"tab setings for file type
"autocmd FileType html setlocal shiftwidth=3 tabstop=3 softtabstop=3

"allways show status bar
set ls=2

"incremental search
set incsearch
"higlighted search results
set hlsearch

"show line numbers
set nu

"syntax highlight on
syntax on

"colorsheme
colorscheme fisa

if has('gui_running')
   colorscheme wombat
endif

"when scrolling, keep cursor 3 lines away fron screen border
set scrolloff=3

"autocompletion of files and commands behaves like shell
set wildmode=list:longest

"backup, swap, and undos storage
set directory=~/.vim/dirs/tmp     " dir to place swap files
set backup                        " make backups
set backupdir=~/.vim/dirs/backups " where pus backup files
set undofile
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
"store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs'

"create needed directories if they don't exist
if !isdirectory(&backupdir)
   call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
   call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
   call mkdir(&undodir, "p")
endif

"===============================================================================
"Plugins settings and mappings

"Tagbar --------------------------------

map <F4> :TagbarToggle<CR>
"autofocus on tagbar open
let g:tagbar_autofocus=1

"NERDTree ------------------------------

map <F3> :NERDTreeToggle<CR>


" Syntastic ------------------------------

" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 1
" custom icons (enable them if you use a patched font, and enable the previous 
" setting)
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'


" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=222
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" NeoComplCache ------------------------------

" most of them not documented because I'm not sure how they work
" (docs aren't good, had to do a lot of trial and error to make 
" it play nice)
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#enable_camel_case_completion = 1
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#fuzzy_completion_start_length = 1
let g:neocomplete#auto_completion_start_length = 1
let g:neocomplete#manual_completion_start_length = 1
let g:neocomplete#min_keyword_length = 1
let g:neocomplete#min_syntax_length = 1
" complete with workds from any opened file
let g:neocomplete#same_filetype_lists = {}
let g:neocomplete#same_filetype_lists._ = '_'


" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

" Airline ------------------------------

let g:airline_powerline_fonts = 0 
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on the README.rst)
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
"set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
" set laststatus=2
"
" " Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256

"set ai " autoindent
set tabstop=8 " sets tabs to 4 characters
set shiftwidth=3
set expandtab
set softtabstop=3 " makes the spaces feel like real tabs  "

" CSS (tabs = 4, lines = 79)
 autocmd FileType css set omnifunc=csscomplete#CompleteCSS
 autocmd FileType css set sw=2
 autocmd FileType css set ts=2
 autocmd FileType css set sts=2
" " JavaScript (tabs = 4, lines = 79)
 autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
 autocmd FileType javascript set sw=3
 autocmd FileType javascript set ts=8
 autocmd FileType javascript set sts=3
" " autocmd FileType javascript set tw=79
"  
  autocmd FileType jade set omnifunc=jadecomplete#CompleteJade
  autocmd FileType jade set sw=2
  autocmd FileType jade set ts=2
  autocmd FileType jade set expandtab
  autocmd FileType jade set sts=2
"   
"   " Highlight current line only in insert mode
"  autocmd InsertLeave * set nocursorline
"  autocmd InsertEnter * set cursorline
set cursorline
"    
"    " Makefiles require TAB instead of whitespace
    autocmd FileType make setlocal noexpandtab
"     
"     " Highlight cursor
"     highlight CursorLine ctermbg=52 cterm=NONE
     highlight CursorLine ctermbg=NONE cterm=NONE

set encoding=utf-8
set fileencoding=utf-8
"let  mapleader="\"
set list
set lcs=trail:·
let g:indent_guides_start_level = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=DarkBlue  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=Black  ctermbg=237
autocmd BufNewFile,BufRead *.ejs set filetype=html
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags "noci
