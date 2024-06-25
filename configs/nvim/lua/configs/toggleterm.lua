local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then return end

toggleterm.setup {
    direction = 'float',
    float_opts = {
        border = 'rounded',
    },
}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new { cmd = 'lazygit', hidden = true }

function _LAZYGIT_TOGGLE() lazygit:toggle() end

local python = Terminal:new { cmd = 'ipython', hidden = true }

function _PYTHON_TOGGLE() python:toggle() end

local docker = Terminal:new { cmd = 'lazydocker', hidden = true }

function _DOCKER_TOGGLE() docker:toggle() end
