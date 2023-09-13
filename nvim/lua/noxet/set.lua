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
-- TODO: There is a bug here. If we open a folder in nvim and use telescope to find files, it failes
-- vim.o.confirm = true
-- vim.api.nvim_create_autocmd("BufEnter", {
--     group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
--     callback = function()
--         local layout = vim.api.nvim_call_function("winlayout", {})
--         if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("quit") end
--     end
-- })

-- NEW solution that seems to work with fzf
-- auto close vim if nvim-tree is the only one left.
-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local tree_wins = {}
    local floating_wins = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match("NvimTree_") ~= nil then
        table.insert(tree_wins, w)
      end
      if vim.api.nvim_win_get_config(w).relative ~= '' then
        table.insert(floating_wins, w)
      end
    end
    if 1 == #wins - #floating_wins - #tree_wins then
      -- Should quit, so we close all invalid windows.
      for _, w in ipairs(tree_wins) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end
})
