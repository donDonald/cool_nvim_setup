-- Expand TABs to spaces.
-- Indents will have a width of 8.
-- Sets the number of columns for a TAB.
vim.cmd("set expandtab");
vim.cmd("set tabstop=8");
vim.cmd("set shiftwidth=8");
vim.cmd("set softtabstop=8");

-- Setup line numbering
vim.cmd("set number relativenumber");
vim.cmd("set listchars=tab:>─,space:·");
vim.cmd("nnoremap <F2> :set list!<CR>");

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

-- Pop-up Lazy plugin manager, q - to quit
vim.cmd("nnoremap <F3> :Lazy<CR>");

-- Collecton of plugins to be loaded
local plugins = {
        {"catppuccin/nvim", name = "catppuccin", priority = 1000}
}
local opts = {}
require("lazy").setup(plugins, opts)

require("catppuccin").setup({
--    flavour = "latte", -- latte, frappe, macchiato, mocha
--    flavour = "frappe",
--    flavour = "macchiato",
      flavour = "mocha"
})
vim.cmd.colorscheme "catppuccin"
