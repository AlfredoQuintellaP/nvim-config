-- ~/.config/nvim/lua/plugins/masonlsp.lua

return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()

        require("mason-lspconfig").setup({
            ensure_installed = {
                "pyright",
                "clangd",
                "texlab",
                "julials",
                "r_language_server",
            },
        })

        -- Keymaps e capabilities ao conectar qualquer servidor
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local opts = { buffer = args.buf, silent = true }

                -- Navegação
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

                -- Documentação
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

                -- Edição assistida
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>f", function()
                    vim.lsp.buf.format({ async = true })
                end, opts)

                -- Diagnósticos: abrir float + navegar entre erros
                vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
            end,
        })

        -- Capabilities: usa pcall pra não quebrar se cmp ainda não carregou
        local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
        local capabilities = ok and cmp_nvim_lsp.default_capabilities() or vim.lsp.protocol.make_client_capabilities()

        -- Diagnósticos: virtual text com prefixo, ordenados por severidade
        vim.diagnostic.config({
            virtual_text = { spacing = 4, prefix = "■" },
            severity_sort = true,
            float = { border = "rounded" },
        })

        vim.lsp.config.pyright = {
            cmd = { 'pyright-langserver', '--stdio' },
            filetypes = { 'python' },
            root_markers = { 'pyproject.toml', 'setup.py', 'requirements.txt', '.git' },
            capabilities = capabilities,
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "off",
                    },
                },
            },
        }

        vim.lsp.config.clangd = {
            cmd = { 'clangd', '--background-index' },
            filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
            root_markers = { '.clangd', 'compile_commands.json', 'compile_flags.txt', '.git' },
            capabilities = capabilities,
        }

        vim.lsp.config.texlab = {
            cmd = { 'texlab' },
            filetypes = { 'tex', 'plaintex', 'bib' },
            root_markers = { '.latexmkrc', '.git', 'main.tex' },
            capabilities = capabilities,
        }

        vim.lsp.config.julials = {
            cmd = { 'julia', '--startup-file=no', '--history-file=no', '-e', [[
                using LanguageServer;
                server = LanguageServer.LanguageServerInstance(stdin, stdout, false);
                server.runlinter = true;
                run(server);
            ]] },
            filetypes = { 'julia' },
            root_markers = { 'Project.toml', '.git' },
            capabilities = capabilities,
        }

        vim.lsp.config.r_language_server = {
            cmd = { 'R', '--slave', '-e', 'languageserver::run()' },
            filetypes = { 'r', 'rmd' },
            root_markers = { '.git', 'DESCRIPTION' },
            capabilities = capabilities,
        }

        vim.lsp.enable({
            'pyright',
            'clangd',
            'texlab',
            'julials',
            'r_language_server',
        })
    end,
}
