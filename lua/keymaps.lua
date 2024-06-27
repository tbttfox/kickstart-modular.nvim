-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<C-Up>', ':wincmd k<CR>', { desc = 'Resize the current window up' })
vim.keymap.set('n', '<C-Down>', ':wincmd j<CR>', { desc = 'Resize the current window down' })
vim.keymap.set('n', '<C-Left>', ':wincmd h<CR>', { desc = 'Resize the current window left' })
vim.keymap.set('n', '<C-Right>', ':wincmd l<CR>', { desc = 'Resize the current window right' })

-- Use tab S-tab to switch buffers in Normal mode
vim.keymap.set('n', '<tab>', ':bn<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-tab>', ':bp<CR>', { desc = 'Prev buffer' })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- n always goes next, N always goes prev
vim.keymap.set({ 'n', 'o', 'x', 'v' }, 'n', "'Nn'[v:searchforward]", { desc = 'NEXT search result', expr = true })
vim.keymap.set({ 'n', 'o', 'x', 'v' }, 'N', "'nN'[v:searchforward]", { desc = 'PREV search result', expr = true })

vim.keymap.set('n', '<leader>S', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Start :s/-ing the current word' })

vim.keymap.set('n', '<F11>', ':<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>', { desc = 'Toggle whitespace highlighting' })
vim.keymap.set('n', '<F10>', ':set expandtab!<CR>:%retab!<CR>', { desc = 'toggle tabs/spaces' })

-- visual mode keymaps
vim.keymap.set('v', '>', '>gv', { desc = 'indent' })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move visual selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move visual selection up' })
vim.keymap.set('v', '<leader>p', [["_dP]], { desc = 'Clobber paste over visual selection' })
vim.keymap.set('v', '<leader>d', [["_d]], { desc = 'Delete to black hole' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
