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
