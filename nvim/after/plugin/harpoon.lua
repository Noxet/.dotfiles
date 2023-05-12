local harpMark = require("harpoon.mark")
local harpUi = require("harpoon.ui")
local harpTerm = require("harpoon.term")

vim.keymap.set('n', '<leader>ha', harpMark.add_file, {})
vim.keymap.set('n', '<leader>ht', harpUi.toggle_quick_menu, {})
vim.keymap.set('n', '<leader>hn', harpUi.nav_next, {})
vim.keymap.set('n', '<leader>hp', harpUi.nav_prev, {})
