-- Fuzzy Finder (files, lsp, etc)
return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- 'stevearc/aerial.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    -- { 'nvim-telescope/telescope-file-browser.nvim' },
  },
  config = function()
    local telescope = require 'telescope'
    local actions = require 'telescope.actions'
    local action_layout = require 'telescope.actions.layout'
    -- local fb_actions = require('telescope').extensions.file_browser.actions
    require('telescope').load_extension 'git_worktree'

    local map = vim.keymap.set
    local nore_options = { silent = true, remap = false }
    local my_fd = function(opts)
      opts = opts or {}
      opts.cwd = require('core.common').get_cwd()
      require('telescope.builtin').find_files(opts)
    end

    map('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
    map('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
    map('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
    map('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
    map('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
    map('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
    -- See `:help telescope.builtin`
    map('n', '<C-h>', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
    map('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
    map('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })
    map('n', '<C-p>', my_fd, { desc = 'fuzzy find file' })
    -- map({ 'n' }, '<C-j>', require('telescope.builtin').live_grep, nore_options)
    map({ 'n' }, '<C-j>', require('telescope.builtin').lsp_dynamic_workspace_symbols, nore_options)
    -- map({ 'n' }, '<Leader><CR>', require('telescope.builtin').lsp_references, nore_options)
    map({ 'n' }, '<M-i>', require('telescope.builtin').lsp_implementations, nore_options)
    map({ 'n' }, '<M-o>', require('telescope.builtin').lsp_incoming_calls, nore_options)
    -- map({ 'n' }, '<C-j>', require('telescope').extensions.aerial.aerial, nore_options)
    map('n', '<Leader>gr', "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", { silent = true, desc = 'List wo[r]ktrees' })
    map('n', '<Leader>gR', "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", { silent = true, desc = 'c[R]eate worktree' })

    telescope.setup {
      preview = true,
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = 'smart_case', -- or "ignore_case" or "respect_case" or "smart_case"
        },
        ['ui-select'] = {
          require('telescope.themes').get_dropdown {},
        },
        -- file_browser = {
        --   mappings = {
        --     i = {
        --       ['<c-n>'] = fb_actions.create,
        --       ['<c-r>'] = fb_actions.rename,
        --       -- ["<c-h>"] = actions.which_key,
        --       ['<c-h>'] = fb_actions.toggle_hidden,
        --       ['<c-x>'] = fb_actions.remove,
        --       ['<c-p>'] = fb_actions.move,
        --       ['<c-y>'] = fb_actions.copy,
        --       ['<c-a>'] = fb_actions.select_all,
        --     },
        --   },
        -- },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        buffers = {
          ignore_current_buffer = true,
          sort_lastused = true,
        },
        find_command = { 'fd', '--hidden', '--type', 'file', '--follow', '--strip-cwd-prefix' },
      },
      defaults = {
        file_ignore_patterns = {
          '^node_modules/',
          '^.terraform/',
          '%.jpg',
          '%.png',
          '^vendor/',
          '^proto_vendor/',
          '^.env/',
          '^.venv/',
          '^.git/',
          'mock/',
          'fakes/',
        },
        -- used for grep_string and live_grep
        vimgrep_arguments = {
          'rg',
          '--follow',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--no-ignore',
          '--trim',
        },
        mappings = {
          i = {
            -- Close on first esc instead of going to normal mode
            -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua
            ['<esc>'] = actions.close,
            ['<C-j>'] = actions.move_selection_next,
            ['<Down>'] = actions.move_selection_next,
            ['<PageUp>'] = actions.results_scrolling_up,
            ['<PageDown>'] = actions.results_scrolling_down,
            ['<C-u>'] = actions.preview_scrolling_up,
            ['<C-d>'] = actions.preview_scrolling_down,
            ['<C-k>'] = actions.move_selection_previous,
            ['<Up>'] = actions.move_selection_previous,
            ['<C-q>'] = actions.send_selected_to_qflist,
            ['<C-l>'] = actions.send_to_qflist,
            ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
            ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
            ['<cr>'] = actions.select_default,
            ['<c-v>'] = actions.select_vertical,
            ['<c-s>'] = actions.select_horizontal,
            ['<c-t>'] = actions.select_tab,
            ['<c-p>'] = action_layout.toggle_preview,
            ['<c-o>'] = action_layout.toggle_mirror,
            ['<c-h>'] = actions.which_key,
            ['<c-x>'] = actions.delete_buffer,
          },
        },
        prompt_prefix = '> ',
        selection_caret = ' ',
        entry_prefix = '  ',
        multi_icon = '<>',
        initial_mode = 'insert',
        scroll_strategy = 'cycle',
        selection_strategy = 'reset',
        sorting_strategy = 'descending',
        layout_strategy = 'horizontal',
        layout_config = {
          width = 0.95,
          height = 0.85,
          preview_cutoff = 120,
          prompt_position = 'bottom',
          horizontal = {
            preview_width = function(_, cols, _)
              if cols > 200 then
                return math.floor(cols * 0.4)
              else
                return math.floor(cols * 0.6)
              end
            end,
          },
          vertical = { width = 0.9, height = 0.95, preview_height = 0.5 },
          flex = { horizontal = { preview_width = 0.9 } },
        },
        winblend = 0,
        border = true,
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        -- borderchars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
        color_devicons = true,
        use_less = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
      },
    }

    telescope.load_extension 'fzf'
    -- telescope.load_extension 'file_browser'
    -- telescope.load_extension 'aerial'
  end,
}
