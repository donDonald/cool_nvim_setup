-- Setup treesitter - text highlighting tool
return {
        -- text highlighting tool
        "nvim-treesitter/nvim-treesitter",
        tag = 'v0.9.3',
        build = ":TSUpdate",
        config = function()
                -- local config = require("nvim-treesitter.config")
                local config = require("nvim-treesitter.configs")
                config.setup({
                        ensure_installed = {
                                "bash",
                                "lua",
                                "python",
                                "php",
                                "c",
                                "cpp",
                                "yaml",
                                "typescript",
                                "json",
                                "javascript",
                                "html",
                                "dockerfile",
                                "cmake"
                        },
                        highlight = { enable = true },
                        indent = { enable = true },
                })
        end
}
