-- Per theme style
vim.g.material_theme_style = 'darker'
vim.g.gruvbox_contrast_dark='medium'
vim.g.gruvbox_bold = 0
vim.g.gruvbox_italic = 1
vim.g.ayucolor = 'mirage'

-- General
vim.o.background = 'dark'
vim.cmd [[ colorscheme gruvbox ]]

require("indent_blankline").setup {
    buftype_exclude = {"terminal", "nvim"},
}
