-- Expand TABs to spaces.
-- Indents will have a width of 8.
-- Sets the number of columns for a TAB.

local INDENTATION = 8
local TABSTOP = INDENTATION
local SHIFTWIDTH = INDENTATION
local SOFTTABSTOP = INDENTATION

vim.cmd("set expandtab");
vim.cmd(string.format("set tabstop=%d", TABSTOP));
vim.cmd(string.format("set shiftwidth=%d", SHIFTWIDTH));
vim.cmd(string.format("set softtabstop=%d", SOFTTABSTOP));
vim.g.mapleader = " "

-- Setup line numbering
vim.cmd("set number relativenumber");
vim.cmd("set listchars=tab:>─,space:·");
vim.cmd("nnoremap <leader>i :set list!<CR>");

local indent_toggle = vim.opt.expandtab:get()
function _G.ToggleIndent()
        indent_toggle = not vim.opt.expandtab:get()
        if indent_toggle then
                -- Setup 1: spaces
                vim.opt.expandtab = true
                vim.opt.tabstop = TABSTOP
                vim.opt.shiftwidth = SHIFTWIDTH
                vim.opt.softtabstop = SOFTTABSTOP
                print(string.format("Indent: EXPANDTAB (ts=%d, sw=%d, sts=%d) spaces",
                      vim.opt.tabstop:get(), vim.opt.shiftwidth:get(), vim.opt.softtabstop:get()))
        else
                -- Setup 2: Very specific identation
                vim.opt.expandtab = false
                vim.opt.tabstop = 8
                vim.opt.shiftwidth = 4
                vim.opt.softtabstop = 4
                print(string.format("Indent: NOET (ts=%d, sw=%d, sts=%d)",
                      vim.opt.tabstop:get(), vim.opt.shiftwidth:get(), vim.opt.softtabstop:get()))
        end
end

vim.keymap.set("n", "<leader>o", ToggleIndent, { desc = "Toggle indentation" })
