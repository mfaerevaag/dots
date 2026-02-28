local function find_git_root()
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir = current_file == '' and vim.fn.getcwd()
    or vim.fn.fnamemodify(current_file, ':h')
  local git_root = vim.fn.systemlist(
    'git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel'
  )[1]
  if vim.v.shell_error ~= 0 then
    print('Not a git repository. Searching on current working directory')
    return vim.fn.getcwd()
  end
  return git_root
end

return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable('make') == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('telescope').setup({
        extensions = {
          ['ui-select'] = { require('telescope.themes').get_dropdown() },
        },
      })

      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      local builtin = require('telescope.builtin')
      local map = vim.keymap.set

      map('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      map('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      map('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      map('n', '<leader>sF', function()
        builtin.find_files({ hidden = true })
      end, { desc = '[S]earch [F]iles (hidden)' })
      map('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      map({ 'n', 'v' }, '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      map('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      map('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      map('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      map('n', '<leader>fr', builtin.oldfiles, { desc = 'Recent files' })
      map('n', '<leader>sc', builtin.commands, { desc = '[S]earch [C]ommands' })
      map('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      map('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end, { desc = '[/] Fuzzily search in current buffer' })

      map('n', '<leader>s/', function()
        builtin.live_grep({
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        })
      end, { desc = '[S]earch [/] in Open Files' })

      map('n', '<leader>sn', function()
        builtin.find_files({ cwd = vim.fn.stdpath('config') })
      end, { desc = '[S]earch [N]eovim files' })

      -- Project-scoped searches
      map('n', '<leader>ps', function()
        local git_root = find_git_root()
        if git_root then
          builtin.live_grep({ search_dirs = { git_root } })
        end
      end, { desc = 'Project search (grep)' })

      map('n', '<leader>pf', function()
        local git_root = find_git_root()
        if git_root then
          builtin.find_files({ cwd = git_root })
        end
      end, { desc = 'Project find files' })

      -- LSP keymaps on attach
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('telescope-lsp-attach', { clear = true }),
        callback = function(event)
          local buf = event.buf
          map('n', 'grr', builtin.lsp_references, { buffer = buf, desc = '[G]oto [R]eferences' })
          map('n', 'gri', builtin.lsp_implementations, { buffer = buf, desc = '[G]oto [I]mplementation' })
          map('n', 'grd', builtin.lsp_definitions, { buffer = buf, desc = '[G]oto [D]efinition' })
          map('n', 'gO', builtin.lsp_document_symbols, { buffer = buf, desc = 'Open Document Symbols' })
          map('n', 'gW', builtin.lsp_dynamic_workspace_symbols, { buffer = buf, desc = 'Open Workspace Symbols' })
          map('n', 'grt', builtin.lsp_type_definitions, { buffer = buf, desc = '[G]oto [T]ype Definition' })
        end,
      })
    end,
  },

  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    keys = {
      { '<leader>fd', '<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>', desc = 'File browser' },
    },
    config = function()
      local fb_actions = require('telescope._extensions.file_browser.actions')
      require('telescope').setup({
        extensions = {
          file_browser = {
            initial_mode = 'normal',
            mappings = {
              n = {
                ['h'] = fb_actions.goto_parent_dir,
                ['l'] = require('telescope.actions').select_default,
                ['H'] = fb_actions.toggle_hidden,
              },
            },
          },
        },
      })
      require('telescope').load_extension('file_browser')
    end,
  },
}
