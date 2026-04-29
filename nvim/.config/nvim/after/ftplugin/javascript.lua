vim.opt.makeprg = "node %<"

vim.keymap.set("n", ",l", function()
  vim.cmd("make")
end, { desc = "Execute javascript", buffer = true, noremap = true })

local prettierGroup = vim.api.nvim_create_augroup("PrettierFormat", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = prettierGroup,
  pattern = {
    "*.js",
    "*.ts",
    "*.jsx",
    "*.tsx",
    "*.json",
    "*.css",
    "*.html",
    "*.md",
    "*.yaml",
    "*.yml",
  },
  callback = function()
    local filename = vim.fn.expand("%:t")
    run_buf("prettier --stdin-filepath " .. filename)
  end,
})
