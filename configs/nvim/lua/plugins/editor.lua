return {
    {
        'nvim-neo-tree/neo-tree.nvim',
        cmd = { 'Neotree' },
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
        config = function()
            require('neo-tree').setup {
                popup_border_style = 'rounded',
                enable_git_status = true,
                window = {
                    position = 'float',
                },
                filesystem = {
                    filtered_items = {
                        always_show = {
                            'pyproject.toml',
                            'todo.md',
                            '.env',
                            '.dockerenv',
                            '.gitlab-ci.yml',
                        },
                    },
                },
            }
        end,
        opts = {
            -- don't reset the cursor position when opening a file
            disable_netrw = true,
            hijack_netrw = true,
        },
    },
    {
        'folke/which-key.nvim',
        keys = { '<leader>', '<c-r>', '<c-w>', '"', "'", '`', 'c', 'v', 'g' },
        config = function() require 'configs.whichkey' end,
    },
    {
        'nvim-telescope/telescope.nvim',
        cmd = { 'Telescope' },
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = function() require 'configs.telescope' end,
    },
    {
        'akinsho/toggleterm.nvim',
        version = '*',
        cmd = { 'ToggleTerm' },
        config = function() require 'configs.toggleterm' end,
    },
    {
        'jiaoshijie/undotree',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = true,
        keys = {
            { '<leader>u', "<cmd>lua require('undotree').toggle()<cr>" },
        },
    },
    {
        'VonHeikemen/fine-cmdline.nvim',
        cmd = 'FineCmdline',
        dependencies = { 'MunifTanjim/nui.nvim' },
    },
    {
        'b0o/incline.nvim',
        opts = {},
        event = 'VeryLazy',
        config = function()
            require('incline').setup(require 'configs.statusline')
        end,
    },
    {
        'Wansmer/symbol-usage.nvim',
        event = 'BufReadPre', -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
        config = function()
            require('symbol-usage').setup {
                vt_position = 'end_of_line',
            }
        end,
    },
    {
        'Pocco81/true-zen.nvim',
        cmd = { 'TZAtaraxis' },
        config = function()
            require('true-zen').setup {
                modes = { -- configurations per mode
                    ataraxis = {
                        shade = 'dark', -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
                        backdrop = 0, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
                        minimum_writing_area = { -- minimum size of main window
                            width = 100,
                            height = 300,
                        },
                        quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
                        padding = { -- padding windows
                            left = 52,
                            right = 52,
                            top = 0,
                            bottom = 0,
                        },
                        callbacks = { -- run functions when opening/closing Ataraxis mode
                            open_pre = nil,
                            open_pos = nil,
                            close_pre = nil,
                            close_pos = nil,
                        },
                    },
                },
            }
        end,
    },
    {
        'brenoprata10/nvim-highlight-colors',
        event = { 'BufReadPost' },
        config = function() require('nvim-highlight-colors').turnOn() end,
    },
    {
        'LintaoAmons/scratch.nvim',
        event = 'VeryLazy',
    },
    {
        'folke/twilight.nvim',
        event = 'VeryLazy',
    },
}
