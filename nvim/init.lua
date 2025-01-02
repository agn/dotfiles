vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")

-- fat cursor
vim.opt.guicursor = ""
vim.opt.backup = false
vim.opt.termguicolors = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.scrolloff=10

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true

vim.opt.textwidth = 78
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.statusline = "%<%f %h%w%m%r%=<%b,0x%B> %-14.(%l,%c%V%) %-6y %P"

-- disable mouse
vim.opt.mouse = ''

vim.cmd.colorscheme("tokyonight-night")
--vim.cmd.colorscheme("kanagawa-dragon")
vim.cmd.highlight("Visual cterm=reverse gui=reverse")

-- remove highlighting when Esc is pressed
vim.keymap.set('n', '<Esc>', "<cmd>nohlsearch<CR>")

-- fzf-lua
--vim.keymap.set('n', '<leader>ff', ':FzfLua files cwd=~<CR>')
vim.keymap.set('n', '<leader>ff', ':FzfLua files')
vim.keymap.set('n', '<leader>rg', ':FzfLua live_grep_native<CR>')
vim.keymap.set('n', '<leader>gt', ':FzfLua git_files<CR>')
vim.keymap.set('n', '<leader>gb', ':FzfLua git_blame<CR>')
vim.keymap.set('n', '<leader>bf', ':FzfLua buffers<CR>')

-- nvim-tree 
require("nvim-tree").setup()
vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>')

-- disable arrow keys 
vim.keymap.set('n', '<left>', '')
vim.keymap.set('n', '<right>', '')
vim.keymap.set('n', '<up>', '')
vim.keymap.set('n', '<down>', '')

-- highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Hightlight selection on yank',
  group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank { timeout = 230 }
  end,
})

