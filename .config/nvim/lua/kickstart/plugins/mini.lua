return {
  {
    'echasnovski/mini.nvim',
    config = function()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      require('mini.align').setup()

      require('mini.surround').setup()

      require('mini.icons').setup()

      require('mini.pairs').setup()

      require('mini.files').setup()

      require('mini.pick').setup()

      require('mini.bufremove').setup()

      require('mini.extra').setup()

      require('mini.indentscope').setup()

      local hipatterns = require 'mini.hipatterns'
      local hi_words = MiniExtra.gen_highlighter.words
      hipatterns.setup {
        highlighters = {
          -- Highlight a fixed set of common words. Will be highlighted in any place,
          -- not like "only in comments".
          fixme = hi_words({ 'FIXME', 'Fixme', 'fixme' }, 'MiniHipatternsFixme'),
          hack = hi_words({ 'HACK', 'Hack', 'hack' }, 'MiniHipatternsHack'),
          todo = hi_words({ 'TODO', 'Todo', 'todo' }, 'MiniHipatternsTodo'),
          note = hi_words({ 'NOTE', 'Note', 'note' }, 'MiniHipatternsNote'),
          -- Highlight hex color string (#aabbcc) with that color as a background
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      }

      local miniclue = require 'mini.clue'
      miniclue.setup {
        triggers = {
          -- Leader triggers
          { mode = 'n', keys = '<Leader>' },
          { mode = 'x', keys = '<Leader>' },

          -- `g` key
          { mode = 'n', keys = 'g' },
          { mode = 'x', keys = 'g' },

          -- Marks
          { mode = 'n', keys = "'" },
          { mode = 'n', keys = '`' },
          { mode = 'x', keys = "'" },
          { mode = 'x', keys = '`' },

          -- Registers
          { mode = 'n', keys = '"' },
          { mode = 'x', keys = '"' },
          { mode = 'i', keys = '<C-r>' },
          { mode = 'c', keys = '<C-r>' },

          -- Window commands
          { mode = 'n', keys = '<C-w>' },

          -- `z` key
          { mode = 'n', keys = 'z' },
          { mode = 'x', keys = 'z' },
        },

        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
        },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
