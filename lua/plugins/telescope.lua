-- Setup telescope - find and grep tool
-- Have to install ripgrep onto host
-- sudo apt install ripgrep

return { 
        -- find and grep search tool
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.8',
        dependencies = {'nvim-lua/plenary.nvim'},
        config = function()
                local builtin = require("telescope.builtin")

                vim.keymap.set('n', '<F5>', builtin.find_files, {})
                vim.keymap.set('n', '<leader>f', builtin.find_files, {})

                vim.keymap.set('n', '<F6>', builtin.live_grep, {})
                vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
        end
}
