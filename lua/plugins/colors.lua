return {
  {
    'sho-87/kanagawa-paper.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd 'colorscheme kanagawa-paper'
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      -- vim.cmd 'colorscheme rose-pine'
    end,
  },
  {
    'dgox16/oldworld.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd 'colorscheme oldworld'
    end,
  },
  {
    '0xstepit/flow.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require('flow').setup {
        dark_theme = true, -- Set the theme with dark background.
        high_contrast = false, -- Make the dark background darker or the light background lighter.
        transparent = false, -- Set transparent background.
        fluo_color = 'pink', -- Color used as fluo. Available values are pink, yellow, orange, or green.
        mode = 'desaturate', -- Mode of the colors. Available values are: dark, bright, desaturate, or base.
        aggressive_spell = false, -- Use colors for spell check.
      }
      -- vim.cmd 'colorscheme flow'
    end,
  },
  {
    'srcery-colors/srcery-vim',
    name = 'srcery',
    config = function()
      -- vim.cmd 'colorscheme srcery'
    end,
  },
  {
    'ramojus/mellifluous.nvim',
    -- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
    config = function()
      require('mellifluous').setup {
        colorset = 'kanagawa_dragon',
      } -- optional, see configuration section.
      -- vim.cmd 'colorscheme mellifluous'
    end,
  },
  { 'kepano/flexoki-neovim', name = 'flexoki' },
  { 'bluz71/vim-nightfly-colors', name = 'nightfly', lazy = false, priority = 1000 },
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000, -- Ensure it loads first
    config = function()
      -- vim.cmd [[colorscheme onedark]]
    end,
  },
  {
    'axvr/photon.vim',
  },
  {
    'sainnhe/everforest',
    config = function()
      vim.g.everforest_background = 'hard'
      -- vim.cmd 'colorscheme everforest'
    end,
  },
  {
    'sainnhe/edge',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.edge_enable_italic = true
      -- vim.cmd.colorscheme 'edge'
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
      vim.g.zenbones = { darkness = 'warm' }
      -- vim.cmd 'colorscheme rosebones'
      -- vim.cmd 'colorscheme zenbones'
      -- vim.cmd 'colorscheme zenwritten'
    end,
  },
  {
    'kyazdani42/blue-moon',
    config = function()
      -- vim.opt.termguicolors = true
      -- vim.cmd 'colorscheme blue-moon'
    end,
  },
  {
    'pbrisbin/vim-colors-off',
    name = 'off',
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
      -- vim.cmd 'colorscheme nightfox'
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
      -- vim.cmd 'colorscheme kanagawa-dragon'
      -- vim.cmd 'hi link LspInlayHint LineNr'
      -- vim.cmd 'hi WinBar ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE cterm=bold gui=bold'
      -- vim.cmd 'hi WinBarNC ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE cterm=bold gui=bold'
    end,
  },
  {
    'calind/selenized.nvim',
    priority = 1000,
    config = function()
      -- vim.cmd 'colorscheme selenized'
      vim.cmd 'hi link NonText WinSeparator'
    end,
  },
  {
    'ishan9299/nvim-solarized-lua',
    priority = 1000,
    config = function()
      -- vim.g.solarized_visibility = 'normal'
      vim.g.solarized_visibility = 'low'
      vim.cmd 'colorscheme solarized'
      vim.cmd 'hi link LspInlayHint LineNr'
      vim.cmd 'hi WinBar ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE cterm=bold gui=bold'
      vim.cmd 'hi WinBarNC ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE cterm=bold gui=bold'
    end,
  },
  {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('bamboo').setup {
        style = 'multiplex',
        -- optional configuration here
      }
      -- require('bamboo').load()
    end,
  },
  {
    'rockyzhang24/arctic.nvim',
    branch = 'v2',
    dependencies = { 'rktjmp/lush.nvim' },
    config = function()
      -- vim.cmd.colorscheme 'arctic'
    end,
  },
  -- {
  --   'maxmx03/solarized.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   ---@type solarized.config
  --   opts = {
  --     variant = 'spring',
  --     palette = 'selenized',
  --   },
  --   config = function(_, opts)
  --     require('solarized').setup(opts)
  --     vim.cmd.colorscheme 'solarized'
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
        style = 'storm',
        transparent = false,
        styles = {
          floats = 'transparent',
          sidebars = 'transparent',
        },
        on_colors = function(colors)
          colors.bg = '#001a1d'
        end,
      }
      -- vim.cmd 'colorscheme solarized-osaka'
      vim.cmd 'hi link LspInlayHint LineNr'
      vim.cmd 'hi WinBar ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE cterm=bold gui=bold'
      vim.cmd 'hi WinBarNC ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE cterm=bold gui=bold'
    end,
  },
  -- {
  --   'Tsuzat/NeoSolarized.nvim',
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- vim.cmd [[ colorscheme NeoSolarized ]]
  --   end,
  -- },
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
