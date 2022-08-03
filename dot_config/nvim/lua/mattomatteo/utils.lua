local M = {}
local cmd = vim.cmd

M.create_augrup = function (autocmds, name)
    cmd('augroup ' .. name)
    cmd('autocmd!')
    for _, autocmd in ipairs(autocmds) do
        cmd('autocmd ' .. table.concat(autocmd, ' '))
    end
    cmd('augroup END')
end

return M
