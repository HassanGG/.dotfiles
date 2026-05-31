local M = { "mfussenegger/nvim-dap" }

M.dependencies = {
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      automatic_installation = true,
      handlers = {},
    },
  },
}

M.keys = {
  { "<F5>", function() require("dap").continue() end, desc = "DAP: Continue/Start" },
  { "<F10>", function() require("dap").step_over() end, desc = "DAP: Step over" },
  { "<F11>", function() require("dap").step_into() end, desc = "DAP: Step into" },
  { "<F12>", function() require("dap").step_out() end, desc = "DAP: Step out" },
  { "<leader>bb", function() require("dap").toggle_breakpoint() end, desc = "DAP: Toggle breakpoint" },
  { "<leader>bB", function()
    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
  end, desc = "DAP: Conditional breakpoint" },
  { "<leader>bl", function()
    require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
  end, desc = "DAP: Log point" },
  { "<leader>bc", function() require("dap").clear_breakpoints() end, desc = "DAP: Clear breakpoints" },
  { "<leader>br", function() require("dap").repl.toggle() end, desc = "DAP: Toggle REPL" },
  { "<leader>bR", function() require("dap").run_last() end, desc = "DAP: Run last" },
  { "<leader>bh", function()
    require("dap.ui.widgets").hover()
  end, mode = { "n", "v" }, desc = "DAP: Hover variable" },
  { "<leader>b?", function()
    require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes)
  end, desc = "DAP: Scopes" },
}

M.config = function()
  vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
  vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
  vim.fn.sign_define("DapLogPoint", { text = "◈", texthl = "DapLogPoint", linehl = "", numhl = "" })
  vim.fn.sign_define("DapStopped", { text = "→", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" })
  vim.fn.sign_define("DapBreakpointRejected", { text = "✗", texthl = "DapBreakpointRejected", linehl = "", numhl = "" })
end

return M
