set guicursor=          " Fix the cursor on terminal
set number              " Show the line numbers on the left side
set formatoptions+=o    " Continue comment marker on the left side
set expandtab           " Insert spaces when TAB is pressed
set tabstop=4           " Render TABs using this many spaces


nnoremap ; :


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
"syntax enable
set termguicolors
set background=light
colorscheme solarized

" Initialize plugin system
call plug#end()

" Plugin: deoplete
let g:deoplete#enable_at_startup = 1
