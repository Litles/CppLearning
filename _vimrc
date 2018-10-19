set fileencodings=ucs-bom,utf-8,cp936,gb10830
"set encoding=utf-8
set termencoding=utf-8

set nocompatible
filetype off
source $VIMRUNTIME/mswin.vim
behave mswin

set rtp+=$VIM/vimfiles/bundle/vundle
let path='$VIM/vimfiles/bundle'
call vundle#begin('$VIM/vimfiles/bundle')

Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'		"树形浏览文件管理插件
"Plugin 'Valloric/YouCompleteMe'	"代码自动补全插件1
Plugin 'Raimondi/delimitMate'	"界定符补全插件
Plugin 'majutsushi/tagbar'		"标签侧边栏插件
Plugin 'scrooloose/syntastic'		"语法高亮插件
Plugin 'ervandew/supertab'		"代码补全插件4
"Plugin 'Shougo/neocomplete.vim'	"代码补全插件2
"Plugin 'roxma/vim-hug-neovim-rpc'
"Plugin 'roxma/nvim-yarp'
"Plugin 'Shougo/deoplete.nvim'	"代码补全插件3

call vundle#end()
filetype plugin indent on

"--------------------------------------------------------------------------
"deoplete插件
"call deoplete#enable()		"开启deoplete插件


"--------------------------------------------------------------------------
"【OmniCppComplete】
set nocp
filetype plugin on
" configure tags - add additional tags here or comment out not-used ones
set tags+=D:/ctags/tags/cpp
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0| pclose|endif
set completeopt=menuone,menu,longest,preview
highlight Pmenu	guibg=darkgrey	guifg=black
highlight PmenuSel	guibg=lightgrey	guifg=black
"------------------------------------------------------------------------------------

source $VIMRUNTIME/vimrc_example.vim
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

"---------------------------------------------------------------------------
"自定义设置
"---------------------------------------------------------------------------
colorscheme desert	"主题设置
set guioptions-=m	" 隐藏菜单栏
set guioptions-=T	"关闭上侧工具栏
set nu!				"显示行号
set wrap 		"设置自动换行
set autoindent	"开启自动缩进
set ts=4		"设置tab的跳数为4
set et			"编辑时将所有Tab替换为空格
set sw=4		"缩进尺寸为4个空格
set smarttab		"按一次backspace就删除4个空格
set noundofile		"不生成undo文件
set nobackup		"不生成备份文件
"解决菜单乱码
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"解决consle输出乱码
"language messages zh_CN.utf-8
"---------------------------------------------------------------------------
"调用编译程序，一键编译或运行
"---------------------------------------------------------------------------
"编译C语言代码
func! CompileGcc()
    exec "w"
    let compilecmd="!gcc "
    let compileflag="-o %< "
    if search("mpi\.h") != 0
        let compilecmd = "!mpicc "
    endif
    if search("glut\.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv\.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp\.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math\.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc
"编译C++代码
func! CompileGpp()
    exec "w"
    let compilecmd="!g++ "
    let compileflag="-o %< "
    if search("mpi\.h") != 0
        let compilecmd = "!mpic++ "
    endif
    if search("glut\.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv\.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp\.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math\.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc
"自动识别C语言或C++
func! CompileCode()
        exec "w"
        if &filetype == "cpp"
                exec "call CompileGpp()"
        elseif &filetype == "c"
                exec "call CompileGcc()"
        endif
endfunc
"运行程序
func! RunResult()
        exec "w"
        if search("mpi\.h") != 0
            exec "!mpirun -np 4 ./%<"
        elseif &filetype == "cpp"
            exec "! %<"
        elseif &filetype == "c"
            exec "! %<"
        elseif &filetype == "python"
            exec "call RunPython"
        elseif &filetype == "java"
            exec "!java %<"
        endif
endfunc
"编译快捷键
map <F5> :call CompileCode()<CR>
imap <F5> <ESC>:call CompileCode()<CR>
vmap <F5> <ESC>:call CompileCode()<CR>
"运行快捷键
map <F6> :call RunResult()<CR>
