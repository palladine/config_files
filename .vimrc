" 1. sudo pacman -S base-devel (для установки некоторых плагинов)
" 2. sudo pacman -S ctags
" 3. pip install pyflakes pep8 pylint
" 4. Plugins manager   git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" 5. yaourt -Sbb powerline-fonts-git  (шрифты для airline)


set nocompatible
filetype off

"-------------------------------------------------------------
"  Vundle plugins manager 
"-------------------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" После внесение необходимого плагина выполнить :PluginInstall
Plugin 'gmarik/Vundle.vim'

" --- ColorSchemas ---
Plugin 'chriskempson/vim-tomorrow-theme'

" --- Colorize ---
Plugin 'lilydjwg/colorizer'

"--- Term ---
Plugin 'rosenfeld/conque-term'

"--- Indent guides ---
Plugin 'nathanaelkane/vim-indent-guides'

"--- Git ---
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

"--- NerdTree ---
Plugin 'scrooloose/nerdtree'

"--- NerdCommenter ---
Plugin 'scrooloose/nerdcommenter'

"--- TagBar ---
Plugin 'majutsushi/tagbar'

"---AirLine---
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"--- Emmet ---
Plugin 'mattn/emmet-vim'

"--- Syntastic ---
"Plugin 'vim-syntastic/syntastic.git'

"--- Python ---
Plugin 'python-mode/python-mode'
"Plugin 'davidhalter/jedi-vim'

call vundle#end()

filetype on
filetype plugin on
filetype plugin indent on

"--- Theme, syntax, visualisation ---
syntax on
set t_Co=256
colorscheme Tomorrow-Night-Eighties
"colorscheme Tomorrow-Night
set fillchars=stl:\ ,stlnc:\ ,vert:│
set lines=50 columns=150
set shortmess+=I            " без стартового экрана
set title					" в заголовке имя и путь к файлу
set ruler
set number
set cursorcolumn
set linespace=1
set laststatus=2			" включить панель статуса

set statusline=[%n]\ %<%F\ %m%r%h%w\ %y\ [%{&ff}]\ [%{&fileencoding}]\ %=\ [%{&encoding}]\ \ \ ASCII:%3b\ \ \ Hex:\ 0x%2B\ \ \ Ln:%3l:%L\ \ \ Col:%3c

set showmode                " отображать режим в строке статуса

set pumheight=15

set showmatch               " показывать первую скобку после ввода второй

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=e               " табы как в консоли
set guioptions-=R
set guioptions-=L
set guioptions-=l
set guioptions-=v

set list
set listchars=tab:>·,trail:·,nbsp:·         " символ табуляции и пробела 

"--- Encoding ---
set enc=utf-8
set fileformat=unix
set fencs=utf-8

"--- Отступы / Tabulation ---
set autoindent
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4

"--- Мышь ---
set mouse=a
set mousemodel=popup
set ttymouse=xterm2
set mousehide

"--- Поиск ---
set incsearch				" поиск по мере набора слова
set hlsearch				" подсветка
set ignorecase				" поиск без учета регистра

" Сворачивание блоков кода "
set foldenable                  " включить фолдинг
set foldcolumn=3                " показать полосу фолдинга
set foldmethod=indent           " метод фолдинга на основе отступа
set foldlevel=9

"--- Scrolling ---
set scrolloff=3

"--- Backups / Swap ---
set nobackup
set nowritebackup
set noswapfile

"--- General ---
set updatetime=100
set completeopt-=preview
set backspace=indent,eol,start
set ttyfast
set visualbell
set history=200						" история команд
set nowrap							" не переносить длинные слова

set antialias
set modeline
set wildmenu

set autoread				" при изменении перечитать файл
set autochdir				" установить директорию открытого файла

"--- GUI --- 
if has("gui_running")
   set cursorline |
   set guicursor=a:hor11-Cursor |
   set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 12
endif

"--- Gitgutter ---
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
let g:gitgutter_override_sign_column_highlight = 1
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '*'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-*'
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1

"--- Emmet ---
let g:user_emmet_mode='a'                "enable all function in all mode.
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-z>'

"--- Indent guides ---
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guifg=#424242 guibg=#282828 ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guifg=#424242 guibg=#222222 ctermbg=4
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['nerdtree', 'tagbar']

" --- NerdTree ---
autocmd vimenter * NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.pyc$', '\.pyo$']
let g:NERDTreeWinPos = "left"          " отобразить слева
let g:NERDTreeShowFiles = 1            " показать файлы
let g:NERDTreeShowHidden = 1           " показать скрытые файлы
let g:NERDTreeWinSize = 30             " ширина
let g:NERDTreeMinimalUI = 1            " убрать ссылку на помощь
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
" let g:NERDTreeStatusline = ''

" --- NerdCommenter ---
" <leader> ----> '\'
" <leader>cc   - закоментировать выделенный блок
" <leader>cu   - расскоментировать выделенный блок
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" --- TagBar ---
autocmd vimenter * TagbarToggle
let g:tagbar_autofocus = 0
let g:tagbar_usearrows = 1
let g:tagbar_width = 30
let g:tagbar_compact = 1
let g:tagbar_indent = 1

