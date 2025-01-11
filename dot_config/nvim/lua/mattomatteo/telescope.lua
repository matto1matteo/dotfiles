local telescope = require("telescope")

telescope.setup({
    defaults = {
        file_ignore_patterns = { "build/", "external", "zig-cache/" }
    }
})
