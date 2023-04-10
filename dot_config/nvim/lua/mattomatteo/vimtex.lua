vim.g.tex_flavor = "latex"
vim.g.vimtex_compiler_latexmk = {
    build_dir = "",
    callback = 1,
    continuous = 1,
    executable = "latexmk",
    hooks = {},
    options = {
        "-shell-escape",
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode"
    }
}
