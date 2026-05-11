vim.opt.makeprg = "go build %"

vim.keymap.set("n", ",l", function()
  vim.cmd("!go run %")
end, { desc = "Execute golang", buffer = true, noremap = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = golangGroup,
  pattern = { "*.go" },
  callback = function()
    run_buf("gofmt")
  end,
})
