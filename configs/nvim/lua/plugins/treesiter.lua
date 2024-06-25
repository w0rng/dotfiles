return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = {
        'BufRead requirements.txt',
        'BufRead requirements_dev.txt',
    },
    opts = {
        highlight = { enable = false },
        ensure_installed = {
            'python',
            'requirements',
        },
        auto_install = true,
    },
    config = function(_, opts) require('nvim-treesitter.configs').setup(opts) end,
}
