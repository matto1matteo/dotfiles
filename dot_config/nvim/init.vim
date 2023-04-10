set runtimepath+=~/.config/nvim,~/.vim/after,~/.vim
set packpath+=~/.config/nvim,~/.vim

lua require('mattomatteo.options')
lua require("mattomatteo.plugin")
lua require("mattomatteo.patches")
lua require('mattomatteo.appearance')
lua require('mattomatteo.lsp')
lua require('mattomatteo.vsnip')
lua require('mattomatteo.treesitter')
lua require('mattomatteo.formatter_settings')
lua require('mattomatteo.lualine_config')
lua require('mattomatteo.commenter_config')
lua require('mattomatteo.keybindings.keybindings')
lua require('mattomatteo.telescope')
lua require('mattomatteo.vimtex')


let g:go_fmt_command = "goimports"

