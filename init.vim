" TODO:
" copy block remap

set guicursor=          " Fix the cursor on terminal
set number              " Show the line numbers on the left side
set formatoptions+=o    " Continue comment marker on the left side
set expandtab           " Insert spaces when TAB is pressed
set tabstop=4           " Render TABs using this many spaces
set colorcolumn=79      " Render vertical line at 79 char space

" Remapping command shortkey
nnoremap ; :

" Remaping Leader key
let mapleader="\<SPACE>"

" Remapping page down and page up
map m <C-f>
map , <C-b>


" Open file menu
nnoremap <Leader>r :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>


" Remapping next, previous and close tab
map <C-k> :bnext<CR>
map <C-j> :bprevious<CR>
map <Leader>q :bdelete<CR>


" Remapping ctags navigation
map <C-l> <C-]>
map <C-h> <C-t>


" Remapping Ctrl-Space for completions. Heck Yeah!
" inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<Down>"
" inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<Up>"
" inoremap <expr><C-l> pumvisible() ? "\<C-y>" : "\<C-l>"


" Remapping deoplete auto complete to use TAB
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" Removing preview-window on omnicompletion
:set completeopt-=preview


"Remapping search tags on current buffer
nnoremap <Leader>o :CtrlPBufTag<CR>


" Remapping autocomplete
inoremap <C-space> <C-x><C-o>


" Remapping Ack search
nnoremap <Leader>h :Ack!<Space>
nnoremap <Leader>w :ccl<CR>


" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/


" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')


" Plugin: deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif


" Plugin: deoplete-jedi
Plug 'zchee/deoplete-jedi'


" Plugin: solarized
" syntax enable
set termguicolors
set background=light
colorscheme solarized


" Plugin: CtrlP
set runtimepath^=~/.config/nvim/bundle/ctrlp.vim


" Plugin: Airline
Plug 'vim-airline/vim-airline'


" Plugin: Airline-themes
Plug 'vim-airline/vim-airline-themes'


" Plugin: Airline - configs
let g:airline#extensions#tabline#enabled = 2
let g:airline_theme= 'light'


" Plugin: vim-fugitive
Plug 'tpope/vim-fugitive'


" Plugin: vim-commentary
Plug 'tpope/vim-commentary'


" Plugin: vim-gutentags
" Plug 'ludovicchabant/vim-gutentags'


" Plugin: craigemery/vim-autotag
Plug 'craigemery/vim-autotag'


" Plugin: Valloric/YouCompleteMe
" Plug 'Valloric/YouCompleteMe'


" Plugin: 'mileszs/ack.vim'
Plug 'mileszs/ack.vim'


" Initialize plugin system
call plug#end()

" Plugin: deoplete
let g:deoplete#enable_at_startup = 2

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Plugin Airline config
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.space = "\ua0"


" Config open new buffer with unsaved one
" fun! SPLITAG() range
  " let oldfile=expand("%:p")
  " if &modified
    " split
  " endif
  " exe "tag ". expand("<cword>")
  " let curfile=expand("%:p")
  " if curfile == oldfile
    " let pos=getpos(".")
    " if &modified
      " if we have split before:
      " " quit
    " endif
    " call setpos('.', pos)
  " endif
" endfun
" nmap <C-]> :call SPLITAG()<CR>z.

filetype plugin on
set omnifunc=syntaxcomplete#Complete

let g:min_pattern_length = 1
let g:deoplete#enable_ignore_case = 'ignorecase'
let g:deoplete#auto_completion_start_length = 0

let g:ack_default_options = " --ignore-dir=.tox --ignore-dir=.testrepository --ignore-dir=.eggs --ignore-dir=.vscode --ignore-dir=doc --ignore-file=is:tags --ignore-file=is:redfish.log"
