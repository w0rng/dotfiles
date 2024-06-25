function _LAZYGIT_TOGGLE()
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new { cmd = 'lazygit', hidden = true }
    lazygit:toggle()
end

function _PYTHON_TOGGLE()
    local Terminal = require('toggleterm.terminal').Terminal
    local python = Terminal:new { cmd = 'ipython', hidden = true }
    python:toggle()
end

function _DOCKER_TOGGLE()
    local Terminal = require('toggleterm.terminal').Terminal
    local docker = Terminal:new { cmd = 'lazydocker', hidden = true }
    docker:toggle()
end

function docker_fix()
    local filename = vim.fn.expand '%:t'
    local types = {
        'docker-compose.yml',
        'docker-compose.yaml',
        'compose.yml',
        'compose.yaml',
    }

    for _, v in pairs(types) do
        if v == filename then vim.bo.filetype = 'yaml.docker-compose' end
    end
end

function ZenMode()
    require('true-zen.ataraxis').toggle()
    require('twilight').toggle()
end

vim.cmd [[au BufRead * lua docker_fix()]]
