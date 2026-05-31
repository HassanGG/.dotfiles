local M = { "igorlfs/nvim-dap-view" }

M.dependencies = { "mfussenegger/nvim-dap" }

M.keys = {
  { "<leader>bt", function() require("dap-view").toggle() end, desc = "DAP: Toggle view" },
  { "<leader>bw", function() require("dap-view").add_expr() end, mode = { "n", "v" }, desc = "DAP: Add watch" },
  { "<leader>bH", function() require("dap-view").hover() end, mode = { "n", "v" }, desc = "DAP: Hover (dap-view)" },
}

M.config = function()
  require("dap-view").setup({
    winbar = {
      sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "repl" },
      default_section = "watches",
    },
    windows = {
      position = "below",
      size = 0.25,
    },
    auto_toggle = true,
    virtual_text = {
      enabled = true,
      position = "inline",
    },
  })
end

return M
