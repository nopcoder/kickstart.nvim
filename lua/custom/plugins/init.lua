-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-go',
    },
    opts = {},
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-go',
        },
        output_panel = {
          enabled = true,
          open = 'botright split | resize 15',
        },
        quickfix = {
          enabled = true,
          open = false,
        },
      }

      vim.keymap.set('n', '<leader>tr', "<cmd>lua require('neotest').run.run()<CR>", { desc = 'Run Test' })
      vim.keymap.set('n', '<leader>tf', "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { desc = 'Run Test File' })
      vim.keymap.set('n', '<leader>tl', "<cmd>lua require('neotest').run.run_last()<CR>", { desc = 'Run Last Test' })
      vim.keymap.set('n', '<leader>tp', "<cmd>lua require('neotest').output_panel.toggle()<CR>", { desc = 'Toggle Test Output Panel' })
      vim.keymap.set('n', '<leader>ts', "<cmd>lua require('neotest').summary.toggle()<CR>", { desc = 'Toggle Test Summary' })
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    event = 'InsertEnter',
    config = function()
      require('copilot_cmp').setup()
    end,
    dependencies = {
      'zbirenbaum/copilot.lua',
      cmd = 'Copilot',
      config = function()
        require('copilot').setup {
          suggestion = { enabled = false },
          panel = { enabled = false },
        }
      end,
    },
  },
  {
    'duane9/nvim-rg',
  },
}
