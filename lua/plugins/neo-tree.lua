-- Setup neo-tree - fs tree tool
return {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
                "nvim-lua/plenary.nvim",
                "MunifTanjim/nui.nvim",
                "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false, -- neo-tree will lazily load itself
        config = function()
                vim.keymap.set('n', '<F6>', ":Neotree filesystem reveal left<CR>")
                vim.keymap.set('n', '<C-t>', ":Neotree filesystem reveal left<CR>")
                vim.keymap.set('n', '<leader>t', ":Neotree filesystem reveal left<CR>")
        end
}
