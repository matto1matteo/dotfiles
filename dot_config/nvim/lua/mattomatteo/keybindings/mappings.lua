local map = require("mattomatteo.keybindings").map
-- Disable higlith after search by clicking <enter>
-- Had to remap couse <CR> was already mapped to next line
-- nnoremap <CR> :noh<CR>
map("n", "<CR>", "<cmd>noh<CR>", {noremap = true})

vim.g.mapleader = " "
vim.g.maplocalleader = "_"

map("n", "<C-p>", "<cmd>Telescope find_files<CR>", {noremap = true})

-- " Markdown remap
map("n", "<leader>P", "<Plug>MarkdownPreview")
map("n", "<leader>F", "<cmd>Format<CR>", {silent = true, noremap = true})

-- " Tab remap
map("n", "tn", "<cmd>tabnew<CR>")
map("n", "pt", "gT", {noremap = true})
map("n", "nt", "gt", {noremap = true})
map("n", "<leader>e", "<cmd>exe 'Explore' getcwd()<CR>", {noremap = true})
map("", "<Leader>k", function ()
    require("lsp_signature").toggle_float_win()
end, {silent = true, noremap = true})

map("n", "<leader>rl", function()
    vim.cmd([[messages clear]])
    print("sourcing " .. vim.api.nvim_buf_get_name(0))
    vim.cmd("source %")
    vim.cmd("message")
end)
map("n", "<leader>l", "<cmd>ll<cr>")
map("n", "<leader>q", "<cmd>cc<cr>")
