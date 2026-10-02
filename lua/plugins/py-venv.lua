-- Setup venv-selector - python virtual env selector tool
return {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
                { "nvim-telescope/telescope.nvim", version = "*", dependencies = { "nvim-lua/plenary.nvim" } },
                -- Optional: Add these if you want debugger integration
                -- "mfussenegger/nvim-dap",
                -- "mfussenegger/nvim-dap-python",
        },
        ft = "python", -- Load only for Python files
        keys = {
                -- Open the venv selector picker
                { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
                -- Activate the last used venv from cache
                { "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Select Cached VirtualEnv" },
        },
        opts = {
                options = {
                        -- Plugin-wide options
                        -- Set to true to refresh search results every time you open the picker.
                        auto_refresh = false,
                        -- Look for venvs in parent directories. Default is true.
                        search = true,
                        -- How many parent directories to traverse. Default is 2.
                        parents = 2,
                        -- The name(s) of the venv folders to look for.
                        -- Default is "venv". Use a table for multiple names.
                        name = { "venv", ".venv" },
                },
                -- Custom search definitions can be added here if needed.
                search = {},
        },
}
