-- https://github.com/stevearc/oil.nvim

local M = { 'stevearc/oil.nvim' }

M.dependencies = { { "nvim-mini/mini.icons", opts = {} } }

M.lazy = false

M.opts = {
  default_file_explorer = true
}

return M
