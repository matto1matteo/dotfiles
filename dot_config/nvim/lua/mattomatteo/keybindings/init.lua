local M = {}

---Nvim map shorcut
---@param mode string map mode
---@param lhs string `left hand side`, meaning the retrieved keystrokes
---@param rhs function | string `right hand side`, the command to be executed
---@param opts table | nil table of options for the command
function M.map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

return M
