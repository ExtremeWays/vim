
function! GetRunningOS()
  if has("win32")
    return "win"
  endif
  if has("unix")
    if system('uname')=~'Darwin'
      return "mac"
    else
      return "linux"
    endif
  endif
endfunction

let os = GetRunningOS()


"********插件管理*************
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
"
Plugin 'VundleVim/Vundle.vim'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.






" " plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" " Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
" " To ignore plugin indent changes, instead use:
"filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
"
"********插件管理*************

"Plugin 'Valloric/YouCompleteMe'


"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'



"****文件搜索插件****
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky' "函数名列表
"使用该选项来改变普通模式 Normal 下调用CtrlP的按键绑定:
let g:ctrlp_map = '<c-p>'
"设置当按下上面的按键绑定时，使用的默认打开命令
let g:ctrlp_cmd = 'CtrlP'

"When invoked without an explicit starting directory, CtrlP will set its local working directory according to this variable:
let g:ctrlp_working_path_mode = 'ra'

"Ignore files in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

map <F6> :CtrlPFunky<cr>
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_syntax_highlight = 1






"****文件浏览****
Plugin 'scrooloose/nerdtree'  "文件浏览
Plugin 'jistr/vim-nerdtree-tabs' "让每个tab都有相同的NERD Tree，看起来就像NERD Tree固定在最左一样
Plugin 'Xuyuanp/nerdtree-git-plugin' " 显示git状态标记

"开打vim时自动打开NERDTree插件
autocmd vimenter * NERDTree
"打开新的buffer时自动定位到编辑窗口
autocmd VimEnter * wincmd p
"vim启动时运行NERDTreeTabs插件
let g:nerdtree_tabs_open_on_console_startup=1
" 按下 F2 调出/隐藏 NERDTree
map  :silent! NERDTreeToggle
" 当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowBookmarks=1
"隐藏.pyc文件
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree



"****快速编写html，css****
Plugin 'mattn/emmet-vim'
"定义语言自定义行为
let g:user_emmet_settings = {
\ 'php' : {
\ 'extends' : 'html',
\ 'filters' : 'c',
\ },
\ 'xml' : {
\ 'extends' : 'html',
\ },
\ 'haml' : {
\ 'extends' : 'html',
\ },
\}
"修改出发快捷键
let g:user_emmet_expandabbr_key = '<Tab>'


"****状态栏****
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}


"****git集成****
Plugin 'tpope/vim-fugitive'
set laststatus=2 " Always display the status line
set statusline+=%{fugitive#statusline()} "  Git Hotness

"****配色****
Plugin 'altercation/vim-colors-solarized'
"syntax enable
"set background=dark
"colorscheme solarized

Plugin 'tomasr/molokai'
"let g:molokai_original = 1
"let g:rehash256 = 1
" Switch syntax highlighting on, when the terminal has colors
" Javascript syntax hightlight
syntax enable
" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd Syntax javascript set syntax=jquery
 
" Color scheme
colorscheme molokai
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0




"****提供源代码符号的结构化视图****
"Plugin 'vim-scripts/taglist.vim'

"map <F5> :Tlist<cr>
""不同时显示多个文件的tag，只显示当前文件的
"let Tlist_Show_One_File = 2
""如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Exit_OnlyWindow = 1 
""在右侧窗口中显示taglist窗口 
"let Tlist_Use_Right_Window = 1
""启动vim后，自动打开taglist窗口
"let Tlist_Auto_Open=1
"启动获得焦点
"let Tlist_GainFocus_On_ToggleOpen = 1
"


"****生成函数、变量列表****
Plugin 'majutsushi/tagbar'
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>

Plugin 'ramitos/jsctags'  "使tagbar插件支持js代码
Plugin 'vim-php/tagbar-phpctags.vim'  "使tagbar插件支持php代码
Plugin 'jszakmeister/markdown2ctags'  "使tagbar插件支持markdown代码

let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '/path/to/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }


Plugin 'universal-ctags/ctags'  "可以生成各类语言的tags
"设置支持css
let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }


"****快速给代码注释`ctrl+h`即可注释多种语言代码****
Plugin 'The-NERD-Commenter'
let NERDShutUp=1
"支持单行和多行的选择，//格式
map <c-h> ,c<space>


"****在输入()，""等需要配对的符号时，自动帮你补全剩余半个****
Plugin 'AutoClose'

"在()、""、甚至HTML标签之间快速跳转；
Plugin 'matchit.zip'

"用全新的方式在文档中高效的移动光标，革命性的突破
Plugin 'EasyMotion'
let g:EasyMotion_leader_key = '<Leader><Leader>' 

"自动识别文件编码；
Plugin 'FencView.vim'
let g:fencview_autodetect=1

"解放生产力的神器，简单配置，就可以按照自己的风格快速输入大段代码。
Plugin 'UltiSnips'


"****markdown 语法高亮 *****
Plugin 'plasticboy/vim-markdown'


