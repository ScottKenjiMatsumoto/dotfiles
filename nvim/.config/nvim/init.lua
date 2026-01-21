vim.opt.mouse = 'a' -- enable mouse (all modes)
vim.opt.number = true
-- vim.g.term_opencmd = 'split term://%s'

-- Basic settings
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.cmd('colorscheme habamax') -- Setting colorscheme
vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NonText guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
]])

-- xclip
vim.g.clipboard = {
  name = 'xclip',
  copy = {
    ['+'] = 'xclip -selection clipboard',
    ['*'] = 'xclip -selection primary',
  },
  paste = {
    ['+'] = 'xclip -selection clipboard -o',
    ['*'] = 'xclip -selection primary -o',
  },
  cache_enabled = 1,
}

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.api.nvim_set_keymap(
    'n',
    '\\c ',
    '<Plug>(comment_toggle_linewise_current)',
    { noremap = false, silent = true }
)
vim.api.nvim_set_keymap(
    'v',
    '\\c ',
    '<Plug>(comment_toggle_linewise_visual)',
    { noremap = false, silent = true }
)
vim.keymap.set('v', '*', function()
  vim.cmd('norm! "sy')
  local selection = vim.fn.getreg('s')
  -- Escape special characters for literal search
  selection = vim.fn.escape(selection, '/\\')
  selection = selection:gsub('\n', '\\n')
  vim.fn.setreg('/', '\\V' .. selection)
  vim.cmd('norm! n')
end)
