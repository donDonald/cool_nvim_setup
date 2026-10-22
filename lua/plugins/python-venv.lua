-- Setup python venv loading
return {
        "tnfru/nvim-venv-detector",
        event = "VimEnter",
        config = function()
                require("venv_detector").setup()
                vim.keymap.set("n", "<leader>pe", function()
                        local venv = vim.env.VIRTUAL_ENV
                        if venv and venv ~= "" then
                                vim.notify("Current venv: " .. venv, vim.log.levels.INFO)
                        else
                                vim.notify("No venv detected/activated", vim.log.levels.WARN)
                        end
                end, { desc = "Show current Python venv" })
        end,
}
