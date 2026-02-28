return {
  { 'NMAC427/guess-indent.nvim', opts = {} },

  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      delay = 0,
      icons = { mappings = vim.g.have_nerd_font },
      spec = {
        { '<leader>f', group = '[F]ile' },
        { '<leader>p', group = '[P]roject' },
        { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },

  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  {
    'nvim-mini/mini.nvim',
    config = function()
      require('mini.ai').setup({ n_lines = 500 })
      require('mini.surround').setup()

      local statusline = require('mini.statusline')
      statusline.setup({ use_icons = vim.g.have_nerd_font })
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },
}
