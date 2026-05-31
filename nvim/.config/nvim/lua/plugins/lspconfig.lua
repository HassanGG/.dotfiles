-- https://github.com/neovim/nvim-lspconfig

local M = { "neovim/nvim-lspconfig" }

M.dependencies = {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "folke/lazydev.nvim",
}

M.config = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if has_cmp then
    capabilities = cmp_nvim_lsp.default_capabilities()
  end

  vim.lsp.config["*"] = {
    capabilities = capabilities,
    on_attach = function(_, bufnr)
      local nmap = function(keys, func, desc)
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
      end

      nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
      nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
      nmap("gh", vim.lsp.buf.hover, "Hover Documentation")
      nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
      nmap("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
      nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
      nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
      nmap("K", vim.diagnostic.open_float, "Diagnostic [E]rror")
      nmap("]d", vim.diagnostic.goto_next, "[N]ext [D]iagnostic")
      nmap("[d", vim.diagnostic.goto_prev, "[P]revious [D]iagnostic")
      nmap("<leader>lf", vim.lsp.buf.format, "[F]ormat [B]uffer")
    end,
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
