local function ensure_packer()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(install_path) > 0 then
        vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
        vim.cmd([[packadd packer.nvim]])
        return true
    end

    return false
end
local must_bootstrap = ensure_packer()

return require("packer").startup(
    ---Function used to install plugins
    ---@param use function
    function(use)
        -- include packer for non bootstraping situation
        use("wbthomason/packer.nvim")

        use("tmux-plugins/vim-tmux")

        -- Fuzzy finders
        use("nvim-lua/plenary.nvim")
        use("nvim-telescope/telescope.nvim")

        -- IDEditor like features)
        use("neovim/nvim-lspconfig")
        use({"mfussenegger/nvim-dap"})
        -- Tex code completer, probably want to switch to coc-vimtex
        use(
            {
                "lervag/vimtex",
                ft = {"tex", "bib"},
                config = function()
                    require("mattomatteo.vimtex")
                end
            }
        )
        use({"ray-x/lsp_signature.nvim", branch = "master"})
        -- Toggle comment
        use("numToStr/Comment.nvim")
        use("mhartington/formatter.nvim")

        -- Auto completion plugin
        use({"hrsh7th/cmp-nvim-lsp", branch = "main"})
        use({"hrsh7th/cmp-buffer", branch = "main"})
        use({"hrsh7th/nvim-cmp", branch = "main"})
        use({"hrsh7th/cmp-nvim-lua", branch = "main"})
        use({"hrsh7th/cmp-path", branch = "main"})
        use("onsails/lspkind-nvim")
        use({"folke/lsp-colors.nvim", branch = "main"})
        -- use({"Hoffs/omnisharp-extended-lsp.nvim"})
        use(
            {
                "luckasRanarison/tailwind-tools.nvim",
                as = "tailwind-tools",
                run = ":UpdateRemotePlugins",
                dependencies = {
                    "nvim-treesitter/nvim-treesitter",
                    "nvim-telescope/telescope.nvim", -- optional
                    "neovim/nvim-lspconfig" -- optional
                }
            }
        )

        -- Vsnip and cmp integration
        use({"hrsh7th/cmp-vsnip", branch = "main"})
        use("hrsh7th/vim-vsnip")
        use("hrsh7th/vim-vsnip-integ")
        use({"rafamadriz/friendly-snippets", branch = "main"})
        -- use("mattn/emmet-vim")

        -- Better code highlighter
        use({"nvim-treesitter/nvim-treesitter", run = "<cmd>TSUpdate"})

        -- Themes and style
        use("morhetz/gruvbox")
        use("doums/darcula")
        use({"rebelot/kanagawa.nvim"})
        -- use("joshdick/onedark.vim")
        use("ayu-theme/ayu-vim")
        use("rktjmp/lush.nvim")
        use("metalelf0/jellybeans-nvim")
        use({"kaicataldo/material.vim", branch = "main"})
        use("ryanoasis/vim-devicons")
        use("lukas-reineke/indent-blankline.nvim")

        -- Status line
        use("nvim-lualine/lualine.nvim")
        use("kyazdani42/nvim-web-devicons")

        -- Git integration
        use("tpope/vim-fugitive")

        -- Syntax highlighter
        use("posva/vim-vue") -- Vue syntax integration
        use("HerringtonDarkholme/yats.vim") -- TS syntax highlight
        use(
            {
                "evanleck/vim-svelte",
                branch = "main",
                config = require("mattomatteo.svelte"),
                ft = {"svelte"}
            }
        ) -- Svelte syntax highlight
        use("tikhomirov/vim-glsl")
        -- Kitty config file
        use("fladson/vim-kitty")

        -- to help nvim-lsp with kotlin
        use("udalov/kotlin-vim")

        -- Markdown
        use({"iamcco/markdown-preview.nvim", run = "cd app && yarn install"})

        if must_bootstrap then
            require("packer").sync()
        end
    end
)
