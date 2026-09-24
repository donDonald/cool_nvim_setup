return {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
                "LazyGit",
                "LazyGitConfig",
                "LazyGitCurrentFile",
                "LazyGitFilter",
                "LazyGitFilterCurrentFile",
        },
        -- Optional: For floating window border decoration
        dependencies = {
                "nvim-lua/plenary.nvim",
        },
        keys = {
                { "<leader>ll", "<cmd>LazyGit<cr>", desc = "Open up Lazygit" },
                { "<leader>lh", "<cmd>LazyGitLog<cr>", desc = "Show git history" },
                { "<leader>lf", "<cmd>LazyGitFilter<cr>", desc = "Show Lazygit Filter tool" },
        },
}
