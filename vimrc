"==========================================
" Sections:
"     ->General 基础设置
"     ->Show 展示/排班等界面格式设置
"     ->file encode, 文件编码,格式
"     ->others 其它基础配置
"     ->hot key  自定义快捷键
"     ->bundle 插件管理和配置项
"     ->colortheme 主题,及一些展示上颜色的修改
"==========================================

"==========================================
" General 基础设置
"==========================================

" history存储长度。
set history=2000

"检测文件类型
filetype on
"针对不同的文件类型采用不同的缩进格式
filetype indent on
"允许插件
filetype plugin on
"启动自动补全
filetype plugin indent on

"非兼容vi模式。去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible
set autoread          " 文件修改之后自动载入。
set shortmess=atI       " 启动的时候不显示那个援助索马里儿童的提示

"backup, swap or not
set nobackup
set noswapfile
"set backup
"set swapfile
"if has("win32") || has("win64")
  "set backupdir=$VIM/vimtmp
  "set directory=$VIM/vimtmp
"else
  "set backupdir=~/.vimtmp
  "set directory=~/.vimtmp
"endif

"设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
"好处：误删什么的，如果以前屏幕打开，可以找回
"set t_ti= t_te=

" No annoying sound on errors
" 去掉输入错误的提示声音
set title                " change the terminal's title
set novisualbell           " don't beep
set noerrorbells         " don't beep
set t_vb=
set tm=500

"==========================================
" Show 展示/排班等界面格式设置
"==========================================
" With this, the gui (gvim and macvim) now doesn't have the toolbar, the left
" and right scrollbars and the menu.
" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions-=m
    set guioptions-=M
endif

"显示行号：
set number
set wrap                    " 取消换行。

"括号配对情况
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

"设置文内智能搜索提示
" 高亮search命中的文本。
set hlsearch
" 搜索时忽略大小写
set ignorecase
" 随着键入即时搜索
set incsearch
" 有一个或以上大写字母时仍大小写敏感
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
set mouse=a

"Smart indent
set cindent
set smartindent
set autoindent    " always set autoindenting on
set autochdir
set tabstop=2                " 设置Tab键的宽度        [等同的空格个数]
set shiftwidth=2  " number of spaces to use for autoindenting
set softtabstop=2             " 按退格键时可以一次删掉 4 个空格
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格

set expandtab                " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]

set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'

" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set wildignore=*.swp,*.bak,*.pyc,*.class


" 自动补全配置
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
"set completeopt+=longest
set completeopt=longest,menu
set ttyfast

"create undo file
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
if v:version >= 730
"    set undofile                " keep a persistent backup file
    set undodir=~./vimtmp/
endif


"显示当前的行号列号：
set ruler
""在状态栏显示正在输入的命令
set showcmd
" Show current mode
set showmode

" Set 7 lines to the cursor - when moving vertically using j/k 上下滚动,始终在中间
set scrolloff=2

"set winwidth=79

" Always show the status line
set laststatus=2

"==========================================
" file encode, 文件编码,格式
"==========================================
" 设置新文件的编码为 UTF-8
"set fileencodings=ucs-bom,utf-8,gb2312,big5,latin1

set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
" 下面这句只影响普通模式 (非图形界面) 下的 Vim。
set termencoding=utf-8


" Use Unix as the standard file type
set fileformat=unix
set ffs=unix,dos,mac

" 合并两行中文时，不在中间加空格：
set formatoptions+=B

"==========================================
" others 其它配置
"==========================================
autocmd! bufwritepost _vimrc source % " vimrc文件修改之后自动加载。 windows。
autocmd! bufwritepost .vimrc source % " vimrc文件修改之后自动加载。 linux。


"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"


" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai

" if this not work ,make sure .viminfo is writable for you
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"删除多余空格
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

" Remember info about open buffers on close"
set viminfo^=%

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"==========================================
"hot key  自定义快捷键
"==========================================
let mapleader = ','
let g:mapleader = ','

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>


"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
map j gj
map k gk

" better command line editing
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

"Smart way to move between windows 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" key bindings for quickly moving between windows
" h left, l right, k up, j down
noremap <leader>h <c-w>h
noremap <leader>l <c-w>l
noremap <leader>k <c-w>k
noremap <leader>j <c-w>j

noremap <leader>e :e<Space>
noremap <leader>w :w<CR>

" Go to home and end using capitalized directions
noremap H 0
noremap L $

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

