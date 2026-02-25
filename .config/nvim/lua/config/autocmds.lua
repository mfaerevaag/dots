local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

autocmd({ 'FocusGained', 'BufEnter', 'CursorHold' }, {
  desc = 'Auto-reload files changed outside nvim',
  callback = function()
    vim.cmd('checktime')
  end,
})

autocmd('FileType', {
  pattern = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.expandtab = true
  end,
})

autocmd('FileType', {
  pattern = { 'javascriptreact', 'typescriptreact' },
  callback = function()
    vim.bo.commentstring = '{/* %s */}'
  end,
})

-- Highlight trailing whitespace
vim.api.nvim_set_hl(0, 'TrailingWhitespace', { bg = '#5c0000' })
vim.fn.matchadd('TrailingWhitespace', '\\s\\+$')

autocmd('BufWritePre', {
  pattern = '*',
  desc = 'Remove trailing whitespace on save',
  callback = function()
    local cursor = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[%s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0, cursor)
  end,
})
