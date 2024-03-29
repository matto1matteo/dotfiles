-- Colors patch
--[[ if vim.fn.empty("$TMUX") then
    if vim.fn.has("nvim") then
        -- For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        vim.g["$NVIM_TUI_ENABLE_TRUE_COLOR"] = 1
    end
    -- For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    -- Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    -- < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if vim.fn.has("termguicolors") then
        vim.otp.termguicolors = true
    end
end ]]

if vim.fn.exists('+termguicolors') then
    vim.g["&t_8f"] = '<Esc>[38;2;%lu;%lu;%lum'
    vim.g["&t_8b"] = '<Esc>[48;2;%lu;%lu;%lum'
    vim.opt.termguicolors = true
end
