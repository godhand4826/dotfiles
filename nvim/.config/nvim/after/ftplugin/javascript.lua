vim.opt.makeprg='npm run main'

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Add shortcut to execute javascript with node',
  pattern = 'javascript',
  callback = function()
    vim.keymap.set('n', ',l', '<cmd>!node %<cr>', { desc = 'Execute javascript', buffer = true, noremap = true })
  end,
})
