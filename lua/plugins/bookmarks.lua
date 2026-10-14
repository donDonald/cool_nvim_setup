return {
        "tomasky/bookmarks.nvim",
        -- Lazy load on these keymaps
        keys = {
                { "bb", desc = "List Bookmarks (Telescope)" },
                { "bl", desc = "List Bookmarks (Quickfix)" },
                { "bt", desc = "Toggle Bookmark" },
                { "be", desc = "Add/Edit Annotation" },
                { "bc", desc = "Clean Bookmarks in Buffer" },
                { "bn", desc = "Next Bookmark" },
                { "bp", desc = "Prev Bookmark" },
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