"set paste
set pastetoggle=<F5>            " when in insert mode, press <F5> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste


nnoremap <leader>v V`}

"Use sane regexes"
nnoremap / /\v
vnoremap / /\v

"Use arrow key to change buffer"
noremap <left> :bp<CR>
noremap <right> :bn<CR>

""Jump to start and end of line using the home row keys
""
nmap t o<ESC>k
nmap T O<ESC>j

" Quickly close the current window
nnoremap <leader>q :q<CR>

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" select all
map <Leader>sa ggVG"

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" tabnext  tabpreviouse

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" The alt (option) key on macs now behaves like the 'meta' key. This means we
" can now use <m-x> or similar as maps. This is buffer local, and it can easily
" be turned off when necessary (for instance, when we want to input special
" characters) with :set nomacmeta.
if has("gui_macvim")
  set macmeta
endif



"==========================================
" bundle 插件管理和配置项
"==========================================
"========================== config for plugins begin ======================================

" 0-bundle the plugins
"package dependent:  ctags
"python dependent:  pep8, pyflake

filetype off " required! turn off

call plug#begin('~/.vim/plugged')

"################### 插件管理 ###################"


"################### 导航 ###################"
"目录导航
Plug 'scrooloose/nerdtree'
map <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let g:netrw_home='~/bak'
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

"" 默认方向键左右可以切换buffer
"nnoremap <TAB> :MBEbn<CR>
"noremap <leader>bn :MBEbn<CR>
"noremap <leader>bp :MBEbp<CR>
"noremap <leader>bd :MBEbd<CR>

"标签导航
Plug 'majutsushi/tagbar'
nmap <F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"for show no user whitespaces
Plug 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>

"主题 solarized
Plug 'altercation/vim-colors-solarized'
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
" 状态栏增强展示
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"################### 快速移动 ###################"

"更高效的移动 ,, + w/fx
Plug 'Lokaltog/vim-easymotion'

Plug 'vim-scripts/matchit.zip'

"################### 补全及快速编辑 ###################"

"迄今为止用到的最好的自动VIM自动补全插件
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
let g:ycm_use_ultisnips_completer = 1 "提示UltiSnips
let g:ycm_collect_identifiers_from_comments_and_strings = 1   "注释和字符串中的文字也会被收入补全
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_identifier_candidate_chars = 3
" 开启语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
"let g:ycm_extra_conf_globlist = ['~/repos/*']
"let g:ycm_filetype_specific_completion_to_disable = {'javascript': 1}
let g:ycm_python_binary_path = 'python3'

nnoremap <leader>y :YcmForceCompileAndDiagnostics<cr>
nnoremap <leader>pg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>pd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>pc :YcmCompleter GoToDeclaration<CR>

Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

"快速插入代码片段
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"快速 加减注释
Plug 'scrooloose/nerdcommenter'

" 快速加入修改环绕字符
Plug 'tpope/vim-surround'
"for repeat -> enhance surround.vim, . to repeat command
Plug 'tpope/vim-repeat'

"自动补全单引号，双引号等
Plug 'Raimondi/delimitMate'
" for python docstring ",优化输入
au FileType python let b:delimitMate_nesting_quotes = ['"']

let g:closetag_html_style=1

"for code alignment
Plug 'godlygeek/tabular'
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>


"for visual selection
Plug 'terryma/vim-expand-region'
map = <Plug>(expand_region_expand)
map - <Plug>(expand_region_shrink)

"################# 语法检查 ###############
Plug 'w0rp/ale'

" for markdown
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1


"# golang plugin
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" quickfix ops
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
"let g:go_list_type = "quickfix"

autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

"
"################### 其他 ###################"
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'


"edit history, 可以查看回到某个历史状态
Plug 'sjl/gundo.vim'
nnoremap <leader>h :GundoToggle<CR>

Plug 'vim-scripts/YankRing.vim'

Plug 'lfv89/vim-interestingwords'
Plug 'lyuts/vim-rtags'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" end turn on
filetype plugin indent on

call plug#end()
"========================== config for plugins end ======================================


"==========================================
" 主题,及一些展示上颜色的修改
"==========================================
"开启语法高亮
syntax enable
syntax on


" 修改主题和颜色展示
if has("gui_running")
  set guifont=Monaco:h12
  colorscheme solarized
endif

set background=dark
set t_Co=256

"colorscheme molokai
"colorscheme desert

"设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

"" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline


