return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'c', 'cpp', 'lua', 'luadoc', 'verilog', 'vim', 'vimdoc' },
      auto_install = true,
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
