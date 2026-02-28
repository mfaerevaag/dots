return {
  {
    'ViViDboarder/wombat.nvim',
    dependencies = { 'rktjmp/lush.nvim' },
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('wombat_lush')
    end,
  },
}
