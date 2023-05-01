-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
})

local api = require("nvim-tree.api")
vim.keymap.set("n", "<leader>tt", api.tree.toggle)
vim.keymap.set("n", "<C-o>", api.tree.change_root_to_node)

--vim.keymap.set("n", "<leader>fc", api.fs.create)
--vim.keymap.set("n", "<leader>fd", api.fs.remove)

--vim.keymap.set("n", "<leader>fo", api.node.open.edit)
--vim.keymap.set("n", "<leader>fvo", api.node.open.vertical)
