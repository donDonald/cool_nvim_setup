-- You must install the fzf binary and ripgrep globally on your operating system:
-- sudo apt install fzf ripgrep
return {
        {
                "ibhagwan/fzf-lua",
                -- Optional helper dependencies for file icons
                dependencies = { "nvim-tree/nvim-web-devicons" },
                -- Lazy load on these specific keymaps
                keys = {
                        { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" },
                        { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep" },
                        { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
                        { "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Help Tags" },
                        { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent Files" },
                        { "<leader>h", "<cmd>FzfLua oldfiles<cr>", desc = "Recent Files" },
                        { "<F3>", "<cmd>FzfLua oldfiles<cr>", desc = "Recent Files" },
                },
                opts = function()
                    local config = require("fzf-lua.config")
                    
                    -- Quick layout adjustments
                    config.defaults.keymap.fzf["ctrl-q"] = "select-all+accept" -- Quickfix list shortcut
                    
                    return {
                            -- Make the window open in a clean float layout
                            winopts = {
                                    height = 0.85,
                                    width = 0.80,
                                    row = 0.35,
                                    col = 0.50,
                                    preview = {
                                            layout = "vertical", -- Changes layout to vertical split
                                            vertical = "down:45%",
                                    },
                            },

                            -- Setup defaults for find files
                            files = {
                                    formatter = "path.filename_first", -- Highlights filename before path
                            },

                            -- Enable history for oldfiles
                            -- fzf shall have 
                            -- :!fzf --version in Neovim. fzf-lua recommends version >= 0.52.1, and history handling has improved in newer versions
                            oldfiles = {
                                    include_current_session = true, -- Shows files opened in this Neovim session
                                    fzf_opts = {
                                            ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-oldfiles-history",
                                    },
                            },
                    }
                end,
        }
}

