vim.g.mapleader = " "

-- netrw is turned off since we use nvimtree
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

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
local function nkeymap(k, map)
    vim.api.nvim_set_keymap('n', k, map, { noremap = true })
end

nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nkeymap('gs', ':lua vim.lsp.buf.document_symbol()<cr>')
nkeymap('gS', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')
nkeymap('<C-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nkeymap('<leader>ca', ':lua vim.lsp.buf.code_action()<cr>')
nkeymap('<leader>crn', ':lua vim.lsp.buf.rename()<cr>')
nkeymap('<leader>cfo', ':lua vim.lsp.buf.format()<cr>')

-- Default maps from lsp-zero
-- <F2>: rename symbol under cursor (same as <leader>crn)
-- <F3>: format file (same as <leader>cfo)
-- <F4>: open code actions (same as <leader>ca)

-- Undo Tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)


-- Harpoon
local harpMark = require("harpoon.mark")
local harpUi = require("harpoon.ui")
local harpTerm = require("harpoon.term")
vim.keymap.set('n', '<leader>ha', harpMark.add_file, {})
vim.keymap.set('n', '<leader>ht', harpUi.toggle_quick_menu, {})
vim.keymap.set('n', '<C-f>', harpUi.nav_next, {})
vim.keymap.set('n', '<C-e>', harpUi.nav_prev, {})


-- Nvim Tree
local nvapi = require("nvim-tree.api")
vim.keymap.set("n", "<leader>t", nvapi.tree.toggle)
vim.keymap.set("n", "<leader>o", nvapi.tree.change_root_to_node)


-- Telescope
local tele = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', tele.find_files, {})
vim.keymap.set('n', '<leader>fr', tele.lsp_references, {})
vim.keymap.set('n', '<C-p>', tele.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	tele.grep_string({ search = vim.fn.input("Grep > ") })
end)
