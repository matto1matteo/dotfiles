local zsonGroup = vim.api.nvim_create_augroup("zson", {})
vim.api.nvim_create_autocmd(
    {"BufNew","BufNewFile","BufRead"},
    {
        pattern = {"*.zon"},
        callback = function (_)
            vim.opt.filetype = "zig"
        end,
        group = zsonGroup
    }
)
