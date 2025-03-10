return {
  {
    'kevinhwang91/nvim-bqf',

    config = function() -- This is the function that runs, AFTER loading
      local bqf = require 'bqf'
      bqf.setup()

    --[[
      -- See `:help telescope.builtin`
      -- Create an autocommand for "BufRead" events
      vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = { "quickfix" },
        callback = function()
          vim.keymap.set('n', 'dd', '<tab>zN')
        end
      })
    --]]
    end,
  },
}
