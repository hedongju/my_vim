" Vim config file.

" Global Settings: {{{
" call pathogen#infect()              " use pathogen to manage plugins




syntax on                           " highlight syntax
filetype plugin indent on           " auto detect file type
"检测文件类型
filetype on
"针对不同的文件采用不同的缩进方式
filetype indent on
"允许插件
filetype plugin on

set nocompatible                    " out of Vi compatible mode
set number                          " show line number
set relativenumber
set numberwidth=3                   " minimal culumns for line numbers
set textwidth=0                     " do not wrap words (insert)
set nowrap                          " do not wrap words (view)
set showcmd                         " show (partial) command in status line
set ruler                           " line and column number of the cursor position
set wildmenu                        " enhanced command completion
set wildmode=list:longest,full      " command completion mode
set laststatus=2                    " always show the status line
set mouse=a                         " use mouse in all mode
"set foldenable                      " fold lines
"set foldmethod=vmarker               " fold as marker 
"set foldmethod=indent               " fold as marker 
"set fdm=marker               " fold as marker 
set noerrorbells                    " do not use error bell
set novisualbell                    " do not use visual bell
set t_vb=                           " do not use terminal bell

set wildignore=.svn,.git,*.swp,*.bak,*~,*.o,*.a
set autowrite                       " auto save before commands like :next and :make
set hidden                          " enable multiple modified buffers
set history=100                     " record recent used command history
set autoread                        " auto read file that has been changed on disk
set backspace=indent,eol,start      " backspace can delete everything
set completeopt=menuone,longest     " complete options (insert)
set pumheight=10                    " complete popup height
"set scrolloff=5                     " minimal number of screen lines to keep beyond the cursor
set autoindent                      " automatically indent new line
set cinoptions=:0,l1,g0,t0,(0,(s    " C kind language indent options

set tabstop=4                       " number of spaces in a tab
set softtabstop=4                   " insert and delete space of <tab>
set shiftwidth=4                    " number of spaces for indent
set expandtab                       " expand tabs into spaces
set incsearch                       " incremental search
set hlsearch                        " highlight search match
set ignorecase                      " do case insensitive matching
set smartcase                       " do not ignore if search pattern has CAPS
set nobackup                        " do not create backup file
set noswapfile                      " do not create swap file
set backupcopy=yes                  " overwrite the original file

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=gb2312,utf-8,gbk
set fileformat=unix

set background=dark
"colorscheme vividchalk
colorscheme desert 

" gui settings
if has("gui_running")
    set guioptions-=T " no toolbar
    set guioptions-=r " no right-hand scrollbar
    set guioptions-=R " no right-hand vertically scrollbar
    set guioptions-=l " no left-hand scrollbar
    set guioptions-=L " no left-hand vertically scrollbar
    autocmd GUIEnter * simalt ~x " window width and height
    source $VIMRUNTIME/delmenu.vim " the original menubar has an error on win32, so
    source $VIMRUNTIME/menu.vim    " use this menubar
    language messages zh_CN.utf-8 " use chinese messages if has
endif

" Restore the last quit position when open file.
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g'\"" |
    \ endif
"}}}

" Key Bindings: {{{
let mapleader = ","
let maplocalleader = "\\"

" map : -> <space>
map <Space> :

" move between windows
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Don't use Ex mode, use Q for formatting
map Q gq

"make Y consistent with C and D
nnoremap Y y$

" toggle highlight trailing whitespace
nmap <silent> <leader>l :set nolist!<CR>

" Ctrol-E to switch between 2 last buffers
nmap <C-E> :b#<CR>

" ,e to fast finding files. just type beginning of a name and hit TAB
nmap <leader>e :e **/

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" ,n to get the next location (compilation errors, grep etc)
nmap <leader>n :cn<CR>
nmap <leader>p :cp<CR>

" Ctrl-N to disable search match highlight
nmap <silent> <C-N> :silent noh<CR>

" center display after searching
nnoremap n   nzz
nnoremap N   Nzz
nnoremap *   *zz
nnoremap #   #zz
nnoremap g*  g*zz
nnoremap g#  g#z
"}}}

" Plugin Settings: {{{
if has("win32") " win32 system
    let $HOME  = $VIM
    let $VIMFILES = $HOME . "/vimfiles"
else " unix
    let $HOME  = $HOME
    let $VIMFILES = $HOME . "/.vim"
endif

" mru
let MRU_Window_Height = 10
nmap <Leader>r :MRU<cr>

" taglist
let g:Tlist_WinWidth = 60 
let g:Tlist_Use_Right_Window = 0
let g:Tlist_Auto_Update = 1
let g:Tlist_Process_File_Always = 1
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_Show_One_File = 1
let g:Tlist_Enable_Fold_Column = 0
let g:Tlist_Auto_Highlight_Tag = 1
let g:Tlist_GainFocus_On_ToggleOpen = 1
nmap <Leader>t :TlistToggle<cr>

" nerdtree
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 50
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeQuitOnOpen = 1
"nmap <Leader>f :NERDTreeToggle<CR>
nmap <Leader>f :exec("NERDTreeToggle ".expand('%:h'))<CR>
nmap <Leader>F :NERDTreeFind<CR>

" snipMate
let g:snip_author   = "Jeffy Du"
let g:snip_mail     = "jeffy.du@163.com"
let g:snip_company  = "SIC Microelectronics CO. Ltd"

" man.vim - view man page in VIM
source $VIMRUNTIME/ftplugin/man.vim

" cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-
"set cscopequickfix=s-,c-,d-,i-,t-,e-,g-,f-
nmap <leader>ss :cs find s <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sg :cs find g <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sc :cs find c <C-R>=expand("<cword>")<cr><cr>
nmap <leader>st :cs find t <C-R>=expand("<cword>")<cr><cr>
nmap <leader>se :cs find e <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<cr><cr>
nmap <leader>si :cs find i <C-R>=expand("<cfile>")<cr><cr>
nmap <leader>sd :cs find d <C-R>=expand("<cword>")<cr><cr>
nmap <leader>v :set mouse=v<cr>
nmap <leader>a :set mouse=a<cr>
nnoremap <silent> <F12> :A<CR>

" vimgdb.vim
if has("gdb")
	set asm=0
	let g:vimgdb_debug_file=""
	run macros/gdb_mappings.vim
endif


"==================================================
nnoremap <silent><F8> :exec("NERDTreeToggle ".expand('%:h'))<CR>
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set nowrapscan
let g:indent_guides_guide_size=1
"set textwidth=80
let g:winManagerWidth=45
"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWindowLayout='TagList'
"nmap wm:WMToggle <cr>
nmap <silent> wm :WMToggle<cr>

set nocsverb
if filereadable("cscope.out")
    cs add cscope.out
endif
set csverb

set cursorline
"set mousemodel=popup
"cs add /home/hdj/code/L25_6755_L1.MP10.P20_150928/cscope.out /home/hdj/code/L25_6755_L1.MP10.P20_150928/ 
"cs add /home/hdj/tools/repo_init_env/7512_repo_workspace/L25_6755_BFL7512B_L1.MP10.V1_151208_ALPS/android_mtk_6755_mp/cscope.out /home/hdj/tools/repo_init_env/7512_repo_workspace/L25_6755_BFL7512B_L1.MP10.V1_151208_ALPS/android_mtk_6755_mp/
"cs add /home/hdj/tools/repo_init_env/7512_repo_workspace1/L25_6755_BFL7512B_L1.MP10.V1_151208_ALPS/android_mtk_6755_mp/cscope.out /home/hdj/tools/repo_init_env/7512_repo_workspace1/L25_6755_BFL7512B_L1.MP10.V1_151208_ALPS/android_mtk_6755_mp/
let g:miniBufExplMapCTabSwitchBufs = 1


""""""""""""""""""""""""""""""
" lookupfile setting
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 3               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
"if filereadable("./filenametags")                "设置tag文件的名字
"    let g:LookupFile_TagExpr = '"./filenametags"'
"endif
"映射LookupFile为,lk
nmap <leader>lk :LUTags<cr>
"映射LUBufs为,ll
nmap <leader>ll :LUBufs<cr>
"映射LUWalk为,lw
nmap <leader>lw :LUWalk<cr>
"let g:LookupFile_TagExpr = '"/home/hdj/tools/repo_init_env/7512_repo_workspace/L25_6755_BFL7512B_L1.MP10.V1_151208_ALPS/android_mtk_6755_mp/filenametags"'
set ff=unix






set autochdir
set tags=tags;

"function! AutoLoadCTagsAndCScope()
"    let max = 50
"    let dir = './'
"    let i = 0
"    let break = 0
"    while isdirectory(dir) && i < max
"        if filereadable(dir . 'cscope.out') 
"            execute 'cs add ' . dir . 'cscope.out'
"            let break = 1
"        endif
"        if filereadable(dir . 'tags')
"            execute 'set tags =' . dir . 'tags'
"            let break = 1
"        endif
"        if break == 1
"            execute 'lcd ' . dir
"            break
"        endif
"        let dir = dir . '../'
"        let i = i + 1
"    endwhile
"endf
"nmap <F7> :call AutoLoadCTagsAndCScope()<CR>
"call AutoLoadCTagsAndCScope()

"vim 自动加载cscope.out数据库start
if has("cscope") 
    set csprg=/usr/bin/cscope 
    set csto=0 
    set cst 
    set csverb 
    set cspc=3 
    "add any database in current dir 
    if filereadable("cscope.out") 
        cs add cscope.out 
    "else search cscope.out elsewhere 
    else 
        let cscope_file=findfile("cscope.out",".;") 
        let cscope_pre=matchstr(cscope_file,".*/") 
        if !empty(cscope_file) && filereadable(cscope_file) 
            exe "cs add" cscope_file cscope_pre 
        endif       
    endif 
endif
"vim 自动加载cscope.out数据库end

"sdcv在线取词翻译start
function! Mydict()
let expl=system('sdcv -n ' .
\ expand("<cword>"))
windo if
\ expand("%")=="diCt-tmp" |
\ q!|endif
"25vsp diCt-tmp "在左边新建窗口显示
botright vertical 40split diCt-tmp
setlocal buftype=nofile bufhidden=hide noswapfile
1s/^/\=expl/
1
endfunction
nmap F :call Mydict()<CR>
"sdcv在线取词翻译end

"共享系统剪切板--->将vim默认复制粘贴的寄存器设置为"+寄存器
"set clipboard=unamedplus
"让VIM在退出的时候，保留粘贴板中的内容：
autocmd VimLeave * call system("xsel -ib", getreg('+'))


"开始使用Vundle的必须配置
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

"使用Vundle来管理Vundle
Bundle 'gmarik/vundle'

"Vundle配置必须 开启插件
filetype plugin indent on


if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif 
filetype on


"PowerLine插件 状态栏增强展示
"vim有一个状态栏 加上powline则有两个状态栏
set laststatus=2
set t_Co=256
let g:Powline_symbols='fancy'

" ctrl + p to search
"Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_tabpage_position = 'a'
let g:ctrlp_working_path_mode = 'ra'
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
    let g:ctrlp_user_command = 'ag %s -S --nocolor --nogroup --hidden
                \ --ignore .git
                \ --ignore .svn
                \ --ignore .hg
                \ --ignore .DS_Store
                \ --ignore "**/*.pyc"
                \ -g ""'
endif
