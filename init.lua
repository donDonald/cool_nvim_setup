-- Setup very basic options like identations, etc.
require("basic-options")
require("copy-paste")
require("quit")

-- Install lazy plugin manager
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
        print("No lazy found, clonning repository")
        vim.fn.system({
                "git",
                "clone",
                "https://github.com/folke/lazy.nvim.git",
                "--branch=stable",
                lazy_path
        })
        print("lazy, clonning repository - complete, check your ~/.local/share/nvim/lazy/")
else
        print("lazy already installed, check your ~/.local/share/nvim/lazy/")
end
vim.opt.rtp:prepend(lazy_path)

-- Setup F1 help view
local help_state = { win = nil, buf = nil }
local function toggle_help()
        if help_state.win and vim.api.nvim_win_is_valid(help_state.win) then
                vim.api.nvim_win_close(help_state.win, true)
                help_state.win = nil
                return
        end

        if not help_state.buf or not vim.api.nvim_buf_is_valid(help_state.buf) then
                help_state.buf = vim.api.nvim_create_buf(false, true)
                local lines = vim.fn.readfile(vim.fn.expand("~/.config/nvim/HOTKEYS.md"))
                vim.api.nvim_buf_set_lines(help_state.buf, 0, -1, false, lines)
                vim.api.nvim_buf_set_option(help_state.buf, 'modifiable', false)
        end

        local width = math.floor(vim.o.columns * 0.6)
        local height = math.floor(vim.o.lines * 0.6)
        local row = math.floor((vim.o.lines - height) / 2)
        local col = math.floor((vim.o.columns - width) / 2)

        help_state.win = vim.api.nvim_open_win(help_state.buf, true, {
                relative = 'editor',
                width = width,
                height = height,
                row = row,
                col = col,
                style = 'minimal',
                border = 'rounded'
        })

        vim.keymap.set('n', '<Esc>', function()
                if help_state.win and vim.api.nvim_win_is_valid(help_state.win) then
                        vim.api.nvim_win_close(help_state.win, true)
                        help_state.win = nil
                end
        end, { buffer = help_state.buf })
end

vim.keymap.set('n', '<F1>', toggle_help, { silent = true })

-- Toggle up Lazy plugin manager visibility
vim.keymap.set("n", "<F2>", function()
        if vim.bo.filetype == "lazy" then
                vim.cmd.close()
        else
                vim.cmd("Lazy home")
        end
end, { desc = "Toggle Lazy" })

-- Collecton of plugins to be loaded
require("lazy").setup("plugins")
