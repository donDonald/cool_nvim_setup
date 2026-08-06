-- To copy and paste between Neovim and your host system clipboard, you need to sync Neovim's unnamed register with the system clipboard.
vim.cmd("set clipboard=unnamedplus");
vim.keymap.set('v', '<leader>c', '"+y', { desc = 'Copy selection to system clipboard' })
vim.keymap.set('n', '<leader>v', '"+p', { desc = 'Paste system clipboard content' })
