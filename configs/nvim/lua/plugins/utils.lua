return {
    {
        'phaazon/hop.nvim',
        cmd = {
            'HopWord',
            'HopChar1',
            'HopChar2',
            'HopPattern',
            'HopLine',
            'HopLineStart',
            'HopAnywhere',
        },
        config = function()
            require('hop').setup {
                keys = 'arstdhneio',
            }
        end,
    },
}
