return {
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Detect file encoding
  's3rvac/AutoFenc',

  'nvim-lua/plenary.nvim',
  {
    'stevearc/stickybuf.nvim',
    opts = {},
  },
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
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  'folke/neodev.nvim',

  { 'onsails/lspkind-nvim', dependencies = { 'famiu/bufdelete.nvim' } },

  -- {
  --   'onsails/diaglist.nvim',
  --   config = function()
  --     local map = vim.keymap.set
  --     require('diaglist').init {}
  --     map('n', '<leader>q', require('diaglist').open_all_diagnostics, { desc = 'Open diagnostics list' })
  --     map('n', '<leader>Q', require('diaglist').open_buffer_diagnostics, { desc = 'Open buffer diagnostics list' })
  --   end,
  -- },
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

  {
    'ThePrimeagen/git-worktree.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
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
  -- {
  --   'jay-babu/mason-null-ls.nvim',
  --
  --   event = { 'BufReadPre', 'BufNewFile' },
  --   dependencies = {
  --     'williamboman/mason.nvim',
  --     'jose-elias-alvarez/null-ls.nvim',
  --   },
  --   config = function()
  --     require('mason-null-ls').setup {
  --       automatic_installation = true,
  --       ensure_installed = {},
  --     }
  --   end,
  -- },
  -- enhanced autchdir
  'fmoralesc/vim-extended-autochdir',

  -- Highlight CSV columns
  'mechatroner/rainbow_csv',
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
