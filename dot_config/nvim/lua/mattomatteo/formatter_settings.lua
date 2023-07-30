require("formatter").setup(
    {
        filetype = {
            cs = {
                function()
                    return {
                        exe = "dotnet format",
                        args = {
                            "style",
                            "--include",
                            vim.api.nvim_buf_get_name(0)
                        },
                        stdin = false,
                    }
                end
            },
            cpp = {
                -- clang-format
                function()
                    return {
                        exe = "clang-format",
                        args = {
                            "-style=file",
                            "--fallback-style=WebKit",
                            "--assume-filename",
                            vim.api.nvim_buf_get_name(0)
                        },
                        stdin = true,
                        cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
                    }
                end
            },
            cmake = {
                function()
                    return {
                        exe = "cmake-format",
                        stdin = true,
                        cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
                    }
                end
            },
            lua = {
                -- luafmt
                function()
                    return {
                        exe = "luafmt",
                        args = {"--stdin"},
                        stdin = true
                    }
                end
            },
            kotlin = {
                function()
                    return {
                        exe = "ktlint",
                        args = {"-F"},
                        stdin = false
                    }
                end
            },
            go = {
                function()
                    return {
                        exe = "gofmt",
                        args = {vim.api.nvim_buf_get_name(0)},
                        stdin = true
                    }
                end
            },
            python = {
                function()
                    return {
                        exe = "black",
                        args = {"-", "-l", "79"},
                        stdin = true
                    }
                end
            },
            vue = {
                function()
                    return {
                        exe = "prettier",
                        args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
                        stdin = true
                    }
                end
            },
        }
    }
)
