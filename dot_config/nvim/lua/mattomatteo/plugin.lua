vim.cmd([[
call plug#begin('~/.vim/plugged')

"  Support for tmux config highlits
Plug 'tmux-plugins/vim-tmux'

" Fuzzy finders
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" IDEditor like features
Plug 'neovim/nvim-lspconfig'
Plug 'lervag/vimtex' " Tex code completer, probably want to switch to coc-vimtex
Plug 'numToStr/Comment.nvim' " Toggle comment
Plug 'udalov/kotlin-vim' " to help nvim-lsp with kotlin
Plug 'mhartington/formatter.nvim'

" Auto completion plugin
Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
Plug 'hrsh7th/cmp-nvim-lua', {'branch': 'main'}
Plug 'hrsh7th/cmp-path', {'branch': 'main'}
Plug 'onsails/lspkind-nvim'
Plug 'folke/lsp-colors.nvim', {'branch': 'main'}

" Vsnip and cmp integration
Plug 'hrsh7th/cmp-vsnip', {'branch': 'main'}
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets', {'branch': 'main'}
Plug 'mattn/emmet-vim'

" Better code highlighter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Themes and style
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'ryanoasis/vim-devicons'
Plug 'lukas-reineke/indent-blankline.nvim'

" Status line
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Git integration
Plug 'tpope/vim-fugitive'

" Syntax highlighter
Plug 'posva/vim-vue' " Vue syntax integration
Plug 'HerringtonDarkholme/yats.vim' " TS syntax highlight
Plug 'evanleck/vim-svelte', {'branch': 'main'} " Svelte syntax highlight
Plug 'tikhomirov/vim-glsl'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()
]])

vim.g.tex_flavor = "latex"
vim.g.vimtex_compiler_latexmk = {
    build_dir = "",
    callback = 1,
    continuous = 1,
    executable = "latexmk",
    hooks = {},
    options = {
        "-shell-escape",
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode"
    }
}
vim.g.svelte_preprocessor_tags = {
    {name = "ts", tag = "script", as = "typescript"}
}
vim.g.svelte_preprocessors = {"typescript", "ts"}
