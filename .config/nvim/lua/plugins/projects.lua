return {
  {
    'ahmedkhalf/project.nvim',
    event = 'VeryLazy',
    config = function()
      require('project_nvim').setup({})
      require('telescope').load_extension('projects')
      vim.keymap.set('n', '<leader>pp', '<cmd>Telescope projects<cr>', { desc = 'Project picker' })
    end,
  },
}
