-- https://github.com/rafamadriz/friendly-snippets

local M = { "rafamadriz/friendly-snippets" }

M.dependencies = { "L3MON4D3/LuaSnip" }

M.config = function()
  require("luasnip.loaders.from_vscode").lazy_load()
end

return M
