# Edwardtw92's Nvim Config (and Zathura)
The contents of this repository will eventually be moved to a repository with my other dotfiles, a link will be updated in the future. In addition, I am hoping to migrate my nvim config from Vimscript to Lua and from [vim-plug](https://github.com/junegunn/vim-plug) to [lazy.nvim](https://github.com/folke/flash.nvim)

![Screenshot](https://github.com/Edwardtw92/nvim_dotfile/blob/main/screenshot.jpg)

## LaTeX Essential
In order to have a working LaTeX environment, ensure [LaTeX](https://www.latex-project.org/get/), [Neovim](https://neovim.io/), a Neoivim Plugin manager (I am using [vim-plug](https://github.com/junegunn/vim-plug)), and a pdf viewer (I am using [Zathura](https://pwmt.org/projects/zathura/))are installed, and the only essential Neoivim plugins are:
- [vimtex](https://github.com/lervag/vimtex)
- [ultisnips](https://github.com/SirVer/ultisnips)
- [coc.nvim](https://github.com/neoclide/coc.nvim)
- [coc-vimtex](https://github.com/neoclide/coc-vimtex)
- [coc-highlight](https://github.com/neoclide/coc-highlight)
- [coc-snippets](https://github.com/neoclide/coc-snippets)
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

The following are recommended in the config:
```
set nocompatible
let mapleader=","
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

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
```

Note: Put Zathura directory in the parent directory of nvim (which should be something like ~/.config/)

## Utilities:
- [nerdtree](https://github.com/preservim/nerdtree)
- [leap.nvim](https://github.com/ggandor/leap.nvim) (can be replaced with [flash.nvim](https://github.com/folke/flash.nvim))
- [nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua)
- [Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [sleuth.vim](https://github.com/tpope/vim-sleuth)
Note: [vim-colemak](https://github.com/jooize/vim-colemak) and some other specific mappings in init.vim should only be used by Colemak layout users.

## Decorations:
- [vim-airline](https://github.com/vim-airline/vim-airline)
- [vim-airline-theme](https://github.com/vim-airline/vim-airline-themes)
- [vim-startify](https://github.com/mhinz/vim-startify)
- [rainbow](https://github.com/luochen1990/rainbow)
- [catppuccin](https://github.com/catppuccin/nvim)

## Inspiration
My set up are highly inspired by Gilles Castel's setup which can be found [here](https://castel.dev/post/lecture-notes-1/) and [here](https://github.com/gillescastel/latex-snippets)
