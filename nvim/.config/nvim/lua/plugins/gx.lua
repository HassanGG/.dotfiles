-- https://github.com/chrishrb/gx.nvim

local M = { "chrishrb/gx.nvim" }

M.keys = { { 'gx' } }

M.dependencies = { 'nvim-lua/plenary.nvim' }

M.opts = {
  handlers = {
    plugin = true,
    github = true,
    package_json = true,
    search = true,
  },
  open_browser_app = require("config.utils").get_browser()
}

return M
