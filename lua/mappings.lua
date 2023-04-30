local map = vim.keymap.set
-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`

local nore_options = { silent = true, remap = false }
local expr_options = { expr = true, silent = true }

local my_fd = function(opts)
  opts = opts or {}
  opts.cwd = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
  if vim.v.shell_error ~= 0 then
    -- if not git then active lsp client root
    -- will get the configured root directory of the first attached lsp. You will have problems if you are using multiple lsps
    local client = vim.lsp.get_active_clients()[1]
    if client then
      opts.cwd = client.config.root_dir
    else
      opts.cwd = vim.fn.expand '%:p:h'
    end
  end
  require('telescope.builtin').find_files(opts)
end

map({ 'n', 'v' }, '<Space>', '<C-f>', nore_options)

-- Remap for dealing with word wrap
map('n', 'k', "v:count == -8 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

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
-- Tab switch buffer
map('n', '<Tab>', ':b#<CR>', { desc = 'alternate buffer' })

map('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
map('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
map('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
map('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
map('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
map('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

map('n', '<leader>gs', '<cmd>Git<cr>', { desc = 'Git status' })
map('n', '<leader>ga', '<cmd>Git add %<cr>', { desc = 'Git add buffer' })
map('n', '<leader>gA', '<cmd>Git add -A .<cr>', { desc = 'Git add all' })
map('n', '<leader>gB', '<cmd>GitBlameToggle<cr>', { desc = 'Toggle Blame' })
map('n', '<leader>gc', '<cmd>Git commit -v<cr>', { desc = 'Git commit' })
map('n', '<leader>gC', '<cmd>Git commit -a -v<cr>', { desc = 'Git commit -a' })
map('n', '<leader>gp', '<cmd>Git push -u origin HEAD<cr>', { desc = 'Git push' })
map('n', '<leader>gu', '<cmd>Git pull<cr>', { desc = 'Git pull' })

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

map({ 'c', 'i' }, '<C-\\>', '<C-^>', { desc = 'switch language' })
map({ 'c', 'i' }, '<C-/>', '<C-^>', { desc = 'switch language' })
map({ 'c', 'i' }, '<C-Space>', '<C-^>', { desc = 'switch language' })

map({ 'n' }, '<C-/>', ':let &l:iminsert = !&l:iminsert<CR>', { desc = 'switch language' })
map({ 'n' }, '<C-\\>', ':let &l:iminsert = !&l:iminsert<CR>', { desc = 'switch language' })
map({ 'n' }, '<C-Space>', ':let &l:iminsert = !&l:iminsert<CR>', { desc = 'switch language' })

map('n', 'k', "v:count == 0 ? 'gk' : 'k'", expr_options)
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", expr_options)

map('n', 'H', '<C-o>', nore_options)
map('n', 'L', '<C-i>', nore_options)

-- mitigate insert-mode hell
map('i', '<C-u>', '<c-g>u<c-u>', nore_options)
map('i', '<C-w>', '<c-g>u<c-w>', nore_options)

-- multi-cursor substitution
map('n', '<C-n>', '*Ncgn', nore_options)

-- emacs-like insert mode
map({ 'c', 'i' }, '<C-A>', '<Home>', nore_options)
map({ 'c' }, '<C-B>', '<Left>', nore_options)
map({ 'c' }, '<C-D>', '<Del>', nore_options)
map({ 'c' }, '<C-E>', '<End>', nore_options)
map({ 'c', 'i' }, '<C-F>', '<Right>', nore_options)
map({ 'c' }, '<C-N>', '<Down>', nore_options)
map({ 'c' }, '<C-P>', '<Up>', nore_options)
map({ 'c' }, '<Esc><C-B>', '<S-Left>', nore_options)
map({ 'c' }, '<Esc><C-F>', '<S-Right>', nore_options)

-- misc
map('n', '<leader><Tab>', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle NvimTree' })
