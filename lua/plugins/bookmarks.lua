return {
        "tomasky/bookmarks.nvim",
        -- Lazy load on these keymaps
        keys = {
                { "<leader>bi", desc = "Get bookmarks info" },
                { "<leader>bs", desc = "Toggle bookmarks specific to a project" },
                { "<leader>bc", desc = "Cleanup bookmarks" },
                { "<leader>bb", desc = "List bookmarks (Telescope)" },
                { "<leader>bl", desc = "List bookmarks (Quickfix)" },
                { "<leader>bt", desc = "Toggle bookmark" },
                { "<leader>be", desc = "Add/Edit annotation" },
                { "<leader>b]", desc = "Next bookmark" },
                { "<leader>b[", desc = "Prev bookmark" },
        },
        -- Configuration (passed to require('bookmarks').setup)
        opts = {
                -- sign_priority = 8,
                auto_close_list = true,
                qf_position = "bottom",
                save_file = vim.fn.expand("$HOME/.bookmarks"), -- Linux home directory path
                keywords = {
                        ["@t"] = "☑️ ", -- Todo
                        ["@w"] = "⚠️ ", -- Warn
                        ["@f"] = "⛏ ", -- Fix
                        ["@n"] = " ", -- Note
                },
        },
        -- Keymap configuration
        config = function(_, opts)
                require("bookmarks").setup(opts)

                -- Optional: Telescope Integration
                require('telescope').load_extension('bookmarks')

                local bm = require("bookmarks")
                local map = vim.keymap.set

                map("n", "<leader>bi", function()
                        local bookmarks = vim.fn.expand("$HOME/.bookmarks")
                        local bms = vim.fn.getcwd() .. "/.bms"
                        if vim.fn.filereadable(bms) == 1 then
                                status = "Using project specific(scoped) bookmarks"
                        elseif vim.fn.filereadable(bookmarks) == 1 then
                                status = "Using global (" .. bookmarks .. ") bookmarks"
                        else
                                status = "Weird neither global nor scoped bookmarks"
                        end
                        vim.notify(status, vim.log.levels.WARN)
                end, { desc = "Get bookmarks info" })

                map("n", "<leader>bs", function()
                        bm.toggle_scope()
                end, { desc = "Toggle bookmarks specific to a project" })

                -- Clear bookmarks list
                map("n", "<leader>bc", function()
                        bm.bookmark_clear_all()
                        vim.notify("All bookmarks cleared", vim.log.levels.INFO)
                end, { desc = "Cleanup bookmarks" })

                -- Telescope bookmarks list
                map("n", "<leader>bb", "<cmd>Telescope bookmarks list<cr>", { desc = "List bookmarks (Telescope)" })

                -- Show marked file list in quickfix window
                map("n", "<leader>bl", bm.bookmark_list, { desc = "List bookmarks" })

                -- Toggle bookmark at current line
                map("n", "<leader>bt", bm.bookmark_toggle, { desc = "Toggle bookmark" })

                -- Add or edit mark annotation at current line
                map("n", "<leader>be", bm.bookmark_ann, { desc = "Add/Edit bookmark annotation" })

                -- Clean all marks in local buffer
                map("n", "<leader>bc", bm.bookmark_clean, { desc = "Clean bookmarks in buffer" })

                -- Jump to next mark in local buffer
                map("n", "<leader>bn", bm.bookmark_next, { desc = "Next bookmark" })

                -- Jump to previous mark in local buffer
                map("n", "<leader>bp", bm.bookmark_prev, { desc = "Prev bookmark" })
        end,
}
