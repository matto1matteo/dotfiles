-- help at :h dap.txt
local ok, dap = pcall(require, "dap")

if not ok then
    error("Could not find nvim-dap")
end

local python = vim.fn.findfile("pytho", "./venv/bin")
if python == "" then
    python = "/usr/bin/python"
end
---@type table<string, dap.Adapter|dap.AdapterFactory>
local adapters = {
    ["debugpy"] = {
        type = "executable",
        command = python,
        args = {
            "-m",
            "debugpy.adapter"
        }
    },
    ["coreclr"] = {
        type = "executable",
        command = "netcoredbg",
        args = {
            "--interpreter=vscode"
        }
    }
}

for key, value in pairs(adapters) do
    dap.adapters[key] = value
end

---@type table<string, dap.Configuration[]>
local configurations = {
    ["python"] = {
        {
            type = "debugpy",
            request = "launch",
            name = "launch debugpy",
            program = function ()
                local cwd = vim.fn.getcwd() .. "/"
                local path = vim.fn.input({
                    prompt = "Path to executable (default: main.py): ",
                    default = cwd,
                    completion = "file"
                })
                if not path then
                    return dap.ABORT
                end
                if path == "" or path == cwd then
                    return cwd .. "main.py"
                end
                return path
            end,
            pythonPath = python
        }
    },
    ["cs"] = {
        {
            name = "launche - netcoredbg (aka coreclr)",
            type = "coreclr",
            request = "launch",
            program = function ()
                return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
            end
        }
    }
}

for k, v in pairs(configurations) do
    dap.configurations[k] = v
end
