return {
  {
    'mbbill/undotree',
    event = 'BufEnter',
    keys = {
      {
        '<leader>u',
        vim.cmd.UndotreeToggle,
        mode = '',
        desc = '[U]ndo tree toggle',
      },
    },
  },
}
