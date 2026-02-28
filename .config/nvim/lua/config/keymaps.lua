local map = vim.keymap.set

map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Window navigation
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Terminal window navigation
map('t', '<C-h>', '<C-\\><C-n><C-w>h', { desc = 'Focus left from terminal' })
map('t', '<C-j>', '<C-\\><C-n><C-w>j', { desc = 'Focus down from terminal' })
map('t', '<C-k>', '<C-\\><C-n><C-w>k', { desc = 'Focus up from terminal' })
map('t', '<C-l>', '<C-\\><C-n><C-w>l', { desc = 'Focus right from terminal' })

-- Whitespace
map('n', '<leader>tw', '<cmd>set list!<cr>', { desc = 'Toggle whitespace' })

vim.api.nvim_create_user_command('WhitespaceCleanup', function()
  local pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd([[%s/\s\+$//e]])
  vim.api.nvim_win_set_cursor(0, pos)
end, { desc = 'Remove trailing whitespace' })
map('n', '<leader>fw', '<cmd>WhitespaceCleanup<CR>', { desc = 'Cleanup whitespace' })
