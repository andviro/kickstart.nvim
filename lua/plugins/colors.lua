return {
  {
    'ishan9299/nvim-solarized-lua',
    priority = 1000,
    config = function()
      vim.g.solarized_visibility = 'low'
      vim.cmd 'colorscheme solarized'
    end,
  },
  -- {
  --   'craftzdog/solarized-osaka.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('solarized-osaka').setup {
  --       transparent = false, -- Enable this to disable setting the background color
  --       -- light_style = 'night',
  --     }
  --     vim.cmd 'colorscheme solarized-osaka'
  --   end,
  -- },
  -- {
  --    'maxmx03/solarized.nvim',
  --    lazy = false,
  --    priority = 1000,
  --    config = function()
  --      require('solarized').setup {
  --        theme = 'neo', -- or 'neo'
  --        -- palette = 'selenized',
  --      }
  --      vim.o.background = 'dark' -- or 'light'
  --      vim.cmd.colorscheme 'solarized'
  --    end,
  --  },
  -- {
  --   'catppuccin/nvim',
  --   name = 'catppuccin',
  --   priority = 1000,
  -- },
  -- {
  --   'sainnhe/gruvbox-material',
  --   priority = 1000,
  -- },
}
