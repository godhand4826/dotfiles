vim.opt.makeprg='npm run main'

vim.keymap.set('n', ',l', '<cmd>!node %<cr>', { desc = 'Execute javascript', buffer = true, noremap = true })
