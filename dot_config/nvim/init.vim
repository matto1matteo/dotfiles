set runtimepath+=~/.config/nvim,~/.vim/after,~/.vim
set packpath+=~/.config/nvim,~/.vim

source ~/.config/nvim/common.vim
source ~/.config/nvim/plugin.vim
source ~/.config/nvim/patches.vim
lua require('appearance')
lua require('lsp')
lua require('vsnip')
lua require('treesitter')
lua require('formatter_settings')
lua require('lualine_config')

source ~/.config/nvim/keybindings.vim

let g:go_fmt_command = "goimports"

