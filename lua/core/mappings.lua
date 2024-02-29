local map = vim.keymap.set
-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`

local nore_options = { silent = true, remap = false }
local expr_options = { expr = true, silent = true }

map({ 'n', 'v' }, '<Space>', '<C-f>', nore_options)

-- Remap for dealing with word wrap
map('n', 'k', "v:count == -8 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Tab switch buffer
map('n', '<Tab>', ':b#<CR>', { desc = 'alternate buffer' })

map('n', '<leader>u', '<cmd>UndotreeToggle<cr>', { desc = '[U]ntotree toggle' })

map('n', '<leader>gs', '<cmd>Git<cr>', { desc = 'Git status' })
map('n', '<leader>ga', '<cmd>Git add %<cr>', { desc = 'Git add buffer' })
map('n', '<leader>gA', '<cmd>Git add -A .<cr>', { desc = 'Git add all' })
map('n', '<leader>gB', '<cmd>GitBlameToggle<cr>', { desc = 'Toggle Blame' })
map('n', '<leader>gc', '<cmd>Git commit -v<cr>', { desc = 'Git commit' })
map('n', '<leader>gC', '<cmd>Git commit -a -v<cr>', { desc = 'Git commit -a' })
map('n', '<leader>gp', '<cmd>Git push -u origin HEAD<cr>', { desc = 'Git push' })
map('n', '<leader>gu', '<cmd>Git pull<cr>', { desc = 'Git pull' })

-- Diagnostic keymaps
-- map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
-- map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- map('n', '<leader>q', vim.diagnostic.setqflist, { desc = 'Open diagnostics list' })
map('n', '<leader>q', ':TroubleToggle<cr>', { desc = 'Toggle trouble list', remap = false, silent = true })

map({ 'c', 'i' }, '<C-\\>', '<C-^>', { desc = 'switch language', silent = true })
map({ 'c', 'i' }, '<C-/>', '<C-^>', { desc = 'switch language', silent = true })
map({ 'c', 'i' }, '<C-Space>', '<C-^>', { desc = 'switch language', silent = true })

map({ 'n' }, '<C-/>', ':let &l:iminsert = !&l:iminsert<CR>', { desc = 'switch language', silent = true })
map({ 'n' }, '<C-\\>', ':let &l:iminsert = !&l:iminsert<CR>', { desc = 'switch language', silent = true })
map({ 'n' }, '<C-Space>', ':let &l:iminsert = !&l:iminsert<CR>', { desc = 'switch language', silent = true })

map('n', 'k', "v:count == 0 ? 'gk' : 'k'", expr_options)
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", expr_options)

map('n', 'H', '<C-o>', nore_options)
map('n', 'L', '<C-i>', nore_options)

-- mitigate insert-mode hell
map('i', '<C-u>', '<c-g>u<c-u>', nore_options)
map('i', '<C-w>', '<c-g>u<c-w>', nore_options)

-- multi-cursor substitution
-- map('n', '<C-n>', '*Ncgn', nore_options)

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