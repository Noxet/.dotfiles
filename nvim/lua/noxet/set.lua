vim.wo.number = true
vim.wo.relativenumber = true

local set = vim.opt
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

set.smartindent = true

set.wrap = false

-- permanent undo history
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

-- highlight all search matches
set.hlsearch = true
-- incremental highlight as we search
set.incsearch = true

set.termguicolors = true

-- always keep 8 lines below/above when scrolling (except end/beg of file)
set.scrolloff = 8
--set.signcolumn = "yes"

set.updatetime = 50

set.colorcolumn = "120"

-- auto close vim if nvim-tree is the only one left.
-- confirm if there are unsaved files, so we don't loose them.
vim.o.confirm = true
vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
    callback = function()
        local layout = vim.api.nvim_call_function("winlayout", {})
        if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("quit") end
    end
})
