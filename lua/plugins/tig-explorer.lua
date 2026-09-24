return {
        'iberianpig/tig-explorer.vim',
        dependencies = { 'rbgrouleff/bclose.vim' },
        init = function()
                -- Customize internal Tig keymaps
                vim.g.tig_explorer_use_builtin_term = 1
                vim.g.tig_explorer_keymap_edit   = 'e'    -- Edit in current tab
                vim.g.tig_explorer_keymap_tabedit = 't'   -- Edit in new tab
                vim.g.tig_explorer_keymap_split  = 's'    -- Horizontal split
                vim.g.tig_explorer_keymap_vsplit = 'v'    -- Vertical split
        end,
        -- Use 'config' for your Neovim-level keymaps (launching Tig)
        config = function()
                vim.keymap.set('n', '<leader>tt', '<cmd>Tig<cr>', { desc = 'Tig: Show' })
                vim.keymap.set('n', '<leader>ts', '<cmd>TigStatus<cr>', { desc = 'Tig: Status' })
                vim.keymap.set('n', '<leader>tb', '<cmd>TigBlame<cr>', { desc = 'Tig: Blame' })
                vim.keymap.set('n', '<leader>tp', '<cmd>TigOpenProjectRootDir<cr>', { desc = 'Tig: Project Root' })
        end,
}
