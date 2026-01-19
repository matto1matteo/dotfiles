local ok, key = pcall(require, "mattomatteo.keybindings")
local map = key.map

if not ok then
    error("keybindings utilities not found")
end
local dap
ok, dap = pcall(require, "dap")
if not ok then
    error("dap module not found")
end

map("n", "<F8>", function ()
    dap.repl.toggle(
        {
            height = 10,
            width = 1
        },
        "below split"
    )
end)
map("n", "<F9>", function () dap.toggle_breakpoint() end)
map("n", "<F5>", function () dap.continue() end)
map("n", "<F6>", function () dap.terminate() end)
map("n", "<F10>", function () dap.step_over() end)
map("n", "<F11>", function () dap.step_into() end)
map("n", "<F12>", function () dap.step_out() end)
