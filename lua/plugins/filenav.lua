return {
        "wojciech-kulik/filenav.nvim",
        pin = true, -- Lock actual plugin version
        event = "VeryLazy",
        opts = {
                -- You can customize the keys, default is <M-i> / <M-o>
                prev_file_key = "<leader>[[", -- Back (previous file)
                next_file_key = "<leader>]]", -- Forward (next file)
                max_history = 100,
        }
}
