return {
        "tomasky/bookmarks.nvim",
        -- Lazy load on these keymaps
        keys = {
                { "<leader>bi", desc = "Get [b]ookmarks [i]nfo" },
                { "<leader>bs", desc = "Toggle [b]ookmarks [s]pecific to a project" },
                { "<leader>bc", desc = "Clean Bookmarks" },
                { "<leader>bb", desc = "List Bookmarks (Telescope)" },
                { "<leader>bl", desc = "List Bookmarks (Quickfix)" },
                { "<leader>bt", desc = "Toggle Bookmark" },
                { "<leader>be", desc = "Add/Edit Annotation" },
                { "<leader>b]", desc = "Next Bookmark" },
                { "<leader>b[", desc = "Prev Bookmark" },
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

                -- Toggle project specific bookmarks
--[[                 map("n", "<leader>bp", bm.toggle_scope, { desc = "Toggle Project Specific Bookmarks" }) ]]
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
                end, { desc = "Get [b]ookmarks [i]nfo" })

                map("n", "<leader>bs", function()
                        bm.toggle_scope()
                end, { desc = "Toggle [b]ookmarks [s]pecific to a project" })

                -- Clear bookmarks list
                map("n", "<leader>bc", function()
                        bm.bookmark_clear_all()
                        vim.notify("All bookmarks cleared", vim.log.levels.INFO)
                end, { desc = "Clean Bookmarks" })

                -- Telescope bookmarks list
                map("n", "<leader>bb", "<cmd>Telescope bookmarks list<cr>", { desc = "List Bookmarks (Telescope)" })

                -- Show marked file list in quickfix window
                map("n", "<leader>bl", bm.bookmark_list, { desc = "List Bookmarks" })

                -- Toggle bookmark at current line
                map("n", "<leader>bt", bm.bookmark_toggle, { desc = "Toggle Bookmark" })

                -- Add or edit mark annotation at current line
                map("n", "<leader>be", bm.bookmark_ann, { desc = "Add/Edit Bookmark Annotation" })

                -- Clean all marks in local buffer
                map("n", "<leader>bc", bm.bookmark_clean, { desc = "Clean Bookmarks in Buffer" })

                -- Jump to next mark in local buffer
                map("n", "<leader>bn", bm.bookmark_next, { desc = "Next Bookmark" })

                -- Jump to previous mark in local buffer
                map("n", "<leader>bp", bm.bookmark_prev, { desc = "Prev Bookmark" })
        end,
}
