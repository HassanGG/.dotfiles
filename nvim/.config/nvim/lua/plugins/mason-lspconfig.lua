-- https://github.com/williamboman/mason-lspconfig.nvim

local M = { "williamboman/mason-lspconfig.nvim" }

M.dependencies = { "williamboman/mason.nvim" }

M.opts = {
  ensure_installed = { "lua_ls" },
}

M.config = function(_, opts)
  require("mason-lspconfig").setup(opts)
end

return M
