-- ref: https://github.com/folke/tokyonight.nvim
return {
  'folke/tokyonight.nvim',
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'tokyonight-night'

    vim.api.nvim_set_hl(0, 'TrailingSpace', { bg = '#292e42' })
    vim.cmd.call "matchadd('TrailingSpace', '\\s\\+$')"

    vim.api.nvim_set_hl(0, 'LineOverAt', { fg = '#1a1b26', bg = '#e0af68' })
    vim.cmd.call "matchadd('LineOverAt', '\\%81v.')"
  end,
}
