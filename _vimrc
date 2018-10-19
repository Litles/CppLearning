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
Plugin 'scrooloose/nerdtree'		"��������ļ�������
"Plugin 'Valloric/YouCompleteMe'	"�����Զ���ȫ���1
Plugin 'Raimondi/delimitMate'	"�綨����ȫ���
Plugin 'majutsushi/tagbar'		"��ǩ��������
Plugin 'scrooloose/syntastic'		"�﷨�������
Plugin 'ervandew/supertab'		"���벹ȫ���4
"Plugin 'Shougo/neocomplete.vim'	"���벹ȫ���2
"Plugin 'roxma/vim-hug-neovim-rpc'
"Plugin 'roxma/nvim-yarp'
"Plugin 'Shougo/deoplete.nvim'	"���벹ȫ���3

call vundle#end()
filetype plugin indent on

"--------------------------------------------------------------------------
"deoplete���
"call deoplete#enable()		"����deoplete���


"--------------------------------------------------------------------------
"��OmniCppComplete��
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
"�Զ�������
"---------------------------------------------------------------------------
colorscheme desert	"��������
set guioptions-=m	" ���ز˵���
set guioptions-=T	"�ر��ϲ๤����
set nu!				"��ʾ�к�
set wrap 		"�����Զ�����
set autoindent	"�����Զ�����
set ts=4		"����tab������Ϊ4
set et			"�༭ʱ������Tab�滻Ϊ�ո�
set sw=4		"�����ߴ�Ϊ4���ո�
set smarttab		"��һ��backspace��ɾ��4���ո�
set noundofile		"������undo�ļ�
set nobackup		"�����ɱ����ļ�
"����˵�����
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"���consle�������
"language messages zh_CN.utf-8
"---------------------------------------------------------------------------
"���ñ������һ�����������
"---------------------------------------------------------------------------
"����C���Դ���
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
"����C++����
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
"�Զ�ʶ��C���Ի�C++
func! CompileCode()
        exec "w"
        if &filetype == "cpp"
                exec "call CompileGpp()"
        elseif &filetype == "c"
                exec "call CompileGcc()"
        endif
endfunc
"���г���
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
"�����ݼ�
map <F5> :call CompileCode()<CR>
imap <F5> <ESC>:call CompileCode()<CR>
vmap <F5> <ESC>:call CompileCode()<CR>
"���п�ݼ�
map <F6> :call RunResult()<CR>
