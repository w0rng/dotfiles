local cmp = require 'cmp'
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup {
    formatting = require('lsp-zero').cmp_format(),
    completion = {
        autocomplete = false,
    },
    preselect = cmp.PreselectMode.Item,
    snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end,
    },
    mapping = cmp.mapping.preset.insert {
        ['<CR>'] = cmp.mapping.confirm { select = false },
        ['<Tab>'] = cmp_action.tab_complete(),
        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
        ['<C-Space>'] = cmp.mapping.complete(),
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    sources = cmp.config.sources({
        { name = 'copilot' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'spell' },
        { name = 'buffer' },
        { name = 'py-requirements' },
        { name = 'bootstrap' },
    }, { name = 'buffer' }),
}
