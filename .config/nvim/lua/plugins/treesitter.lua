return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      local filetypes = {
        'bash', 'c', 'css', 'diff', 'html', 'javascript', 'json', 'lua', 'luadoc',
        'markdown', 'markdown_inline', 'query', 'rust', 'toml', 'tsx', 'typescript', 'vim', 'vimdoc',
      }
      require('nvim-treesitter').install(filetypes)
      vim.api.nvim_create_autocmd('FileType', {
        pattern = filetypes,
        callback = function()
          pcall(vim.treesitter.start)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
