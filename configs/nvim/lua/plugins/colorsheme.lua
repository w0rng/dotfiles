return {
    'p00f/alabaster.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        vim.opt.background = 'light'
        vim.g.alabaster_floatborder = true
        vim.cmd [[colorscheme alabaster]]
    end,
}
