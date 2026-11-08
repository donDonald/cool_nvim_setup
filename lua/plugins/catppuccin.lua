return {
        -- color scheme plugin
        "catppuccin/nvim", 
        pin = true, -- Lock actual plugin version
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
