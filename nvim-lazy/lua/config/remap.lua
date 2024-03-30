
-- Move highlighted text up/down
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("i", "<C-c>", "<Esc>")


-- LSP
-- Most of these are set by default by lsp-zero
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Goto definition" })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Goto declaration" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover info" })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Goto implementation" })
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = "Signature help" })

vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set('n', '<leader>crn', vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set('n', '<leader>cfo', vim.lsp.buf.format, { desc = "Code format" })
--nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
--nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
--nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
--nkeymap('gs', ':lua vim.lsp.buf.document_symbol()<cr>')
--nkeymap('gS', ':lua vim.lsp.buf.workspace_symbol()<cr>')
--nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
--nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')

-- Default maps from lsp-zero
-- <F2>: rename symbol under cursor (same as <leader>crn)
-- <F3>: format file (same as <leader>cfo)
-- <F4>: open code actions (same as <leader>ca)

-- Undo Tree
--vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)


-- Harpoon
local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set('n', '<leader>ha', function() harpoon:list():append() end, { desc = "Harpoon add current" })
vim.keymap.set('n', '<leader>ht', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon toggle" })
vim.keymap.set('n', '<C-f>', function() harpoon:list():next() end, { desc = "Harpoon next" })
vim.keymap.set('n', '<C-e>', function() harpoon:list():prev() end, { desc = "Harpoon prev" })


-- Nvim Tree
local nvapi = require("nvim-tree.api")
vim.keymap.set("n", "<leader>t", nvapi.tree.toggle, { desc = "Toggle nvim tree" })
vim.keymap.set("n", "<leader>o", nvapi.tree.change_root_to_node, { desc = "Change root to node" })


-- Telescope
local tele = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', tele.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>fr', tele.lsp_references, { desc = "Find references" })
vim.keymap.set('n', '<leader>fg', tele.git_files, { desc = "Find git files" })
vim.keymap.set('n', '<leader>fs', tele.live_grep, { desc = "Grep search" })
