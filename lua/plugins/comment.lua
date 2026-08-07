return {
        -- color scheme plugin
        "numToStr/Comment.nvim",
        opts = {
                ---Add a space b/w comment and the line
                padding = true,
                ---Whether the cursor should stay at its position
                sticky = true,
                ---Lines to be ignored while (un)comment
                ignore = nil,
                ---LHS of toggle mappings in NORMAL mode
                toggler = {
                    ---Line-comment toggle keymap
                    line = 'gcc',
                    ---Block-comment toggle keymap
                    block = 'gbc',
                },
                ---LHS of operator-pending mappings in NORMAL and VISUAL mode
                opleader = {
                    ---Line-comment keymap
                    line = 'gc',
                    ---Block-comment keymap
                    block = 'gb',
                },
                ---LHS of extra mappings
                extra = {
                    ---Add comment on the line above
                    above = 'gcO',
                    ---Add comment on the line below
                    below = 'gco',
                    ---Add comment at the end of line
                    eol = 'gcA',
                },
                ---Enable keybindings
                ---NOTE: If given `false` then the plugin won't create any mappings
                mappings = {
                    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                    basic = false,
                    ---Extra mapping; `gco`, `gcO`, `gcA`
                    extra = false,
                },
                ---Function to call before (un)comment
                pre_hook = nil,
                ---Function to call after (un)comment
                post_hook = nil,
        },
--      config = function()
--              require('Comment').setup()
--      end,
        config = function(_, opts)
                local comment = require('Comment')
                -- Initialize the plugin with our configuration
                comment.setup(opts)

                -- Define custom API keybindings
                local api = require('Comment.api')
                local keymap = vim.keymap.set

                -----------------------
                -- NORMAL MODE
                -----------------------
                -- Toggle current line using 'gcc'
                keymap('n', '<leader>/', api.toggle.linewise.current, { desc = 'Comment toggle current line' })

                -- Toggle current block using 'gbc'
                keymap('n', '<leader>/', api.toggle.blockwise.current, { desc = 'Comment toggle current block' })

                -----------------------
                -- VISUAL MODE
                -----------------------
                -- Toggle selection linewise using 'gc'
                keymap('x', '<leader>/', function()
                  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
                  api.toggle.linewise(vim.fn.visualmode())
                end, { desc = 'Comment toggle visual lines' })

                -- Toggle selection blockwise using 'gb'
                keymap('x', '<leader>/', function()
                  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
                  api.toggle.blockwise(vim.fn.visualmode())
                end, { desc = 'Comment toggle visual block' })
        end
}
