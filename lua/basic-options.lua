-- Expand TABs to spaces.
-- Indents will have a width of 8.
-- Sets the number of columns for a TAB.
vim.cmd("set expandtab");
vim.cmd("set tabstop=8");
vim.cmd("set shiftwidth=8");
vim.cmd("set softtabstop=8");
vim.g.mapleader = " "

-- Setup line numbering
vim.cmd("set number relativenumber");
vim.cmd("set listchars=tab:>─,space:·");
vim.cmd("nnoremap <leader>i :set list!<CR>");

-- Very specific identation
--vim.cmd("nnoremap <leader>o :set ts=8 sw=4 sts=4 noet<CR>");
--vim.cmd("nnoremap <leader>oo :set ts=8 expandtab<CR>");
local indent_toggle = false  -- false = tabs (setup 1), true = spaces (setup 2)
function _G.ToggleIndent()
    indent_toggle = not indent_toggle
    if indent_toggle then
        -- Setup 2: spaces
        vim.opt.expandtab = true
        vim.opt.tabstop = 8
        -- reset shiftwidth/softtabstop so the next setup starts clean
        vim.opt.shiftwidth = 8
        vim.opt.softtabstop = 0
        print("Indent: EXPANDTAB (ts=8, spaces)")
    else
        -- Setup 1: tabs
        vim.opt.expandtab = false
        vim.opt.tabstop = 8
        vim.opt.shiftwidth = 4
        vim.opt.softtabstop = 4
        print("Indent: NOET (ts=8, sw=4, sts=4)")
    end
end

vim.keymap.set("n", "<leader>o", ToggleIndent, { desc = "Toggle indentation" })
