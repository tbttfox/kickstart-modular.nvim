return {
  {
    'adoyle-h/lsp-toggle.nvim',
    lazy = false,

    config = function()
      require('lsp-toggle').setup {
        create_cmds = true,
        telescope = true,
      }
    end,
  },
}
