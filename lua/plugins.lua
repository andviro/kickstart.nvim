-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup {
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Detect file encoding
  's3rvac/AutoFenc',

  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvimtools/none-ls.nvim',
        config = function()
          require 'configs.null-ls'
        end,
      },
      -- Automatically install LSPs to stdpath for neovim
      {
        'williamboman/mason.nvim',
        config = true,
      },
      {
        'williamboman/mason-lspconfig.nvim',
        config = function()
          require 'configs.mason'
        end,
      },
      -- Additional lua configuration, makes nvim stuff amazing!
      { 'folke/neodev.nvim', opts = {} },

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {}, tag = 'legacy' },
    },
    config = function()
      require 'configs.lspconfig'
    end,
  },

  -- {
  --   'folke/trouble.nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   opts = {
  --     -- your configuration comes here
  --     -- or leave it empty to use the default settings
  --     -- refer to the configuration section below
  --   },
  -- },
  --
  { 'onsails/lspkind-nvim', dependencies = { 'famiu/bufdelete.nvim' } },
  {
    'onsails/diaglist.nvim',
    config = function()
      local map = vim.keymap.set
      require('diaglist').init {}
      map('n', '<leader>q', require('diaglist').open_all_diagnostics, { desc = 'Open diagnostics list' })
      map('n', '<leader>Q', require('diaglist').open_buffer_diagnostics, { desc = 'Open diagnostics list' })
    end,
  },
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'f3fora/cmp-spell',
      'hrsh7th/cmp-calc',
      'lukas-reineke/cmp-rg',
      'hrsh7th/cmp-nvim-lsp-signature-help',
    },
    config = function()
      require 'configs.cmp'
      require 'configs.luasnip'
    end,
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    'ray-x/go.nvim',
    dependencies = { 'ray-x/guihua.lua' },
    config = function()
      require 'configs.go'
    end,
    ft = { 'go' },
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  {
    'ishan9299/nvim-solarized-lua',
    priority = 1000,
    config = function()
      vim.g.solarized_visibility = 'low'
      vim.cmd.colorscheme 'solarized'
    end,
  },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'catppuccin-macchiato'
    end,
  },
  {
    'sainnhe/gruvbox-material',
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
  -- {
  --   'luisiacc/gruvbox-baby',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme 'gruvbox-baby'
  --   end,
  -- },
  -- {
  --   'kepano/flexoki-neovim',
  --   name = 'flexoki',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme 'flexoki-dark'
  --   end,
  -- },
  -- {
  --   'ellisonleao/gruvbox.nvim',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme 'gruvbox'
  --   end,
  -- },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    config = function()
      require 'configs.lualine'
    end,
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    main = 'ibl',
    opts = {
      debounce = 100,
      scope = {
        show_start = false,
        show_end = false,
      },
      indent = {
        char = '┊',
      },
    },
  },

  -- "K" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require 'configs.telescope'
    end,
  },

  {
    'ThePrimeagen/git-worktree.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
  { 'nvim-telescope/telescope-file-browser.nvim' },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
      require 'configs.treesitter'
    end,
  },

  { 'ellisonleao/glow.nvim', config = true, cmd = 'Glow' },

  { 'mbbill/undotree' },

  {
    'vim-pandoc/vim-pandoc',
    dependencies = {
      'vim-pandoc/vim-pandoc-syntax',
    },
  },

  {
    'iamcco/markdown-preview.nvim',
    setup = {
      run = function()
        vim.fn['mkdp#util#install']()
      end,
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require 'configs.nvim-tree'
    end,
  },
  {
    'windwp/nvim-autopairs',
    opts = {
      fast_wrap = {},
      disable_filetype = { 'TelescopePrompt', 'vim' },
    },
    config = function(_, opts)
      require('nvim-autopairs').setup(opts)

      -- setup cmp for autopairs
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  {
    'jay-babu/mason-null-ls.nvim',

    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'jose-elias-alvarez/null-ls.nvim',
    },
    config = function()
      require('mason-null-ls').setup {
        automatic_installation = true,
        ensure_installed = {},
      }
    end,
  },
  {
    'mg979/vim-visual-multi',
    branch = 'master',
    config = function()
      vim.g.VM_maps = {
        ['Select All'] = '<M-n>',
        ['Visual All'] = '<M-n>',
        ['Skip Region'] = '<C-x>',
        ['Increase'] = '+',
        ['Decrease'] = '-',
      }
    end,
  },
  -- enhanced autchdir
  'fmoralesc/vim-extended-autochdir',

  -- python venvs
  {
    'linux-cultist/venv-selector.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-telescope/telescope.nvim',
      'mfussenegger/nvim-dap-python',
      {
        'SmiteshP/nvim-navic',
        config = function()
          require 'configs.navic'
        end,
        event = 'VeryLazy',
      },
      {
        'LunarVim/breadcrumbs.nvim',
        config = function()
          require('breadcrumbs').setup()
        end,
      },
    },
    opts = {
      -- Your options go here
      -- name = "venv",
      -- auto_refresh = false
    },
    event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
      {
        -- Keymap to open VenvSelector to pick a venv.
        '<leader>vs',
        '<cmd>:VenvSelect<cr>',
        -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
        '<leader>vc',
        '<cmd>:VenvSelectCached<cr>',
      },
    },
  },
  -- Highlight CSV columns
  'mechatroner/rainbow_csv',
  -- Neorg
  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {}, -- Loads default behaviour
          ['core.concealer'] = {}, -- Adds pretty icons to your documents
          ['core.dirman'] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = '~/notes',
              },
            },
          },
        },
      }
    end,
  },
  {
    'AntonVanAssche/music-controls.nvim',
    dependencies = {
      'rcarriga/nvim-notify',
    },
  },
  -- {
  --   'folke/flash.nvim',
  --   event = 'VeryLazy',
  --   opts = {},
  --   keys = {
  --   {
  --     's',
  --     mode = { 'n', 'x', 'o' },
  --     function()
  --       require('flash').jump()
  --     end,
  --     desc = 'Flash',
  --   },
  -- {
  --   'S',
  --   mode = { 'n', 'x', 'o' },
  --   function()
  --     require('flash').treesitter()
  --   end,
  --   desc = 'Flash Treesitter',
  -- },
  --   {
  --     'r',
  --     mode = 'o',
  --     function()
  --       require('flash').remote()
  --     end,
  --     desc = 'Remote Flash',
  --   },
  --   {
  --     'R',
  --     mode = { 'o', 'x' },
  --     function()
  --       require('flash').treesitter_search()
  --     end,
  --     desc = 'Treesitter Search',
  --   },
  --   {
  --     '<c-s>',
  --     mode = { 'c' },
  --     function()
  --       require('flash').toggle()
  --     end,
  --     desc = 'Toggle Flash Search',
  --   },
  -- },
  --},
}
