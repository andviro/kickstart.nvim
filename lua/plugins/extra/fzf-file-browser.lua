return {
  'michel-garcia/fzf-lua-file-browser.nvim',
  dependencies = {
    'ibhagwan/fzf-lua',
  },
  config = function()
    local file_browser = require 'fzf-lua-file-browser'
    local actions = require 'fzf-lua-file-browser.actions'
    file_browser.setup {
      actions = {
        ['ctrl-l'] = actions.rename,
        -- or even use your own callback
        ['ctrl-m'] = function(selected, opts)
          if next(selected) then
            print(selected[1])
          end
          file_browser.browse(opts) -- use this instruction to resume
        end,
      },
    }
  end,
  keys = {
    {
      '<Leader><Tab>',
      function()
        require('fzf-lua-file-browser').browse { silent = true }
      end,
      desc = 'Open file browser',
    },
  },
}
