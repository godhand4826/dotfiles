vim.opt.makeprg = "clang++ -Wall -std=c++23 % -o %<"

vim.keymap.set("n", ",l", function()
  vim.cmd("make")
  vim.cmd("!./%<")
end, { desc = "Execute C++", buffer = true, noremap = true })

local clangGroup = vim.api.nvim_create_augroup("ClangFormat", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = clangGroup,
  pattern = { "*.cpp", "*.cc", "*.h", "*.hpp" },
  callback = function()
    local filename = vim.fn.expand("%:t")
    run_buf("clang-format --assume-filename=" .. filename)
  end,
})
