return {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
                vim.lsp.config('rust_analyzer', {
                        settings = { 
                                ['rust-analyzer'] = {
                                        -- Example: Use clippy on save
                                        --[[ checkOnSave = {
                                                command = 'clippy',
                                        }, ]]
                                        -- Example: Enable inlay hints
                                        inlayHints = {
                                                bindingModeHints = {
                                                        enable = true,
                                                },
                                                closureReturnTypeHints = {
                                                        enable = 'always',
                                                },
                                        },
                                        -- You can add any rust-analyzer config options here.
                                        -- See: https://rust-analyzer.github.io/manual.html#configuration
                                } 
                        } 
                })
                vim.lsp.enable('rust_analyzer')

                vim.api.nvim_create_autocmd('LspAttach', {
                        callback = function(args)
                                local client = vim.lsp.get_client_by_id(args.data.client_id)
                                -- Check if the server supports the definition capability
                                if client and client:supports_method('textDocument/definition') then
                                        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, 
                                                { buffer = args.buf, desc = '[G]oto [D]efinition' })
                                end
                                if client and client:supports_method('textDocument/declaration') then
                                        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, 
                                                { buffer = args.buf, desc = '[G]oto [D]eclaration' })
                                end

                                -- Setup auto-completion
                                if client and client:supports_method('textDocument/completion') then
                                        vim.lsp.completion.enable(true, client.id, args.buf, {
                                                autotrigger = true, -- Enable automatic completion while typing
                                        })
                                end
                                --vim.keymap.set('i', '<C-Space>', vim.lsp.completion.get, { desc = 'Trigger LSP completion' })
                                vim.o.completeopt = 'menuone,noselect,popup'
                        end,
                })
        end,
}
