-- https://github.com/folke/lazydev.nvim

local M = { "folke/lazydev.nvim" }

M.ft = "lua"

M.opts = {
  library = {
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
  },
}

return M
