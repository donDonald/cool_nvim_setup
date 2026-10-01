require("basic-options")
require("help-view")
require("copy-paste")
require("quit")

-- Install lazy plugin manager
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
        print("No lazy found, clonning repository")
        vim.fn.system({
                "git",
                "clone",
                "https://github.com/folke/lazy.nvim.git",
                "--branch=stable",
                lazy_path
        })
        print("lazy, clonning repository - complete, check your ~/.local/share/nvim/lazy/")
else
        print("lazy already installed, check your ~/.local/share/nvim/lazy/")
end
vim.opt.rtp:prepend(lazy_path)

-- Toggle up Lazy plugin manager visibility
vim.keymap.set("n", "<F2>", function()
        if vim.bo.filetype == "lazy" then
                vim.cmd.close()
        else
                vim.cmd("Lazy home")
        end
end, { desc = "Toggle Lazy" })

-- Collecton of plugins to be loaded
require("lazy").setup("plugins")
