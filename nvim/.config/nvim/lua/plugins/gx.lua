-- https://github.com/chrishrb/gx.nvim

vim.g.netrw_nogx = 1

local M = { "chrishrb/gx.nvim" }

M.keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } }

M.dependencies = { 'nvim-lua/plenary.nvim' }

M.config = true

M.opts = {
  handlers = {
    plugin = true,
    github = true,
    package_json = true,
    search = true,
  },
  open_browser_app = require("config.utils").get_browser(),
  handler_options = {
    select_for_search = false
  }
}

return M
