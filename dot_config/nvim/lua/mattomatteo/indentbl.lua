local status, ibl = pcall(require, "ibl")

if not status then
    print("Error while loading indent-blankline")
    print("Exiting")
    return
end

ibl.setup({
    exclude = {
        buftypes= {"terminal", "nvim"}
    }
})
