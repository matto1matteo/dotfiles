vim.o.completeopt = "menuone,noinsert,noselect"
vim.g["completion_matching_strategy_list"] = {"exact", "substring", "fuzzy"}

-- Setup nvim-cmp
local lspkind = require("lspkind")

local cmp = require("cmp")
if cmp == nil then
    error("Something went wrong initializing cmp")
end
cmp.setup(
    {
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
            end
        },
        mapping = cmp.mapping.preset.insert(
            {
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-a>"] = cmp.mapping.complete(
                    {
                        config = {
                            sources = {
                                {name = "vsnip"}
                            }
                        }
                    }
                ),
                ["<C-e>"] = cmp.mapping.close(),
                ["<CR>"] = cmp.mapping.confirm()
            }
        ),
        formatting = {
            format = lspkind.cmp_format(
                {
                    mode = "text_symbol",
                    preset = "default"
                }
            )
        },
        sources = cmp.config.sources(
            {
                {name = "nvim_lua"},
                {name = "nvim_lsp"},
                {name = "vsnip"},
                {name = "path"}
            },
            {
                {name = "buffer"}
            }
        )
    }
)

--" Servers setup goes here alongside completion stuff
local lspconfig = require("lspconfig")

local bufmap = function(type, key, value)
    vim.api.nvim_buf_set_keymap(0, type, key, value, {noremap = true, silent = true})
end

-- function to attach completion when setting up lsp
local on_attach = function(_, bufnr)
    -- Goto
    bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
    bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
    bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
    bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
    bufmap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
    bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
    bufmap("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
    bufmap("n", "<leader>go", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
    bufmap("n", "<leader>gw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")

    -- Action
    bufmap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
    bufmap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
    --bufmap("n", "<leader>F", "<cmd>lua vim.lsp.buf.formatting()<CR>") -- Using formatter.nvim for now
    bufmap("n", "<leader>ai", "<cmd>lua vim.lsp.buf.incoming_calls()<CR>")
    bufmap("n", "<leader>ao", "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>")

    -- Diagnostic
    bufmap("n", "<leader>sd", "<cmd>lua vim.diagnostic.setloclist()<CR>")
    bufmap("n", "<leader>nd", "<cmd>lua vim.diagnostic.jump({count = 1})<CR>")
    bufmap("n", "<leader>pd", "<cmd>lua vim.diagnostic.jump({count = -1})<CR>")

    require("lsp_signature").on_attach(
        {
            bind = true,
            handler_opts = {
                border = "rounded"
            }
        },
        bufnr
    )
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- lspconfig.<server_name>.setup{ options } to run a server
-- Add server name to servers table
local servers = {
    "ts_ls",
    "gopls",
    -- "jedi_language_server",
    "pylsp",
    "rls",
    "clangd",
    -- "ccls",
    "cmake",
    "cssls",
    "svelte",
    -- "html",
    -- "emmet_ls",
    "dockerls",
    "zls",
    "gradle_ls",
    "kotlin_language_server"
}

local util = require("lspconfig/util")

local function find_python_path(_, config)
    local p
    if vim.env.VIRTUAL_ENV then
        p = table.concat({vim.env.VIRTUAL_ENV, "bin", "python3"})
    else
        p = util.find_cmd("python", "./venv/bin", config.root_dir)
    end
    config.settings.python.pythonPath = p
end

local pid = vim.fn.getpid()
lspconfig.omnisharp.setup(
    {
        cmd = {"omnisharp", "--languageserver", "--hostPID", tostring(pid)},
        on_attach = on_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
        handlers = {
            ["textDocument/definition"] = require("omnisharp_extended").handler
        }
    }
)

local default_capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server_name in ipairs(servers) do
    if server_name == "pylsp" then
        lspconfig[server_name].setup(
            {
                on_attach = on_attach,
                capabilities = default_capabilities,
                before_init = find_python_path
            }
        )
    elseif server_name == "ccls" then
        lspconfig[server_name].setup(
            {
                on_attach = on_attach,
                capabilities = default_capabilities,
                before_init = find_python_path,
                init_options = {
                    compilationDatabaseDirectory = "build"
                }
            }
        )
    elseif server_name == "emmet_ls" or server_name == "html" then
        lspconfig[server_name].setup(
            {
                on_attach = on_attach,
                capabilities = default_capabilities,
                filetypes = {"html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "template"}
            }
        )
    elseif server_name == "gradle_ls" then
        lspconfig[server_name].setup(
            {
                on_attach = on_attach,
                capabilities = default_capabilities,
                root_dir = lspconfig.util.root_pattern(
                    "settings.gradle",
                    "build.gradle",
                    "settings.gradle.kts",
                    "build.gradle.kts"
                )
            }
        )
    else
        lspconfig[server_name].setup(
            {
                on_attach = on_attach,
                capabilities = default_capabilities
            }
        )
    end

    if server_name == "tsserver" then
        lspconfig[server_name].filetypes = {"typescript", "typescriptreact", "typescript.tsx"}
    end
end

-- Lua language server protocol
lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = default_capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT"
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim"}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true)
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false
            }
        }
    }
}
