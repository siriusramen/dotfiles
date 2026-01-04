local add, later = MiniDeps.add, MiniDeps.later
local now_if_args = _G.Config.now_if_args

now_if_args(function()
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    -- Update tree-sitter parser after plugin is updated
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
  })

  -- Define languages which will have parsers installed and auto enabled
  local languages = {
    -- These are already pre-installed with Neovim. Used as an example.
    'lua',
    'vimdoc',
    'markdown',
    'c',
    'cpp',
    -- Add here more languages with which you want to use tree-sitter
    -- To see available languages:
    -- - Execute `:=require('nvim-treesitter').get_available()`
    -- - Visit 'SUPPORTED_LANGUAGES.md' file at
    --   https://github.com/nvim-treesitter/nvim-treesitter/blob/main
  }
  local isnt_installed = function(lang)
    return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
  end
  local to_install = vim.tbl_filter(isnt_installed, languages)
  if #to_install > 0 then require('nvim-treesitter').install(to_install) end

  -- Enable tree-sitter after opening a file for a target language
  local filetypes = {}
  for _, lang in ipairs(languages) do
    for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
      table.insert(filetypes, ft)
    end
  end
  local ts_start = function(ev) vim.treesitter.start(ev.buf) end
  _G.Config.new_autocmd('FileType', filetypes, ts_start, 'Start tree-sitter')
end)

now_if_args(function()
  add('neovim/nvim-lspconfig')

  -- Use `:h vim.lsp.enable()` to automatically enable language server based on
  -- the rules provided by 'nvim-lspconfig'.
  -- Use `:h vim.lsp.config()` or 'after/lsp/' directory to configure servers.
  -- Uncomment and tweak the following `vim.lsp.enable()` call to enable servers.
  vim.lsp.enable({
    'lua_ls'
  })
end)

later(function()
  add('stevearc/conform.nvim')

  -- See also:
  -- - `:h Conform`
  -- - `:h conform-options`
  -- - `:h conform-formatters`
  require('conform').setup({
    -- Map of filetype to formatters
    -- Make sure that necessary CLI tool is available
    -- formatters_by_ft = { lua = { 'stylua' } },
  })
end)

later(function() add('rafamadriz/friendly-snippets') end)

now_if_args(function()
  add('mason-org/mason.nvim')
  require('mason').setup()
end)

MiniDeps.now(function()
  add('sainnhe/everforest')
  vim.cmd('color everforest')
end)

MiniDeps.later(function()
  add('everviolet/nvim')
  add('rebelot/kanagawa.nvim')
  add('ellisonleao/gruvbox.nvim')
  add('rose-pine/neovim')
  add('ramojus/mellifluous.nvim')
  add('uhs-robert/oasis.nvim')
end)

MiniDeps.now(function()
  add('pteroctopus/faster.nvim')
end)

MiniDeps.later(function()
  add('christoomey/vim-tmux-navigator')
end)

