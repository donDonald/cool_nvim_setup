-- Setup F1 help view

local help_state = { win = nil, buf = nil }
local function toggle_help()
        -- Close Help view if alrady visible
        if help_state.win and vim.api.nvim_win_is_valid(help_state.win) then
                vim.api.nvim_win_close(help_state.win, true)
                help_state.win = nil
                return
        end

        if not help_state.buf or not vim.api.nvim_buf_is_valid(help_state.buf) then
                help_state.buf = vim.api.nvim_create_buf(false, true)
                local obj = vim.system({ "/bin/bash", vim.fn.expand("~/.config/nvim/scripts/make_help_view.sh") }):wait()
                if obj.code == 0 then
                     -- print("Output: " .. obj.stdout)
                        local lines = vim.fn.readfile(vim.fn.expand("~/.config/nvim/HOTKEYS.md"))
                        vim.api.nvim_buf_set_lines(help_state.buf, 0, -1, false, lines)
                        vim.api.nvim_buf_set_option(help_state.buf, 'modifiable', false)
                else
                     -- print("ERR: " .. obj.stderr)
                        print("Error has happend")
                end
        end

        local width = math.floor(vim.o.columns * 0.6)
        local height = math.floor(vim.o.lines * 0.8)
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
