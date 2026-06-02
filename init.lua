-- Expand TABs to spaces.
-- Indents will have a width of 8.
-- Sets the number of columns for a TAB.
vim.cmd("set expandtab");
vim.cmd("set tabstop=8");
vim.cmd("set shiftwidth=8");
vim.cmd("set softtabstop=8");
vim.g.mapleader = " "

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
        {"catppuccin/nvim", name = "catppuccin", priority = 1000}, -- Coloar scheme plugin
        { -- Telescopte - fuzzy search tool
                'nvim-telescope/telescope.nvim', tag = '0.1.8',
                dependencies = {'nvim-lua/plenary.nvim'}
        }
}
local opts = {}
require("lazy").setup(plugins, opts)

-- Select desired color scheme here
require("catppuccin").setup({
--    flavour = "latte",
--    flavour = "frappe",
--    flavour = "macchiato",
      flavour = "mocha"
})
vim.cmd.colorscheme "catppuccin"




-- Have to install ripgrep onto host
-- sudo apt install ripgrep
local builtin = require("telescope.builtin")

vim.keymap.set('n', '<F4>', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', builtin.find_files, {})


vim.keymap.set('n', '<F5>', builtin.live_grep, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
