vim.o.completeopt = "menuone,noinsert,noselect"
vim.g["completion_matching_strategy_list"] = {"exact", "substring", "fuzzy"}

-- Setup nvim-cmp
local lspkind = require("lspkind")


local cmp = require("cmp")
cmp.setup(
    {
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
            end
        },
        mapping = {
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-a>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm()
        },
        formatting = {
            format = lspkind.cmp_format(
                {
                    mode = "text_symbol",
                    preset = "default"
                }
            )
        },
        sources = {
            {name = "nvim_lua"},
            {name = "nvim_lsp"},
            {name = "vsnip"},
            {name = "path"},
            {name = "buffer"}
        }
    }
)

--" Servers setup goes here alongside completion stuff
local lspconfig = require("lspconfig")

local bufmap = function(type, key, value)
    vim.api.nvim_buf_set_keymap(0, type, key, value, {noremap = true, silent = true})
end

-- function to attach completion when setting up lsp
local on_attach = function()
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
    bufmap("n", "<leader>sd", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
    bufmap("n", "<leader>nd", "<cmd>lua vim.diagnostic.goto_next()<CR>")
    bufmap("n", "<leader>pd", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- lspconfig.<server_name>.setup{ options } to run a server
-- Add server name to servers table
local servers = {
    "tsserver",
    "gopls",
    -- "jedi_language_server",
    "pylsp",
    "rls",
    "clangd",
    "cmake",
    "texlab",
    "kotlin_language_server",
    "vuels",
    "cssls",
    "metals",
}

local util = require("lspconfig/util")

local path = util.path
local function find_python_path(_, config)
    local p
    if vim.env.VIRTUAL_ENV then
        p = path.join(vim.env.VIRTUAL_ENV, "bin", "python3")
    else
        p = util.find_cmd("python", "./venv/bin", config.root_dir)
    end
    config.settings.python.pythonPath = p
end


for _, server_name in ipairs(servers) do
    if server_name == "pylsp" then
        lspconfig[server_name].setup(
            {
                on_attach = on_attach,
                capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
                before_init = find_python_path
            }
        )
    else
        lspconfig[server_name].setup(
            {
                on_attach = on_attach,
                capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
            }
        )
    end
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = "/usr/lib/lua-language-server"
local sumneko_binary = "/usr/bin/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = runtime_path
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
            telemetry = {enable = false}
        }
    }
}

--[[ local configs = require("lspconfig/configs")
local lsp_util = require("lspconfig/util")
if not lspconfig.glslls then
    configs.glslls = {
        default_config = {
            cmd = {"glslls", "--stdin"},
            filetypes = {"glsl", "vert", "frag"},
            root_dir = lsp_util.find_git_ancestor,
            single_file_support = true
        }
    }
end

lspconfig.glslls.setup(
    {
        on_attach = on_attach,
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
) ]]
