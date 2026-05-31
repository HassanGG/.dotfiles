-- https://github.com/stevearc/oil.nvim

local M = { 'stevearc/oil.nvim' }

M.dependencies = { { "nvim-mini/mini.icons", opts = {} } }

M.keys = {
  { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
}

M.lazy = false

M.opts = {
  default_file_explorer = true
}

return M
