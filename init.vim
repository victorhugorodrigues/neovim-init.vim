" TODO:
" copy block remap
" search inside files plugin
" jump to declaration plugin
" search declaration inside file plugin

set guicursor=          " Fix the cursor on terminal
set number              " Show the line numbers on the left side
set formatoptions+=o    " Continue comment marker on the left side
set expandtab           " Insert spaces when TAB is pressed
set tabstop=4           " Render TABs using this many spaces

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

