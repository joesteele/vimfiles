set nocompatible                  " Must come first because it changes other options.

runtime! autoload/pathogen.vim
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Normal line number
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set nowrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.
set textwidth=0
set colorcolumn=80

set list listchars=tab:\ \ ,trail:•

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=~/.vim/tmp,.  " Keep swap files in one location

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs

set cursorline

set title                         " Set the terminal's title

set gdefault                      " Default regexes to global
set laststatus=2


" From GRB's .vimrc - makes current window have a min size
set winwidth=84
set winminwidth=20
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
"set winheight=15
"set winminheight=15
"set winheight=999


" Remaps

" Remap leader to ','
let mapleader=","

" Use 'jj' to exit insert mode
inoremap jj <ESC>l

" Shift-Enter to exit from insert mode
inoremap <S-CR> <Esc>l

" Shift-j/k visual select line up/down
nnoremap <S-j> <S-v>j
nnoremap <S-k> <S-v>k
vnoremap <S-k> k

" Use tab to jump between do/end etc.
nnoremap <tab> %
vnoremap <tab> %

" Quicker command mode
"nnoremap ; :

" Hit esc to clear search highlights
nnoremap <silent> <esc> :noh<return><esc>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" resize vertical split window
nmap <C-Left> <C-W><<C-W><
nmap <C-Right> <C-W>><C-W>>
" resize horzontal split window
nmap <C-Up> <C-W>+<C-W>+
nmap <C-Down> <C-W>-<C-W>-

" Buffer navigation
nnoremap <Leader>r <C-^>

" Remove trailing whitespace
nnoremap <Leader>w :%s/\s\+$//<CR>

" TextMate indentation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Replace word with yanked word
nmap <Leader>o ciw<C-r>0<esc>
" Convenience for pasting last yanked word (not deletions)
nmap <Leader>p "0p<esc>

" Maxmize split
nmap <Leader>m <C-w>_<C-w>\|

" Appearance

set background=dark
"set background=light
"colorscheme ir_black
"colorscheme solarized
"colorscheme railscasts
"colorscheme fruity
colorscheme jellybeans
"colorscheme refactor
"colorscheme vividchalk
"colorscheme skittles_dark
"colorscheme candy
"colorscheme twilight
"colorscheme grb256
"colorscheme distinguished

hi Cursor guibg=white
hi Visual guibg=#333333 guifg=#EEEEEE
hi ColorColumn guibg=#222222

" SignColumn
hi SignColumn term=standout ctermfg=11 ctermbg=8 guifg=Cyan guibg=#666666
hi Error term=reverse ctermfg=15 ctermbg=12 gui=none guifg=#f26168 guibg=black
hi WarningMsg term=standout ctermfg=15 ctermbg=12 gui=bold guifg=#ffe296 guibg=black

" NERDTree colors

autocmd VimEnter * hi NERDTreeDir guifg=#eeeeee gui=bold
autocmd VimEnter * hi NERDTreeDirSlash guifg=#eeeeee
autocmd VimEnter * hi NERDTreeExecFile gui=none


" Misc

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif

  " Thorfile, Rakefile, Vagrantfile, Prawn and Gemfile are Ruby
  au BufRead,BufNewFile {Guardfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru,*.prawn} set ft=ruby

  " Bones files are javscript
  au BufRead,BufNewFile {json,*.bones} set ft=javascript
  "
  au BufRead,BufNewFile {*.tin} set ft=tintin

  " Java
  au FileType java setlocal ts=4 sts=4 sw=4 expandtab

  " Toggle relative vs absolute line numbers on insert
  autocmd InsertEnter * :set number
  autocmd InsertLeave * :set relativenumber
endif

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" NERDTree configuration
let NERDTreeIgnore=['\.DS_Store$', '\.pyc$', '\.rbc$', '\~$', '\.git$', '\.bundle$', '\.sass-cache$']
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" Command-T
let g:CommandTMaxHeight=20
let g:CommandTMatchWindowReverse=1
set wildignore+=*/node_modules/**

" RubyTest
map <Leader>s <Plug>RubyTestRun
map <Leader>S <Plug>RubyFileRun

" GitGutter
let g:gitgutter_enabled = 0
let g:gitgutter_highlight_lines = 1
let g:gitgutter_on_bufenter = 0
let g:gitgutter_all_on_focusgained = 0
map <Leader>gm :GitGutterToggle<return>
