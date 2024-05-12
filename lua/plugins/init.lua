return {
  -- NOTE: First, some plugins that don't require any configuration
  { 'folke/neodev.nvim', opts = {} },
  'nvim-lua/plenary.nvim',

  -- Git related plugins
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Detect file encoding
  's3rvac/AutoFenc',
  {
    'vhyrro/luarocks.nvim',
    priority = 1000, -- We'd like this plugin to load first out of the rest
    opts = {}, -- This automatically runs `require("luarocks-nvim").setup()`
  },
  {
    'stevearc/stickybuf.nvim',
    opts = {},
  },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
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