" --- Airline ---
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_exclude_preview = 1
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_section_a = airline#section#create(['[%n] ', 'mode', 'paste', 'iminsert'])
let g:airline_section_z = airline#section#create(['Ln:%3l:%L Col:%2c'])

"--- ConqueTerm ---
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0

"--- Syntastic ---
"let g:syntastic_enable_signs=1
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_python_checkers = ['pylint']
"let g:syntastic_error_symbol = "E"
"let g:syntastic_warning_symbol = "W"


" --- Hot Keys ---
map <F7> :NERDTreeToggle<CR>

map <F8> :TagbarToggle<CR>

"Copy/Paste-------
map <C-c> "+y<CR>
map <C-v> "+p


nmap <F2> :w<CR>
vmap <F2> <ESC>:w<CR>
imap <F2> <ESC>:w<CR>a

nmap <F3> :new<CR>
vmap <F3> <ESC>:new<CR>
imap <F3> <ESC>:new<CR>

nmap <F4> :Ex<CR>
vmap <F4> <ESC>:Ex<CR>
imap <F4> <ESC>:Ex<CR>

nmap <F10> :q!<CR>
vmap <F10> <ESC>:q!<CR>
imap <F10> <ESC>:q!<CR>

" Выделение всего файла "
nmap <C-a> ggVG<CR>


" Разделение окна вертикально "
" Перемещение <Ctrl-w Ctrl-w> / <Ctrl-p Ctrl-p>"
nmap <C-n> :vsplit newfile<CR>
vmap <C-n> <ESC>:vsplit newfile<CR>
imap <C-n> <ESC>:vsplit newfile<CR>
set splitright

"Tabs ----------------------"
" Чтобы работали стрелки положить это в .Xdefaults
"URxvt*keysym.Control-Up:      \033[1;5A
"URxvt*keysym.Control-Down:    \033[1;5B
"URxvt*keysym.Control-Left:    \033[1;5D
"URxvt*keysym.Control-Right:   \033[1;5C

nmap <C-t> :tabnew<CR>
vmap <C-t> <ESC>:tabnew<CR>
imap <C-t> <ESC>:tabnew<CR>

nmap <C-Down> :tabprevious<CR>
vmap <C-Down> <ESC>:tabprevious<CR>
imap <C-Down> <ESC>:tabprevious<CR>

nmap <C-Up> :tabnext<CR>
vmap <C-Up> <ESC>:tabnext<CR>
imap <C-Up> <ESC>:tabnext<CR>


" Buffers "
nmap <C-d> :bd<CR>        " закрытие буфера - окно остается
vmap <C-d> <ESC>:bd<CR>
imap <C-d> <ESC>:bd<CR>

nmap <C-Left> :bp<CR>
vmap <C-Left> <ESC>:bp<CR>
imap <C-Left> <ESC>:bp<CR>

nmap <C-Right> :bn<CR>
vmap <C-Right> <ESC>:bn<CR>
imap <C-Right> <ESC>:bn<CR>

" ConqueTerm
"запуск интерпретатора на F5
nnoremap <F5> :ConqueTermVSplit ipython<CR>
"debug-mode на <F6>
nnoremap <F6> :exe "ConqueTermVSplit ipython " . expand("%")<CR>


"Python compiler "
nmap <F9> :!python %<CR>
vmap <F9> <ESC>:!python %<CR>
imap <F9> <ESC>:!python %<CR>



" Python-mode
" Включаем библиотеку Rope
let g:pymode_rope = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
"let g:pymode_rope_comletion_bind = '<C-Space>'
let g:pymode_python = 'python3'
let g:pymode_indent = 1
" Включаем linting
let g:pymode_lint = 1
" Какие ошибки подсвечивать
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore = "E501,E305,W391"
let g:pymode_lint_on_write = 1
let g:pymode_lint_unmodified = 1
let g:pymode_lint_on_fly = 1         " проверка на ошибки на лету

let g:pymode_lint_message = 1        " показывать сообщения по мышкой
" Отключаем надоедливое окно, отображающее ошибки и предупреждения
let g:pymode_lint_cwindow = 0
let g:pymode_lint_signs = 1
let g:pymode_lint_todo_symbol = 'W'
let g:pymode_lint_comment_symbol = 'C'
let g:pymode_lint_visual_symbol = 'R'
let g:pymode_lint_error_symbol = 'E'
let g:pymode_lint_info_symbol = 'I'
let g:pymode_lint_pyflakes_symbol = 'F'
let g:pymode_lint_sort = ['E','W','C','I']

" Включаем поддержку virtualenv
let g:pymode_virtualenv = 1
" Подсветка синтаксиса и ошибок
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" Включаем фолдинг
let g:pymode_folding = 1
" Загружаем плагин для вставки брейкпоинтов
let g:pymode_breakpoint = 1
" По leader + e будет устанавливаться брейкпоинт
"let g:pymode_breakpoint_key = '<leader>e'
