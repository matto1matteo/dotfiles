local status, commenter = pcall(require, "Comment")

if not status then
  vim.notify("Error retrieving Comment.nvim")
  return
end

commenter.setup({
    toggler = {
        line = 'glc',
        block = 'gbc'
    },
    opleader = {
        line = 'gl',
        block = 'gb'
    }
})
