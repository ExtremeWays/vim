
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
" " plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

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
"Plugin 'tpope/vim-fugitive'




"****配色****
Plugin 'altercation/vim-colors-solarized'
"syntax enable
"set t_Co=256
"let g:solarized_termcolors= 256 
"set background=dark  
"colorscheme solarized


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








call vundle#end()            " required
filetype plugin indent on    " required


"显示行号
set nu!
"系统剪贴板
set clipboard=unnamed





set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936



" Disable swapfile and backup {{{
set nobackup
set noswapfile
"}}}


"工作状态的保存
map <F2> :mksession! ~/vim_session <cr> " Quick write session with F2
map <F3> :source ~/vim_session <cr> " And load session with F3









