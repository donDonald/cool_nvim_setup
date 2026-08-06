-- To copy and paste between Neovim and your host system clipboard, you need to sync Neovim's unnamed register with the system clipboard.
vim.cmd("set clipboard=unnamedplus");
vim.keymap.set('n', '<F12>', ':wqa!<CR>', { desc = 'Close nvim, save changes' })
vim.keymap.set('n', '<F11>', ':qa!<CR>', { desc = 'Close nvim, loose unsaved changes' })
