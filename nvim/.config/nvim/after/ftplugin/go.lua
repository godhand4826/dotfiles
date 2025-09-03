vim.opt.makeprg='go run %'

vim.keymap.set('n', ',l', '<cmd>!go run %<cr>', { desc = 'Execute javascript', buffer = true, noremap = true })
