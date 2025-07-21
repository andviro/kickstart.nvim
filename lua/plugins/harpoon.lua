-- local conf = require('telescope.config').values
-- local function toggle_telescope(harpoon_files)
--   local file_paths = {}
--   for _, item in ipairs(harpoon_files.items) do
--     table.insert(file_paths, item.value)
--   end
--
--   require('telescope.pickers')
--     .new({}, {
--       prompt_title = 'Harpoon',
--       finder = require('telescope.finders').new_table {
--         results = file_paths,
--       },
--       previewer = conf.file_previewer {},
--       sorter = conf.generic_sorter {},
--     })
--     :find()
-- end
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      '<leader>m',
      function()
        require('harpoon'):list():add()
      end,
      desc = 'Harpoon append',
    },
    {
      '<leader>j',
      function()
        local harpoon = require 'harpoon'
        local fzf_lua = require 'fzf-lua'
        fzf_lua.register_ui_select()
        harpoon.ui:toggle_quick_menu(harpoon:list())
        -- toggle_telescope(require('harpoon'):list())
        fzf_lua.deregister_ui_select()
      end,
      desc = 'Op[e]n harpoon window',
    },
  },
}
