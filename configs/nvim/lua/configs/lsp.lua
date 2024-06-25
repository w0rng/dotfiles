local lsp_zero = require 'lsp-zero'

lsp_zero.on_attach(
    function(_, bufnr) lsp_zero.default_keymaps { buffer = bufnr } end
)

require('mason').setup {}
require('mason-lspconfig').setup {
    automatic_installation = true,
    ensure_installed = {
        'pyright',
        'lua_ls',
        'html',
        'taplo',
        'dockerls',
        'docker_compose_language_service',
        'biome',
        'marksman',
        'autotools_ls',
        'quick_lint_js',
    },
    handlers = {
        lsp_zero.default_setup,
    },
}
local lspconfig = require 'lspconfig'

local signs = { Error = '', Warn = '', Hint = '', Info = '' }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require('conform').setup {
    formatters_by_ft = {
        python = { 'ruff_fix', 'ruff_format' },
        htmldjango = { 'djlint', 'hlint' },
        html = { 'djlint' },
        lua = { 'stylua' },
        javascript = { 'prettier' },
        json = { 'fixjson' },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

require('lint').linters_by_ft = {
    python = { 'ruff', 'flake8' },
    lua = { 'luacheck' },
    javascript = { 'biomejs' },
    htmldjango = { 'djlint' },
}

vim.diagnostic.config {
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = true,
    float = {
        border = 'rounded',
        source = true,
    },
    severity_sort = true,
}

local util = require 'lspconfig/util'

local function get_python_path(workspace)
    local path = util.path

    -- Check if virtual environment is activated
    if vim.env.VIRTUAL_ENV then
        return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
    end

    -- List of potential virtual environment indicators
    local indicators = { 'pyproject.toml', '.venv', 'requirements.txt' }

    -- Look for virtualenv in workspace directory
    for _, indicator in ipairs(indicators) do
        local match = vim.fn.glob(path.join(workspace, '*', indicator))
        if match ~= '' then
            return path.join(path.dirname(match), 'bin', 'python')
        end
    end

    -- Fallback to system Python
    return 'python'
end

lspconfig.html.setup {
    filetypes = { 'html', 'htmldjango' },
    init_options = {
        configurationSection = { 'html', 'css', 'javascript' },
        embeddedLanguages = {
            css = true,
            javascript = true,
        },
    },
    settings = {},
}

lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
}

lspconfig.pyright.setup {
    before_init = function(_, config)
        config.settings.python.pythonPath = get_python_path(config.root_dir)
    end,
    settings = {
        pyright = {
            disableLanguageServices = false,
            disableOrganizeImports = false,
        },
        python = {
            analysis = {
                autoImportCompletions = true,
                autoSearchPaths = true,
                diagnosticMode = 'workspace',
                typeCheckingMode = 'basic',
                useLibraryCodeForTypes = true,
            },
        },
    },
}

lspconfig.docker_compose_language_service.setup {
    single_file_support = false,
    root_dir = lspconfig.util.root_pattern(
        'docker-compose.yml',
        'docker-compose.yaml'
    ),
}

lspconfig.dockerls.setup {
    settings = {
        docker = {
            languageserver = {
                diagnostics = {
                    deprecatedMaintainer = 'error',
                    directiveCasing = 'warning',
                    emptyContinuationLine = 'ignore',
                    instructionCasing = 'error',
                    instructionCmdMultiple = 'error',
                    instructionEntrypointMultiple = 'error',
                    instructionHealthcheckMultiple = 'error',
                    instructionJSONInSingleQuotes = 'error',
                },
                formatter = {
                    ignoreMultilineInstructions = true,
                },
            },
        },
    },
}

lspconfig.quick_lint_js.setup {}
