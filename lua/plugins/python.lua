return {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
                -- A picker is required. Telescope is the most common example.
                { "nvim-telescope/telescope.nvim", version = "*", dependencies = { "nvim-lua/plenary.nvim" } },
                -- Optional: Add these if you want debugger integration
                -- "mfussenegger/nvim-dap",
                -- "mfussenegger/nvim-dap-python",
        },
        ft = "python", -- Load only for Python files
        keys = {
                -- Open the venv selector picker with ,v
                { "<leader>ve", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
        },
        opts = {
                -- Plugin-wide options. These are examples; adjust as needed.
                options = {
                        -- Set to true to refresh search results every time you open the picker.
                        -- Default is false, which caches results for speed.
                        auto_refresh = false,
                        -- Search for venvs in parent directories. Default is true.
                        search = true,
                        -- How many parent directories to traverse. Default is 2.
                        parents = 2,
                        -- The name(s) of the venv folders to look for.
                        -- Default is "venv". Use a table for multiple names.
                        name = { "venv", ".venv" },
                },
                -- Custom search definitions (optional).
                search = {},
        },
}
