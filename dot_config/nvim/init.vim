set runtimepath+=~/.config/nvim,~/.vim/after,~/.vim
set packpath+=~/.config/nvim,~/.vim

lua require('options')
source ~/.config/nvim/plugin.vim
source ~/.config/nvim/patches.vim
lua require('appearance')
lua require('lsp')
lua require('vsnip')
lua require('treesitter')
lua require('formatter_settings')
lua require('lualine_config')
lua require('commenter_config')
lua require('keybindings/keybindings')


let g:go_fmt_command = "goimports"

