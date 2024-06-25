return {
    {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup {
                focus_on_open = false,
                dismiss_on_move = true,
                border = {
                    '╭',
                    '─',
                    '╮',
                    '│',
                    '╯',
                    '─',
                    '╰',
                    '│',
                },
            }
        end,
    },
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
    {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            {
                'folke/neoconf.nvim',
                cmd = 'Neoconf',
                config = false,
                dependencies = { 'nvim-lspconfig' },
            },
            { 'williamboman/mason-lspconfig.nvim' },
            {
                'williamboman/mason.nvim',
                cmd = { 'Mason' },
                config = function()
                    require('mason').setup {
                        ui = {
                            border = 'rounded',
                        },
                    }
                end,
            },
        },
        config = function() require 'configs.lsp' end,
    },
    {
        'ray-x/lsp_signature.nvim',
        event = 'VeryLazy',
        opts = {
            hint_enable = false,
            doc_lines = 3,
        },
        config = function(_, opts) require('lsp_signature').setup(opts) end,
    },
}
