local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then return end

vim.o.timeout = true
vim.o.timeoutlen = 300

local opts = {
    mode = 'n',
    prefix = '<leader>',
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
}

local mappings = {

    k = { '<cmd>bdelete<CR>', 'Kill Buffer' },
    p = { '<cmd>Lazy<CR>', 'Plugin Manager' },
    Q = { '<cmd>qall!<CR>', 'Quit' },
    w = { '<cmd>w!<CR>', 'Save' },
    e = { '<cmd>Neotree float reveal<cr>', 'Explorer' },
    E = { '<cmd>Neotree left<cr>', 'Explorer' },
    m = { '<cmd>Mason<cr>', 'Mason' },
    r = { '<cmd>lua vim.lsp.buf.format{async=true}<cr>', 'Reformat Code' },
    u = { "<cmd>lua require('undotree').toggle()<CR>", 'Undo-Tree' },
    h = { '<cmd>HopWord<cr>', 'Hop' },
    g = { '<cmd>lua _LAZYGIT_TOGGLE()<cr>', 'Git' },
    d = { '<cmd>lua _DOCKER_TOGGLE()<cr>', 'Docker' },
    t = { '<cmd>ToggleTerm direction=float<cr>', 'Terminal' },
    z = { '<cmd>lua ZenMode()<cr>', 'Zen mode' },

    f = {
        name = 'File Search',
        c = { '<cmd>Telescope colorscheme<cr>', 'Colorscheme' },
        f = {
            "<cmd>lua require('telescope.builtin').find_files()<cr>",
            'Find files',
        },
        t = {
            '<cmd>Telescope live_grep <cr>',
            'Find Text Pattern In All Files',
        },
        g = {
            '<cmd>lua require "telescope.builtin".grep_string{ shorten_path = true, word_match = "-w", only_sort_text = true, search = "" }<cr>',
            'Find Text Pattern In All Files',
        },
        r = { '<cmd>Telescope oldfiles<cr>', 'Open Recent File' },
    },

    s = {
        name = 'Search',
        h = { '<cmd>Telescope help_tags<cr>', 'Find Help' },
        b = { '<cmd>Neotree buffers<cr>', 'Find buffers' },
        m = { '<cmd>Telescope man_pages<cr>', 'Man Pages' },
        r = { '<cmd>Telescope registers<cr>', 'Registers' },
        k = { '<cmd>Telescope keymaps<cr>', 'Keymaps' },
        c = { '<cmd>Telescope commands<cr>', 'Commands' },
    },

    l = {
        name = 'LSP',
        i = { '<cmd>LspInfo<cr>', 'Info' },
        r = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename' },
        s = { '<cmd>lua vim.lsp.buf.hover()<cr>', 'Document Symbols' },
        S = {
            '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>',
            'Workspace Symbols',
        },
        d = {
            "<cmd>lua require('goto-preview').goto_preview_definition()<cr>",
            'show definition',
        },
        D = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'definition' },
        h = { '<cmd>lua vim.diagnostic.open_float()<cr>', 'show diagnostic' },
    },

    T = {
        name = 'Terminal',
        p = { '<cmd>lua _PYTHON_TOGGLE()<cr>', 'Python' },
        h = { '<cmd>ToggleTerm size=10 direction=horizontal<cr>', 'Horizontal' },
        v = { '<cmd>ToggleTerm size=80 direction=vertical<cr>', 'Vertical' },
    },
}

which_key.add(mappings)
