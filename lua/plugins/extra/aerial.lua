return {
  'stevearc/aerial.nvim',
  -- keys = {
  --   { '<leader>a', '<cmd>AerialToggle!<CR>', desc = 'Toggle aerial' },
  -- },
  config = function()
    require('aerial').setup {
      backends = { 'lsp', 'treesitter', 'markdown', 'man' },
      -- optionally use on_attach to set keymaps when aerial has attached to a buffer
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
        vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
      end,
      open_automatic = true,
      layout = {
        -- These control the width of the aerial window.
        -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        -- min_width and max_width can be a list of mixed types.
        -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
        max_width = { 30, 0.2 },
        width = nil,
        min_width = 30,

        -- key-value pairs of window-local options for aerial window (e.g. winhl)
        win_opts = {},

        -- Determines the default direction to open the aerial window. The 'prefer'
        -- options will open the window in the other direction *if* there is a
        -- different buffer in the way of the preferred direction
        -- Enum: prefer_right, prefer_left, right, left, float
        default_direction = 'prefer_right',

        -- Determines where the aerial window will be opened
        --   edge   - open aerial at the far right/left of the editor
        --   window - open aerial to the right/left of the current window
        placement = 'window',

        -- When the symbols change, resize the aerial window (within min/max constraints) to fit
        resize_to_content = false,

        -- Preserve window size equality with (:help CTRL-W_=)
        preserve_equality = false,

        -- filter_kind = false,
        filter_kind = {
          'Class',
          'Constructor',
          'Enum',
          'Function',
          'Interface',
          'Module',
          'Method',
          'Struct',
        },
      },
    }
    -- vim.kmap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
  end,
}
