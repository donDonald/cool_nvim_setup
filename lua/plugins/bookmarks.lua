return {
        "tomasky/bookmarks.nvim",
        -- Lazy load on these keymaps
        keys = {
                { "mm", desc = "Toggle Bookmark" },
                { "mi", desc = "Add/Edit Annotation" },
                { "mc", desc = "Clean Bookmarks in Buffer" },
                { "mn", desc = "Next Bookmark" },
                { "mp", desc = "Prev Bookmark" },
                { "ml", desc = "List Bookmarks (Quickfix)" },
        },
        -- Configuration (passed to require('bookmarks').setup)
        opts = {
                -- sign_priority = 8,
                auto_close_list = true,
                qf_position = "right",
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
                require('telescope').load_extension('bookmarks')

                local bm = require("bookmarks")
                local map = vim.keymap.set

                -- Toggle bookmark at current line
                map("n", "mm", bm.bookmark_toggle, { desc = "Toggle Bookmark" })
                -- Add or edit mark annotation at current line
                map("n", "mi", bm.bookmark_ann, { desc = "Add/Edit Bookmark Annotation" })
                -- Clean all marks in local buffer
                map("n", "mc", bm.bookmark_clean, { desc = "Clean Bookmarks in Buffer" })
                -- Jump to next mark in local buffer
                map("n", "mn", bm.bookmark_next, { desc = "Next Bookmark" })
                -- Jump to previous mark in local buffer
                map("n", "mp", bm.bookmark_prev, { desc = "Prev Bookmark" })
                -- Show marked file list in quickfix window
                map("n", "ml", bm.bookmark_list, { desc = "List Bookmarks" })

                -- Optional: Telescope Integration
                -- require("telescope").load_extension("bookmarks")
        end,
}







--[[ require('bookmarks').setup({
  sign_priority = 8, -- Sign priority to display over other signs
  save_file = vim.fn.expand "$HOME/.bookmarks", -- Global save file path
  scope_file = ".bms", -- Per-project scope file
  format = "json", -- Storage format: "json" or "mpack" (MessagePack)
  save_on_exit = true, -- Auto-save bookmarks when quitting Neovim
  auto_close_list = false, -- Keep quickfix list open after jumping
  qf_position = "bottom", -- Quickfix position: "bottom" or "right"
  virt_text = false, -- Show inline virtual text annotations
  keywords = {
    ["@t"] = "☑️ ", -- Todo annotation
    ["@w"] = "⚠️ ", -- Warning annotation
    ["@f"] = "⛏ ", -- Fix/feature annotation
    ["@n"] = " ", -- Note annotation
  },
  on_attach = function(bufnr)
    local bm = require('bookmarks')
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { silent = true, buffer = bufnr, desc = desc })
    end

    -- Keymaps for bookmarks
    map('n', 'mm', bm.bookmark_toggle, "Toggle bookmark")
    map('n', 'mi', bm.bookmark_ann, "Annotate or edit bookmark")
    map('n', 'mc', bm.bookmark_clean, "Clean bookmarks in current buffer")
    map('n', 'mn', bm.bookmark_next, "Jump to next bookmark")
    map('n', 'mp', bm.bookmark_prev, "Jump to previous bookmark")
    map('n', 'ml', bm.bookmark_list, "Show bookmark list (quickfix)")
    map('n', 'mx', bm.bookmark_clear_all, "Clear all bookmarks")
  end,
}) ]]
