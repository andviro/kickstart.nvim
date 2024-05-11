return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<leader>t', '<cmd>NvimTreeOpen<cr>', desc = 'Open Nvim[T]ree' },
  },
  config = function()
    local api = require 'nvim-tree.api'
    local function edit_or_open()
      local node = api.tree.get_node_under_cursor()

      if node.nodes ~= nil then
        -- expand or collapse folder
        api.node.open.edit()
      else
        -- open file
        api.node.open.edit()
        -- Close the tree if file was opened
        -- api.tree.close()
      end
    end

    local function my_on_attach(bufnr)
      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)
      vim.keymap.set('n', '<CR>', edit_or_open, opts 'Open')
      vim.keymap.set('n', '<Leader>t', '<CMD>wincmd w<CR>', opts 'Leave')
    end

    require('nvim-tree').setup {
      on_attach = my_on_attach,
      sort_by = 'case_sensitive',
      hijack_cursor = false,
      respect_buf_cwd = false,
      sync_root_with_cwd = false,
      update_focused_file = {
        enable = true,
        update_root = false,
        ignore_list = {},
      },
      system_open = {
        cmd = 'xdg-open',
      },
      view = {
        width = 20,
        adaptive_size = true,
      },
      renderer = {
        group_empty = true,
        icons = {
          show = {
            git = true,
            file = false,
            folder = false,
            folder_arrow = true,
          },
          glyphs = {
            bookmark = '🔖',
            folder = {
              arrow_closed = '⏵',
              arrow_open = '⏷',
            },
            -- git = {
            --   unstaged = '✗',
            --   staged = '✓',
            --   unmerged = '⌥',
            --   renamed = '➜',
            --   untracked = '★',
            --   deleted = '⊖',
            --   ignored = '◌',
            -- },
          },
        },
      },
      filters = {
        dotfiles = false,
        git_ignored = true,
        custom = { '^\\.git$', '^\\.env$' },
      },
    }
    local function open_nvim_tree()
      -- open the tree
      api.tree.open()
      vim.cmd 'wincmd w'
    end
    local Event = api.events.Event
    api.events.subscribe(Event.TreeOpen, function()
      api.tree.change_root(require('core.common').get_cwd())
    end)
    vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })
    vim.api.nvim_create_autocmd('QuitPre', {
      callback = function()
        local tree_wins = {}
        local floating_wins = {}
        local wins = vim.api.nvim_list_wins()
        for _, w in ipairs(wins) do
          local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
          if bufname:match 'NvimTree_' ~= nil then
            table.insert(tree_wins, w)
          end
          if vim.api.nvim_win_get_config(w).relative ~= '' then
            table.insert(floating_wins, w)
          end
        end
        if 1 == #wins - #floating_wins - #tree_wins then
          -- Should quit, so we close all invalid windows.
          for _, w in ipairs(tree_wins) do
            vim.api.nvim_win_close(w, true)
          end
        end
      end,
    })
  end,
}
