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
