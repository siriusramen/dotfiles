
vim.g.mapleader         = ' '

vim.g.have_nerd_font    = true

vim.opt.nu              = true
vim.opt.relativenumber  = true

vim.opt.guicursor       = ''

vim.opt.tabstop         = 2
vim.opt.softtabstop     = 2
vim.opt.shiftwidth      = 2
vim.opt.expandtab       = true

vim.opt.smartindent     = true

vim.opt.wrap            = true

vim.opt.swapfile        = false
vim.opt.backup          = false
vim.opt.undodir         = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undofile        = true

vim.opt.incsearch       = true

vim.opt.termguicolors   = true

vim.opt.scrolloff       = 8
vim.opt.signcolumn      = 'yes'
vim.opt.isfname:append    '@-@'

vim.o.mouse             = 'a'
vim.o.showmode          = false
vim.o.cursorline        = true
vim.o.confirm           = true

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.breakindent       = true

vim.o.ignorecase        = true
vim.o.smartcase         = true

vim.o.splitright        = true
vim.o.splitbelow        = true

vim.o.list              = true
vim.opt.listchars       = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.inccommand        = 'split'

vim.opt.updatetime      = 50

local diagnostic_opts = {
  -- Show signs on top of any other sign, but only for warnings and errors
  signs = { priority = 9999, severity = { min = 'WARN', max = 'ERROR' } },

  -- Show all diagnostics as underline
  underline = { severity = { min = 'HINT', max = 'ERROR' } },

  -- Show more details immediately for errors on the current line
  virtual_lines = false,
  virtual_text = {
    current_line = true,
    severity = { min = 'ERROR', max = 'ERROR' },
  },

  -- Don't update diagnostics when typing
  update_in_insert = false,
}

MiniDeps.later(function() vim.diagnostic.config(diagnostic_opts) end)
