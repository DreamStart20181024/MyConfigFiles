" ###################   基本设置    ######################################

" 设置编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

"set fileformat=unix     		"设置文件格式
"set fileformats=unix,mac,dos    "设置文件格式

" 设置文件编码和文件格式
"set fenc=utf-8
"set encoding=utf-8
"set fileencodings=utf-8,gbk,cp936,latin-1
"set fileformat=unix

syntax enable                " 打开语法高亮
syntax on                    " 开启文件类型侦测
set backspace=2              " 设置退格键可用
set autoindent               " 自动对齐，继承前一行的缩进方式，适用于多行注释
set ai!                      " 设置自动缩进
set smartindent              " 智能自动缩进
set relativenumber           " 开启相对行号
set nu!                      " 显示行号
set ruler                    " 右下角显示光标位置的状态行
set incsearch                " 开启实时搜索功能
set hlsearch                 " 开启高亮显示结果
set nowrapscan               " 搜索到文件两端时不重新搜索
set nocompatible             " 关闭兼容模式
set hidden                   " 允许在有未保存的修改时切换缓冲区
set autochdir                " 设定文件浏览器目录为当前目录
set foldmethod=indent        " 选择代码折叠类型
set foldlevel=100            " 禁止自动折叠
set laststatus=2             " 开启状态栏信息
set cmdheight=2              " 命令行的高度，默认为1，这里设为2
set autoread                 " 当文件在外部被修改时自动更新该文件
set nobackup                 " 不生成备份文件
set noswapfile               " 不生成交换文件
set nrformats=               " 关闭八进制
set list                     " 显示特殊字符，其中Tab使用高亮~代替，尾部空白使用高亮点号代替
set listchars=tab:>-,trail:- "显示空格和tab键
set expandtab                " 将 Tab 自动转化成空格 [需要输入真正的 Tab 符时，使用 Ctrl+V + Tab]
set showmatch                " 显示括号配对情况
"winpos 0 0                  " 指定窗口出现的位置，坐标原点在屏幕左上角
"set lines=100 columns=110   " 指定窗口大小，lines 为高度，columns 为宽度
set guioptions+=c            " 使用字符提示框
set guioptions-=m            " 隐藏菜单栏
set guioptions-=T            " 隐藏工具栏
set guioptions-=L            " 隐藏左侧滚动条
set guioptions-=r            " 隐藏右侧滚动条
set guioptions-=b            " 隐藏底部滚动条
set showtabline=0            " 隐藏Tab栏
set cursorline               " 高亮突出当前行
set cursorcolumn             " 高亮突出当前列
set shiftwidth=4             " 设置Tab长度为4空格
set tabstop=4                " 设置自动缩进长度为4空格
set paste					 " 设置粘贴模式
set mouse=a 				 " 启用鼠标
set selection=exclusive      " 启用鼠标
set selectmode=mouse,key     " 启用鼠标

filetype plugin indent on      "检测文件类型
autocmd BufWritePost $MYVIMRC source $MYVIMRC   "让vimrc配置变更立即生效

if(has('win32') || has('win64'))    " 判断操作系统类型
    let g:isWIN = 1
    let g:isMAC = 0
else
    if system('uname') =~ 'Darwin'
        let g:isWIN = 0
        let g:isMAC = 1
    else
        let g:isWIN = 0
        let g:isMAC = 0
    endif
endif

" 判断是否处于 GUI 界面
if has('gui_running')
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

" 设置着色模式和字体
if g:isWIN
    colorscheme inkstained
    set guifont=Cascadia\ Code:h11.5
    "set guifont=Consolas:h14
    "set guifont=Monaco:h11
elseif g:isMAC
    colorscheme molokai
    set guifont=Monaco:h14
else
    colorscheme molokai
    set guifont=Monaco\ 11
endif

" 使用 vimdiff 时，长行自动换行
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

if g:isWIN
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
endif

" 启动时自动最大化窗口
if g:isWIN
 au GUIEnter * simalt ~x
endif



"#####################       安装插件               #########################



"启用底部主题   跟 'vim-airline/vim-airline'插件匹配
"let g:airline_theme='simple'
"let g:airline_theme='understated'

"let g:airline_theme='dracula'




function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction



call plug#begin()


" 添加底部状态栏
"Plug 'vim-airline/vim-airline'
"底部状态栏主题"
"Plug 'vim-airline/vim-airline-themes'
" 匹配HTML"
Plug 'mattn/emmet-vim'
" 
Plug 'sheerun/vim-polyglot'
" 主题管理插件
Plug 'itchyny/lightline.vim'


" 括号匹配
Plug 'jiangmiao/auto-pairs'
" 符号匹配
Plug 'junegunn/vim-easy-align'
" 安装NerdTree插件浏览文件
Plug 'preservim/nerdtree'

" 安装 Markdown预览插件
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
call plug#end()

