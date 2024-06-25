local opt = vim.opt

opt.autowrite = true -- Enable auto write
opt.clipboard = 'unnamedplus' -- Sync with system clipboard
opt.guifont = 'FiraCode Nerd Font Mono:h11'
opt.showmode = false
opt.spelllang = 'ru_ru,en_us'
opt.spell = true

opt.updatetime = 300 -- Faster completion (4000 ms default).
opt.expandtab = true -- Convert tabs to spaces.
opt.shiftwidth = 4 -- The number of spaces inserted for each indentation.
opt.smartindent = true
opt.tabstop = 4 -- Amount of spaces to insert for a tab.
opt.wrap = false -- Display lines as one long line.
opt.pumheight = 10 -- Maximum number of items in the popup menu.

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- optionally enable 24-bit colour
opt.termguicolors = true

vim.opt.mouse = ''

--- Disable statusline and ruler since we don't need them anyway
opt.statusline = ''
opt.laststatus = 0
opt.ruler = false
opt.colorcolumn = nil

vim.opt.fillchars:append { eob = '·' }
