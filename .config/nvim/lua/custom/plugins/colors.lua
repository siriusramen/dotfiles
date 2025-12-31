return {
  {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      require('everforest').setup {}
      vim.cmd.colorscheme 'everforest'
    end,
  },
  -- for testing colors
  -- { 'rktjmp/lush.nvim', name = 'lush' },
  { 'everviolet/nvim', name = 'evergarden' },
  { 'rebelot/kanagawa.nvim', name = 'kanagawa' },
  { 'ellisonleao/gruvbox.nvim', name = 'gruvbox' },
  { 'rose-pine/neovim', name = 'rose-pine' },
  { 'ramojus/mellifluous.nvim', name = 'mellifluous' },
  { 'uhs-robert/oasis.nvim', name = 'oasis' },
}
