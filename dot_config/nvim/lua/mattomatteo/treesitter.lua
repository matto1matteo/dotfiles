require("nvim-treesitter.configs").setup {
    modules = {},
    auto_install = true,
    -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = {
        "go",
        "lua",
        "vim",
        "cpp",
        "bash",
        "html",
        "json",
        "python",
        "scss",
        "css",
        "svelte",
        "typescript",
        "javascript",
        "yaml",
        "markdown",
        "zig"
    },
    --ignore_install = { "javascript" }, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
        --disable = { "c", "rust" },  -- list of language that will be disabled
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false
    },
    indent = {
        enable = true
    },
    ignore_install = {},
    sync_install = false
}
