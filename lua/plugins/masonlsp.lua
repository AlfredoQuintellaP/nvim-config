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
        
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local opts = { buffer = args.buf, silent = true }
                
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>f", function()
                    vim.lsp.buf.format({ async = true })
                end, opts)
            end,
        })
        
        vim.lsp.config.pyright = {
            cmd = { 'pyright-langserver', '--stdio' },
            filetypes = { 'python' },
            root_markers = { 'pyproject.toml', 'setup.py', 'requirements.txt', '.git' },
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "off"
                    }
                }
            },
        }
        
        vim.lsp.config.clangd = {
            cmd = { 'clangd', '--background-index' },
            filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
            root_markers = { '.clangd', 'compile_commands.json', 'compile_flags.txt', '.git' },
        }
        
        vim.lsp.config.texlab = {
            cmd = { 'texlab' },
            filetypes = { 'tex', 'plaintex', 'bib' },
            root_markers = { '.latexmkrc', '.git', 'main.tex' },
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
        }
        
        vim.lsp.config.r_language_server = {
            cmd = { 'R', '--slave', '-e', 'languageserver::run()' },
            filetypes = { 'r', 'rmd' },
            root_markers = { '.git', 'DESCRIPTION' },
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
