return {
        "neovim/nvim-lspconfig",
        pin = true, -- Lock actual plugin version
        lazy = false,
        config = function()

                -- Generic hotkeys
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

                                -- Setup detailed diagnostics view
                                vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { buffer = args.buf, desc = 'Show diagnostic' })
                        end,
                })

                vim.diagnostic.config({
                        -- Inline virtual text
                        virtual_text = {
                                source = "if_many",   -- Show source only when multiple LSPs provide diagnostics
                                prefix = "●",         -- Prefix symbol
                                spacing = 4,
                        },

                        -- Gutter icons (new API in 0.11, no longer use sign_define)
                        signs = {
                                text = {
                                        [vim.diagnostic.severity.ERROR] = "",
                                        [vim.diagnostic.severity.WARN]  = "",
                                        [vim.diagnostic.severity.HINT]  = "",
                                        [vim.diagnostic.severity.INFO]  = "",
                                },
                        },

                        -- Underline error/warning code
                        underline = true,

                        -- Do not update diagnostics in insert mode (avoid distraction)
                        update_in_insert = false,

                        -- Sort by severity
                        severity_sort = true,

                        -- Floating window style (triggered with :lua vim.diagnostic.open_float())
                        float = {
                                border = "rounded",
                                source = "always",
                        },
                })

                -- Rust setup
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

                -- Python setup
                -- basedpyright
                local capabilities = require("cmp_nvim_lsp").default_capabilities()

                vim.lsp.config("basedpyright", {
                        capabilities = capabilities,  -- key point
                        settings = {
                                basedpyright = {
                                        analysis = {
                                                typeCheckingMode = "standard",
                                        },
                                },
                                python = {
                                        -- Disable import organization to avoid conflict with ruff
                                        disableOrganizeImports = true,
                                },
                        },
                })
                vim.lsp.enable("basedpyright")

                -- ruff
                vim.lsp.config("ruff", {
                        capabilities = capabilities, -- Must add
                        -- ruff defaults usually suffice; just enable it
                })
                vim.lsp.enable("ruff")
        end
}
