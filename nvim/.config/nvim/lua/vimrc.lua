vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'
vim.g.have_nerd_font = true

vim.opt.signcolumn = 'yes'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.ruler = true
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number,screenline'
vim.opt.cursorcolumn = false
vim.opt.scrolloff = 5
vim.opt.breakindent = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.undofile = true
vim.opt.history = 10000
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split'
vim.opt.startofline = true
vim.opt.spell = false
vim.opt.complete:append 'kspell'
vim.opt.completeopt:remove 'preview'
vim.opt.list = false
vim.opt.listchars = {
  tab = '→ ',
  lead = '.',
  trail = '·',
  nbsp = '␣',
  eol = '↵',
  precedes = '«',
  extends = '»',
}

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>', { noremap = true })
vim.keymap.set('n', '<leader>l', '<cmd>set list!<cr>', { desc = 'Toggle vim.opt.list', noremap = true })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message', noremap = true })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message', noremap = true })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages', noremap = true })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list', noremap = true })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode', noremap = true })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window', noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window', noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window', noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window', noremap = true })
vim.keymap.set('n', ']a', ':next<cr>', { desc = 'next file', noremap = true })
vim.keymap.set('n', '[a', ':previous<cr>', { desc = 'previous file', noremap = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Add shortcut to execute javascript with node',
  pattern = 'javascript',
  callback = function()
    vim.keymap.set('n', ',l', '<cmd>!node %<cr>', { desc = 'Execute javascript', buffer = true, noremap = true })
  end,
})
