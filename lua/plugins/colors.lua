return {
  -- {
  --   'phha/zenburn.nvim',
  --   config = function()
  --     require('zenburn').setup()
  --   end,
  -- },
  {
    'savq/melange-nvim',
    config = function()
      -- vim.cmd 'colorscheme melange'
    end,
  },
  {
    'nyoom-engineering/oxocarbon.nvim',
    -- Add in any other configuration;
    --   event = foo,
    --   config = bar
    --   end,
  },
  { 'srcery-colors/srcery-vim', name = 'srcery' },
  {
    'challenger-deep-theme/vim',
    name = 'challenger-deep',
    config = function()
      -- vim.cmd 'colorscheme challenger_deep'
    end,
  },
  {
    'jacoborus/tender.vim',
    config = function()
      -- vim.cmd 'colorscheme tender'
    end,
  },
  {
    'pauchiner/pastelnight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'ramojus/mellifluous.nvim',
    -- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
    config = function()
      require('mellifluous').setup {} -- optional, see configuration section.
      -- vim.cmd 'colorscheme mellifluous'
    end,
  },
  { 'kepano/flexoki-neovim', name = 'flexoki' },
  { 'bluz71/vim-nightfly-colors', name = 'nightfly', lazy = false, priority = 1000 },
  {
    'olivercederborg/poimandres.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('poimandres').setup {
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
      }
    end,

    -- optionally set the colorscheme within lazy config
    init = function()
      -- vim.cmd 'colorscheme poimandres'
    end,
  },
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000, -- Ensure it loads first
    config = function()
      -- vim.cmd [[colorscheme onedark]]
    end,
  },
  {
    'dasupradyumna/midnight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd [[colorscheme midnight]]
    end,
  },
  {
    'tinted-theming/base16-vim',
  },
  {
    'kvrohit/rasmus.nvim',
    config = function()
      -- Configure the appearance
      vim.g.rasmus_italic_functions = true
      vim.g.rasmus_bold_functions = true

      -- Set the colorscheme variant to monochrome
      -- vim.g.rasmus_variant = 'monochrome'

      -- Load the colorscheme
      -- vim.cmd [[colorscheme rasmus]]
    end,
  },
  {
    'axvr/photon.vim',
  },
  {
    'sainnhe/everforest',
    config = function()
      vim.g.everforest_background = 'hard'
      vim.cmd 'colorscheme everforest'
    end,
  },
  {
    'mcchrish/zenbones.nvim',
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = {
      'rktjmp/lush.nvim',
    },
    config = function()
      -- vim.cmd 'colorscheme zenbones'
    end,
  },
  {
    'pappasam/papercolor-theme-slim',
    config = function()
      -- vim.cmd 'colorscheme PaperColorSlim'
    end,
  },
  {
    'mhartington/oceanic-next',
  },
  {
    'EdenEast/nightfox.nvim',
    config = function()
      -- vim.cmd 'colorscheme terafox'
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        overrides = function(colors)
          local theme = colors.theme
          return {
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
          }
        end,
      }
      -- vim.cmd 'colorscheme kanagawa'
    end,
  },
  -- {
  --   'ishan9299/nvim-solarized-lua',
  --   priority = 1000,
  --   config = function()
  --     vim.g.solarized_visibility = 'low'
  --     -- vim.cmd 'colorscheme solarized'
  --   end,
  -- },
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      -- local bg = '#011628'
      -- local bg_dark = '#011423'
      -- local bg_highlight = '#143652'
      -- local bg_search = '#0A64AC'
      -- local bg_visual = '#275378'
      -- local fg = '#CBE0F0'
      -- local fg_dark = '#B4D0E9'
      -- local fg_gutter = '#627E97'
      -- local border = '#547998'

      require('tokyonight').setup {
        transparent = false,
        -- style = 'night',
        -- on_colors = function(colors)
        --   colors.bg = bg
        --   colors.bg_dark = bg_dark
        --   colors.bg_float = bg_dark
        --   colors.bg_highlight = bg_highlight
        --   colors.bg_popup = bg_dark
        --   colors.bg_search = bg_search
        --   colors.bg_sidebar = bg_dark
        --   colors.bg_statusline = bg_dark
        --   colors.bg_visual = bg_visual
        --   colors.border = border
        --   colors.fg = fg
        --   colors.fg_dark = fg_dark
        --   colors.fg_float = fg
        --   colors.fg_gutter = fg_gutter
        --   colors.fg_sidebar = fg_dark
        -- end,
      }
      -- vim.cmd 'colorscheme tokyonight'
    end,
  },
  {
    'romainl/Apprentice',
    config = function()
      -- vim.cmd 'colorscheme apprentice'
    end,
  },

  {
    'hardselius/warlock',
    config = function()
      -- vim.cmd 'colorscheme warlock'
    end,
  },
  {
    'craftzdog/solarized-osaka.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('solarized-osaka').setup {
        transparent = true,
      }
      -- vim.cmd 'colorscheme solarized-osaka'
    end,
  },
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('solarized').setup {
        theme = 'neo', -- or 'neo'
        -- palette = 'selenized',
      }
      -- vim.o.background = 'dark' -- or 'light'
      -- vim.cmd.colorscheme 'solarized'
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      -- vim.cmd 'colorscheme catppuccin-macchiato'
    end,
  },
  {
    'sainnhe/gruvbox-material',
    priority = 1000,
    config = function()
      -- vim.cmd 'colorscheme gruvbox-material'
    end,
  },
}
