-- function that use the signature mode, lhs, rhs, options
local map = require("keybindings").map
-- Disable higlith after search by clicking <enter>
-- Had to remap couse <CR> was already mapped to next line
-- nnoremap <CR> :noh<CR>
map("n", "<CR>", ":noh<CR>", {noremap = true})

vim.g.mapleader = " "
vim.g.maplocalleader = "_"

map("n", "<C-p>", ":FZF<CR>", {noremap = true})

-- " Markdown remap
map("n", "<leader>P", "<Plug>MarkdownPreview")
map("n", "<leader>F", ":Format<CR>", {silent = true, noremap = true})

-- " Tab remap
map("n", "tn", ":tabnew<CR>")
map("n", "pt", "gT", {noremap = true})
map("n", "nt", "gt", {noremap = true})
