vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '=ap', "ma=ap'a")

-- greatest remap ever
vim.keymap.set('x', '<leader>p', [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d')

vim.keymap.set('n', '<leader>sr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Search & Replace' })

vim.keymap.set('n', '<leader>tn', '<cmd>:set rnu!<CR>', { desc = 'Toggle relative number' })

vim.keymap.set('n', '<TAB>', '<cmd>:bnext<CR>', { noremap = true })
vim.keymap.set('n', '<BS>', '<cmd>:bprev<CR>', { noremap = true })

vim.keymap.set('n', 'grd', '<cmd>lua vim.lsp.buf.definition()<CR>', {desc = 'Goto Definition' })
vim.keymap.set('n', 'grD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {desc = 'Goto Declaration' })

vim.keymap.set('n', '<leader>lf', function()
  require('conform').format { async = true, lsp_format = 'fallback' }
end, { desc = 'Format buffer' })

vim.keymap.set('n', '<leader>e', function()
  if require('mini.files').get_explorer_state() == nil then
    require('mini.files').open()
  else
    require('mini.files').close()
  end
end, { desc = 'Explorer' })

vim.keymap.set('n', '<leader>f', '<cmd>Pick files<CR>', { desc = 'Files' })
vim.keymap.set('n', '<leader>g', '<cmd>Pick grep<CR>', { desc = 'Grep' })
vim.keymap.set('n', '<leader>bb', '<cmd>Pick buffers<CR>', { desc = 'Buffers' })
vim.keymap.set('n', '<leader>bd', '<cmd>lua MiniBufremove.delete<CR>', { desc = 'Delete buffer' })
vim.keymap.set('n', '<leader>h', '<cmd>Pick help<CR>', { desc = 'Help' })
vim.keymap.set('n', '<leader>cs', '<cmd>Pick colorschemes<CR>', { desc = 'Colorscheme' })
vim.keymap.set('n', '<leader>sd', '<cmd>Pick diagnostic<CR>', { desc = 'Diagnostic' })

-- vim: ts=2 sts=2 sw=2 et
