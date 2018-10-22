set nocompatible
filetype on
source $VIMRUNTIME/mswin.vim
behave mswin
"set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,gb2312,gb18030,big5,latin1
set fileencoding=ansi
"set termencoding=utf-8
"===============================================
"                 ԭʼ����
"===============================================
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
"===============================================
"                �Զ�������
"===============================================
"����˵�����
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"���consle�������
"language messages zh_CN.utf-8

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
"===============================================
"                Vim���
"===============================================
filetype plugin indent on
filetype plugin on
set rtp+=$VIM/vimfiles/bundle/vundle
let path='$VIM/vimfiles/bundle'
call vundle#begin('$VIM/vimfiles/bundle')	"���ò��
"��vundle�����������
Plugin 'gmarik/vundle'

"��NERDTree������������ļ���
Plugin 'scrooloose/nerdtree'

"��delimitMate�����綨����ȫ��
Plugin 'Raimondi/delimitMate'

"��tagbar������ǩ�������
Plugin 'majutsushi/tagbar'

"��Syntastic�����﷨������
Plugin 'scrooloose/syntastic'

"��SuperTab�������벹ȫ��
Plugin 'ervandew/supertab'

"��YouCompleteMe�������벹ȫ��
"Plugin 'Valloric/YouCompleteMe'

"��Neocomplete�������벹ȫ��
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'roxma/vim-hug-neovim-rpc'
"Plugin 'roxma/nvim-yarp'

"��Deoplete�������벹ȫ��
"Plugin 'Shougo/deoplete.nvim'
"call deoplete#enable()	"����deoplete���

"��OmniCppComplete�������벹ȫ��
"OmniCppComplete
set tags+=D:\ctags\tags\tags		"���õ���ָ��tag
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>	"����tag
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
"set completeopt=menuone,menu,longest,preview
"highlight Pmenu	guibg=darkgrey	guifg=black
"highlight PmenuSel	guibg=lightgrey	guifg=black

call vundle#end()	"�������
"===============================================
"                    ����
"===============================================
"--------��ݼ�---------
"�����ݼ�
map <F5> :call CompileCode()<CR>
imap <F5> <ESC>:call CompileCode()<CR>
vmap <F5> <ESC>:call CompileCode()<CR>
"���п�ݼ�
map <F6> :call RunResult()<CR>
"-----���������--------
"�Զ�ʶ��C���Ի�C++
func! CompileCode()
        exec "w"
        if &filetype == "cpp"
                exec "call CompileGpp()"
        elseif &filetype == "c"
                exec "call CompileGcc()"
        endif
endfunc
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
