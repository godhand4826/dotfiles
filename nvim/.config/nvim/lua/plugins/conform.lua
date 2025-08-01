-- autoformat
-- ref: https://github.com/stevearc/conform.nvim
return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_no_formatters = true,
    notify_on_error = true,
    format_on_save = function(bufnr)
      local enabled_ft = {}
      if not enabled_ft[vim.bo[bufnr].filetype] then
        return false
      end

      local disable_fallback = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_fallback[vim.bo[bufnr].filetype],
      }
    end,

    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
    },
  },
}
