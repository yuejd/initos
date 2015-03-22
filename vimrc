set ch=1
set stl=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ %h\ %=\ [Line]\ %l,%c\ %=\ %P
set ls=2  
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,default,latin1

filetype plugin on
set scr=12
set bg=dark
set spc=[.?!]\\_[\\])'\"\	\ ]\\+
set sps=best
set cindent
set ts=4
set sw=4
set si
syntax enable
set showmatch
set cursorline
set clipboard=unnamed
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set magic
"set smarttab
set lbr
"colorscheme desert
"colorscheme vividchalk
set autochdir
set noerrorbells
set expandtab
set autoindent
set smartindent
set backspace=indent,start
imap <C-l> <Esc>la
imap <C-h> <Esc>ha

au FileType css,scss,html,vim,javascript setl shiftwidth=2
au FileType css,scss,html,vim,javascript setl tabstop=2
au FileType c,java,python,php setl shiftwidth=4
au FileType c,java,python,php setl tabstop=4
au FileType python setl softtabstop=4
au FileType python setl expandtab

set ofu=syntaxcomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css,scss set omnifunc=csscomplete#CompleteCSS
autocmd FileType java set omnifunc=javacomplete#Complete

"add tags path
set tags=./tags,./../tags,./*/tags,./../../tags

au BufNewFile,BufRead *.py,*.pyw setf	python					
let g:neocomplcache_enable_at_startup = 1 

function! CHANGE_CURR_DIR()
	let _dir = expand("%:p:h")
	exec "cd " . _dir
	unlet _dir
endfunction
autocmd BufEnter * call CHANGE_CURR_DIR()

set t_Co=256
lan en_US.UTF-8

""switch number on or off
map <C-n> :set invnu<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""The-NERD-tree"""""""""""""""""""
map <F10> :NERDTreeToggle<CR>
map <C-j> :NERDTreeToggle<CR>

""""""""""""""taglist"""""""""""""""""""""""""
map <silent> <F11> :TlistToggle<CR> 
map <C-k> :TlistToggle<CR> 
let Tlist_Auto_Highlight_Tag = 1  
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_File_Fold_Auto_Close = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Max_Submenu_Items = 1
let Tlist_Max_Tag_Length = 30
let Tlist_Process_File_Always = 0
let Tlist_Show_Menu = 0
let Tlist_Show_One_File = 0
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 40    
let tlist_php_settings = 'php;c:class;i:interfaces;d:constant;f:function'

""""""""""""""taglist"""""""""""""""""""""""""
let g:C_Ctrl_j   = 'off'

""""""""""""""Pydiction"""""""""""""""""""""""""
"let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'

""""""""""""""vim-powerline"""""""""""""""""""""""""
""let g:Powerline_symbols='unicode'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Python comment
function InsertPythonComment()
    exe 'normal'.1.'G'
    let line = getline('.')
    if line =~ '^#!.*$' || line =~ '^#.*coding:.*$'
        return
    endif
    normal O
    call setline('.', '#!/usr/bin/env python')
    normal o
    call setline('.', '# -*- coding:utf-8 -*-')
    normal o
    call setline('.', '#')
    normal o
    call setline('.', '#   Author  :   '.g:python_author)
    normal o
    call setline('.', '#   E-mail  :   '.g:python_email)
    normal o
    call setline('.', '#   Date    :   '.strftime("%y/%m/%d %H:%M:%S"))
    normal o
    call setline('.', '#   Desc    :   ')
    normal o
    call setline('.', '#')
    normal o
    call cursor(7, 17)
endfunction
function InsertCommentWhenOpen()
    if a:lastline == 1 && !getline('.')
        call InsertPythonComment()
    end
endfunc
au FileType python :%call InsertCommentWhenOpen()
au FileType python map <A-F4> :call InsertPythonComment()<cr>
let g:python_author = 'Jiadi Yue'
let g:python_email  = 'jiadi.yue@emc.com'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""For  vundle"""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

""""""""""""""""""""""""vim script rep""""""""""""""""""
Bundle 'The-NERD-tree'
Bundle 'vividchalk.vim'
colorscheme vividchalk
Bundle 'taglist.vim'
Bundle 'Emmet.vim'
Bundle 'c.vim'
Bundle 'python.vim'
Bundle 'bash-support.vim'
Bundle 'ervandew/supertab'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""For  vundle end"""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
