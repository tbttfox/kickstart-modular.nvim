-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = 'unnamedplus'

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Show the current filepath in the titlebar
vim.opt.title = true

-- Set my preferred tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Don't do line wrapping. But when I turn it on, align the wraps to the current indent
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.breakindentopt = 'shift:2,min:40,sbr'
vim.opt.showbreak = '>>'

-- Ignore the alt keys for windows
vim.opt.winaltkeys = 'no'

-- Have a common, stored undo file
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath 'data' .. '/undodir'
vim.opt.undofile = true

-- Preview substitutions live, as you type!
vim.opt.incsearch = true
vim.opt.inccommand = 'nosplit'

-- Use 24 bit colors even in the terminal
vim.opt.termguicolors = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8

-- When a bracket is inserted, briefly jump to the matching one
vim.opt.showmatch = true

-- Default folding.  TODO: Get this working with treesitter
vim.opt.foldmethod = 'indent'
vim.opt.foldlevelstart = 99
vim.opt.fml = 0

-- automatically indent.  TODO: Get this working with treesitter
vim.opt.smartindent = false

-- use ripgrep for internal grepping
vim.opt.grepprg = 'rg --vimgrep'

-- Don't make me hit enter when saving, starting, or looping to the top when searching
vim.opt.shortmess:append { W = true, I = true, c = true }

-- Dont show mode since we have a statusline
vim.opt.showmode = false

-- set my preferred font -- only in neovim-qt
vim.opt.guifont = 'Hack NFM:h10'

-- Put a little extra space between the lines
vim.opt.linespace = 1

-- Don't automatically put comment leader on a newline when opening
-- This gets overwritten by the included filetype plugins
-- so I need to remove it every time I set a filetype
vim.api.nvim_create_autocmd({ 'FileType' }, {
  callback = function()
    vim.opt.formatoptions:remove 'o'
  end,
})
