return {
    {
        'stevearc/conform.nvim',
        opts = {},
    },
    {
        'MeanderingProgrammer/py-requirements.nvim',
        event = {
            'BufRead requirements.txt',
            'BufRead requirements_dev.txt',
        },
        config = function()
            require('py-requirements').setup {
                enable_cmp = true,
                file_patterns = { 'requirements.txt', 'requirements_dev.txt' },
            }
        end,
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-treesitter/nvim-treesitter' },
        },
        opts = {},
    },
    {
        'hrsh7th/nvim-cmp',
        keys = { '<C-Space>' },
        config = function() require 'configs.cmp' end,
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            {
                'Jezda1337/cmp_bootstrap',
                config = function()
                    require('bootstrap-cmp.config'):setup {
                        file_types = { 'jinja.html', 'html', 'htmldjango' },
                        url = 'https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css',
                    }
                end,
            },

            { 'L3MON4D3/LuaSnip' },
            {
                'rafamadriz/friendly-snippets',
                config = function()
                    require('luasnip.loaders.from_vscode').lazy_load()
                end,
            },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lua' },
            {
                'zbirenbaum/copilot-cmp',
                dependencies = {
                    'zbirenbaum/copilot.lua',
                    cmd = 'Copilot',
                    config = function()
                        require('copilot').setup {
                            suggestion = { enabled = false },
                            panel = { enabled = false },
                        }
                    end,
                },
                config = function() require('copilot_cmp').setup() end,
            },
        },
    },
    {
        'numToStr/Comment.nvim',
        cmd = { 'Comment' },
        keys = {
            { 'gcc', mode = 'n', desc = 'Comment toggle current line' },
            { 'gc', mode = { 'n', 'o' }, desc = 'Comment toggle linewise' },
            { 'gc', mode = 'x', desc = 'Comment toggle linewise (visual)' },
            { 'gbc', mode = 'n', desc = 'Comment toggle current block' },
            { 'gb', mode = { 'n', 'o' }, desc = 'Comment toggle blockwise' },
            { 'gb', mode = 'x', desc = 'Comment toggle blockwise (visual)' },
        },
        config = function(_, opts) require('Comment').setup(opts) end,
    },
    {
        'windwp/nvim-autopairs',
        opts = {
            fast_wrap = {},
            disable_filetype = { 'TelescopePrompt', 'vim' },
        },
        event = 'InsertEnter',
    },
    {
        'windwp/nvim-ts-autotag',
        config = function() require('nvim-ts-autotag').setup() end,
        event = 'InsertEnter',
    },
    {
        'mfussenegger/nvim-lint',
        event = { 'BufWritePost' },
        config = function()
            vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
                callback = function() require('lint').try_lint() end,
            })
        end,
    },
}
