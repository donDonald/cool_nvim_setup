return {
        -- color scheme plugin
        "catppuccin/nvim", 
        name = "catppuccin", 
        priority = 1000,
        config = function()
                -- Select desired color scheme here
                require("catppuccin").setup({
                --    flavour = "latte",
                --    flavour = "frappe",
                --    flavour = "macchiato",
                      flavour = "mocha"
                })
                vim.cmd.colorscheme "catppuccin"
        end
}
