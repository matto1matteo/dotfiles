local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local ensure_packer = function()
  local fn = vim.fn
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(
    function(use)
        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        use("tmux-plugins/vim-tmux")

        -- Fuzzy finders
        use("nvim-lua/plenary.nvim")
        use("nvim-telescope/telescope.nvim")

        -- IDEditor like features)
        use("neovim/nvim-lspconfig")
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
        -- Toggle comment
        use("numToStr/Comment.nvim")
        -- to help nvim-lsp with kotlin
        use("udalov/kotlin-vim")
        use("mhartington/formatter.nvim")

        -- Auto completion plugin
        use({"hrsh7th/cmp-nvim-lsp", branch = "main"})
        use({"hrsh7th/cmp-buffer", branch = "main"})
        use({"hrsh7th/nvim-cmp", branch = "main"})
        use({"hrsh7th/cmp-nvim-lua", branch = "main"})
        use({"hrsh7th/cmp-path", branch = "main"})
        use("onsails/lspkind-nvim")
        use({"folke/lsp-colors.nvim", branch = "main"})

        -- DAP a.k.a debug adapters
        use('mfussenegger/nvim-dap')
        use({ "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} })
        use({"ldelossa/nvim-dap-projects", requires = {"mfussenegger/nvim-dap"} })

        -- Vsnip and cmp integration
        use({"hrsh7th/cmp-vsnip", branch = "main"})
        use("hrsh7th/vim-vsnip")
        use("hrsh7th/vim-vsnip-integ")
        use({"rafamadriz/friendly-snippets", branch = "main"})

        -- Better code highlighter
        use({"nvim-treesitter/nvim-treesitter", run = "<cmd>TSUpdate"})

        -- Themes and style
        use("morhetz/gruvbox")
        use("joshdick/onedark.vim")
        use("ayu-theme/ayu-vim")
        use({"kaicataldo/material.vim", branch = "main"})
        use("lukas-reineke/indent-blankline.nvim")

        -- Status line
        use("nvim-lualine/lualine.nvim")
        use("kyazdani42/nvim-web-devicons")

        -- Git integration
        use("tpope/vim-fugitive")

        -- Kitty config file
        use("fladson/vim-kitty")

        -- Markdown
        use({"iamcco/markdown-preview.nvim", run = "cd app && yarn install"})

        if packer_bootstrap then
            require("packer").sync()
        end
    end
)
