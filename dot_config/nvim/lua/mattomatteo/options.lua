vim.cmd([[
syntax enable
]])

local signcolumn
if vim.fn.has("patch-8.1.1564") then
    signcolumn = "yes"
else
    signcolumn =  "no"
end

local options = {
    signcolumn = signcolumn,
    -- Give more space for displaying messages.
    cmdheight=2,

    -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    -- delays and poor user experience.
    updatetime=300,
    errorbells = false,
    number = true,
    showcmd = true,
    cursorline = true,
    -- Default editor style
    -- vim.opt.t_Co=256
    laststatus = 2,
    tabstop = 4,
    shiftwidth = 4,
    smarttab = true,
    expandtab = true, --  Tab width for tab and space
    showmatch = true,
    relativenumber = true,
    -- colorcolumn = {80},
    guicursor = ""
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

local globals = {
    -- netrw_keepdir = 0,
    netrw_localcopydircmd = "cp -r",
    netrw_liststyle = 3
}

for k, v in pairs(globals) do
    vim.g[k] = v
end
