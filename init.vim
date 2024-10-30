call plug#begin("~/.vim/plugged")
" Plugin Section
" ===============================================
" VimTex
Plug 'lervag/vimtex'
"let g:vimtex_latexmk_progname= '/usr/bin/nvr'

" Snippets
Plug 'sirver/ultisnips'
"let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
let g:UltiSnipsExpandTrigger       = '<Tab>'    " use Tab to expand snippets
let g:UltiSnipsJumpForwardTrigger  = '<Tab>'    " use Tab to move forward through tabstops
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'  " use Shift-Tab to move backward through tabstops

" NeoVim status line
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 0
" let g:airline_section_x = '%{ScrollStatus()}'

" NeoVim status line theme
Plug 'vim-airline/vim-airline-themes'
" let g:airline_theme = 'tokyonight'
"let g:airline_theme = 'base16_dracula'
" let g:airline_theme = 'catppuccin'
let g:airline_theme = 'angr'

" Closing parenthesis
" Plug 'townk/vim-autoclose'

" surround
Plug 'tpope/vim-surround'

" autoclose
"Plug 'Raimondi/delimitMate'

" Themes
"Plug 'ghifarit53/tokyonight-vim'

" NeoVim start screen
Plug 'mhinz/vim-startify'

" Colemak remapping
Plug 'jooize/vim-colemak'


" NERDTree
Plug 'preservim/nerdtree'

" coc
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"coc-highlight
Plug 'neoclide/coc-highlight'
autocmd CursorHold * silent call CocActionAsync('highlight')

"coc-snippets
Plug 'neoclide/coc-snippets'

" Rainbow Bracket
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
" let g:parentheses_options: "containedin = math"

" leap
Plug 'ggandor/leap.nvim'
lua vim.keymap.set({'n', 'x', 'o'}, 'f', '<Plug>(leap-forward-to)')
lua vim.keymap.set({'n', 'x', 'o'}, 'F', '<Plug>(leap-backward-to)')
lua vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
lua vim.api.nvim_set_hl(0, 'Cursor', { reverse = true })
lua vim.api.nvim_create_augroup('LeapHighlights', { clear = true })
"lua vim.api.nvim_create_autocmd({ 'Colorscheme' }, { group = 'LeapHighlights', pattern = { '*' }, callback = function() lua vim.api.nvim_set_hl(0, 'LeapMatch', { fg = 'white', bold = true, nocombine = true }) lua vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = '#ff0000', bold=true, nocombine = true }) lua vim.api.nvim_set_hl(0, 'LeapLabelSecondary', { fg = '#ff0000', bold=true, nocombine = true }) })

" New Tokyo Night
Plug 'folke/tokyonight.nvim'

" Catppuccin
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

" Vim-Julia-Cell
" Plug 'jpalardy/vim-slime'
" Plug 'mroavi/vim-julia-cell', { 'for': 'julia' }

" Julia-Vim
Plug 'JuliaEditorSupport/julia-vim'

" tab bars
" https://github.com/romgrk/barbar.nvim
" Plug 'lewis6991/gitsigns.nvim' " OPTIONAL: for git status
Plug 'nvim-tree/nvim-web-devicons' " OPTIONAL: for file icons
" Plug 'romgrk/barbar.nvim'

Plug 'echasnovski/mini.indentscope'

Plug 'norcalli/nvim-colorizer.lua'

Plug 'numToStr/Comment.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'tpope/vim-sleuth'
"================================================
call plug#end()"Config Section

" Config Section
" ===============================================
set nocompatible
let mapleader=","
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

"------------------------------------------------------------------------------
" slime configuration 
"------------------------------------------------------------------------------
" let g:slime_target = "tmux"
" let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
" let g:slime_cell_delimiter = "```"
" let g:slime_dont_ask_default = 1

"------------------------------------------------------------------------------
" julia-cell configuration
"------------------------------------------------------------------------------
" Use '##' tags to define cells
let g:julia_cell_delimit_cells_by = 'tags'

" map <Leader>jr to run entire file
nnoremap <Leader>r :w<CR>:JuliaCellRun<CR>

" map <Leader>jc to execute the current cell
nnoremap <Leader>jc :JuliaCellExecuteCell<CR>

" map <Leader>jC to execute the current cell and jump to the next cell
nnoremap <Leader>jC :JuliaCellExecuteCellJump<CR>

" map <Leader>jl to clear Julia screen
nnoremap <Leader>jl :JuliaCellClear<CR>

" map <Leader>jp and <Leader>jn to jump to the previous and next cell header
nnoremap <Leader>jp :JuliaCellPrevCell<CR>
nnoremap <Leader>jn :JuliaCellNextCell<CR>

" map <Leader>je to execute the current line or current selection
" nmap <Leader>je <Plug>SlimeLineSend
" xmap <Leader>je <Plug>SlimeRegionSend


"VimTex
let g:tex_flavor='latex'
let g:vimtex_quickfix_enable = 1
let g:vimtex_quickfix_mode=0
let g:vimtex_matchparen_enabled = 0
filetype plugin indent on
syntax enable

let g:vimtex_view_method = 'zathura'

augroup vimtex
    autocmd!
    autocmd User VimtexEventView call b:vimtex.viewer.xdo_focus_vim()
augroup END

" let g:latex_view_general_options = shellescape('--synctex-forward "' . exepath(v:progpath) . ' --servername ' . v:servername . ' +{%lline} {%ffile}"')
" nnoremap <expr><buffer><silent> gb  ':!zathura --synctex-forward '.line(".").':'.col('.').':% ' . shellescape(g:latex#data[b:latex.id].out()) . ' >/dev/null<CR>'

" let g:vimtex_compiler_progname = 'latexmk'
"let g:vimtex_compiler_method = 'latexrun'
let maplocalleader = ","
"let g:vimtex_syntax_conceal = 1
" set conceallevel=2
"let g:vimtex_fold_manual = 1
" Syntax highlighting

"Ignore cases
:set ignorecase
:set smartcase

" Hybrid line numbers
:set number relativenumber
:set nu rnu
:set mouse=a

set nocursorcolumn
"set cursorline
set nocursorline
":set cursorcolumn
":set colorcolumn=80

noremap <Leader>s :update<CR>

" Theme
:set termguicolors

"=============================

" New theme
" colorscheme tokyonight-night
colorscheme catppuccin-mocha

" Jump out of parenthesis
" inoremap <C-Space> <C-o>A
" Jump outside '"({
"if !exists('g:AutoPairsShortcutJump')
"  let g:AutoPairsShortcutJump = '<C-Space>'
"endif


" Auto Complete
inoremap <silent><expr> <C-Space>
    \ coc#pum#visible() ? coc#pum#confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Copy and paste
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" UTF-8 support
set encoding=utf-8

" Yank to Clipboard
set clipboard=unnamedplus

" NERDTree remapping
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"nnoremap f <Plug>(leap-forward-to)
"==================================================================

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
" set expandtab

" set listchars=tab:--,space:·
set listchars=tab:--,space:·,lead:=,trail:=,nbsp:␣
set list


" Spell check
setlocal spell
set spelllang=en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Reload vim-colemak to remap any overridden keys
" silent! source "$HOME/.vim/bundle/vim-colemak/plugin/colemak.vim"
silent! source "$HOME/.vim/plugged/vim-colemak/plugin/colemak.vim"

lua require'colorizer'.setup()

lua require("catppuccin").setup { color_overrides = { mocha = { base = "#000000", mantle = "#000000", crust = "#000000" } } }

"lua require('Comment').setup()

lua << EOF
require('Comment').setup()
EOF
