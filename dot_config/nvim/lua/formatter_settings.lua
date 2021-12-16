require("formatter").setup(
  {
    filetype = {
      cpp = {
        -- clang-format
        function()
          return {
            exe = "clang-format",
            args = {"-style=file", "--fallback-style=WebKit", "--assume-filename", vim.api.nvim_buf_get_name(0)},
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
            args = {"--indent-count", 2, "--stdin"},
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
        }
    }
  }
)