"****语法检查插件 *****
Plugin 'scrooloose/syntastic'
" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"****语法检查插件 *****
Plugin 'jQuery'


"****自动补全 *****
Plugin 'vim-scripts/neocomplcache'
let g:neocomplcache_enable_at_startup = 1

call vundle#end()            " required
filetype plugin indent on    " required


"显示行号
set nu!
"系统剪贴板
set clipboard=unnamed

set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"#####排版处理###########
" Backspace deletes like most programs in insert mode
set backspace=2
" Show the cursor position all the time
set ruler
" Display incomplete commands
set showcmd
" Set fileencodings
set fileencodings=utf-8,bg18030,gbk,big5
 
filetype plugin indent on
 
" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
 
" Display extra whitespace
set list listchars=tab:»·,trail:·
 
" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
 
" Numbers
set number
set numberwidth=5
 
set matchpairs+=<:>
set hlsearch
"##########################


" Highlight current line  行列的高亮条
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn







" Disable swapfile and backup {{{
set nobackup
set noswapfile
"}}}






"工作状态的保存
map <F2> :mksession! ~/vim_session <cr> " Quick write session with F2
map <F3> :source ~/vim_session <cr> " And load session with F3


"###############使用别人的配置 待研究################"
"必须的设置：
filetype off
filetype plugin indent on
"打开高亮
syntax enable
"不要兼容vi
set nocompatible

"使用color solarized
set background=dark
colorscheme solarized
"terminal下面的背景问题
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"

set modelines=0


"tab键的设定
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"一些其他的设定
"字符设置
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5
"set encoding=utf-8
set scrolloff=3
"新建文件编码
set fenc=utf-8
set autoindent
set hidden
"设置光标高亮显示
set cursorline
set cursorcolumn
set ttyfast
set ruler
set backspace=indent,eol,start
"set laststatus=2
"相对行号 要想相对行号起作用要放在显示行号后面
set relativenumber
"显示行号
"set number
"无限undo
"set undofile
"自动换行
set wrap
"禁止自动换行
"set nowrap
"GUI界面里的字体，默认有抗锯齿
set guifont=Inconsolata:h12
"自动载入配置文件不需要重启
"autocmd! bufwritepost _vimrc source %
"将-连接符也设置为单词
set isk+=-

"设置大小写敏感和聪明感知(小写全搜，大写完全匹配)
set ignorecase
set smartcase
"set gdefault
set incsearch
set showmatch
set hlsearch

"加入html标签配对
"runtime macros/matchit.vim 

"以下设置用来是vim正确显示过长的行
"set textwidth=80
"set formatoptions=qrnl
"彩色显示第85行
set colorcolumn=85
"设置256色显示
set t_Co=256

"行号栏的宽度
set numberwidth=4
"初始窗口的宽度
"set columns=135
"初始窗口的高度
"set lines=50
"初始窗口的位置
"winpos 620 45 

"匹配括号的规则，增加针对html的<>
"set matchpairs=(:),{:},[:],<:>
"让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）
set whichwrap=b,s,<,>,[,]

"插入模式下移动
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap <c-h> <left>

"===================================================
"leader键的功能设置
"修改leader键为逗号
let mapleader=","
"esc的映射
imap jj <esc>
"屏蔽掉讨厌的F1键
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
"修改vim的正则表达
nnoremap / /\v
vnoremap / /\v
"使用tab键来代替%进行匹配跳转
nnoremap <tab> %
vnoremap <tab> %
"折叠html标签 ,fold tag
nnoremap <leader>ft vatzf
"使用,v来选择刚刚复制的段落，这样可以用来缩进
nnoremap <leader>v v`]
"使用,w来垂直分割窗口，这样可以同时查看多个文件,如果想水平分割则<c-w>s
nnoremap <leader>w <c-w>v<c-w>l
nnoremap <leader>wc <c-w>c
nnoremap <leader>ww <c-w>w
"使用<leader>t来控制Tab的切换
nnoremap <leader>t gt
nnoremap <leader>r gT
"使用<leader>空格来取消搜索高亮
nnoremap <leader><space> :noh<cr>
"html中的js加注释 取消注释
nmap <leader>h I//jj
nmap <leader>ch ^xx
"切换到当前目录
nmap <leader>q :execute "cd" expand("%:h")<CR>
"搜索替换
nmap <leader>s :,s///c

"取消粘贴缩进
nmap <leader>p :set paste<CR>
nmap <leader>pp :set nopaste<CR>

"文件类型切换
nmap <leader>fj :set ft=javascript<CR>
nmap <leader>fc :set ft=css<CR>
nmap <leader>fx :set ft=xml<CR>
nmap <leader>fm :set ft=mako<CR>

"设置隐藏gvim的菜单和工具栏 F2切换
set guioptions-=m
set guioptions-=T
"去除左右两边的滚动条
set go-=r
set go-=L

map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

"###############################"





