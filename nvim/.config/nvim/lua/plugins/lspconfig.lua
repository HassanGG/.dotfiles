-- https://github.com/neovim/nvim-lspconfig

local M = { "neovim/nvim-lspconfig" }

M.dependencies = {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "folke/lazydev.nvim",
}

M.config = function()
  vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false,
    signs = true,
    underline = true,
    severity_sort = true,
    update_in_insert = false,
  })


  local capabilities = vim.lsp.protocol.make_client_capabilities()

  local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

  if has_cmp then
    capabilities = cmp_nvim_lsp.default_capabilities()
  end

  vim.lsp.config["*"] = {
    capabilities = capabilities,
  }

  vim.lsp.config.lua_ls = {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = { enable = false },
      },
    },
  }

  vim.lsp.enable("lua_ls")
end

return M
