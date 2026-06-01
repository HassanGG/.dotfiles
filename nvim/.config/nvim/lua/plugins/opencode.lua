-- https://github.com/nickjvandyke/opencode.nvim

local M = { 'nickjvandyke/opencode.nvim' }

M.version = '*'

M.config = function()
  vim.keymap.set({ "n", "x" }, "<leader>oa", function()
    require("opencode").ask("@this: ", { submit = true })
  end, { desc = "OpenCode: Ask" })

  vim.keymap.set({ "n", "x" }, "<leader>os", function()
    require("opencode").select()
  end, { desc = "OpenCode: Select" })

  vim.keymap.set({ "n", "x" }, "<leader>oe", function()
    require("opencode").prompt("Explain @this and its context")
  end, { desc = "OpenCode: Explain" })

  vim.keymap.set({ "n", "x" }, "<leader>of", function()
    require("opencode").prompt("Fix @diagnostics")
  end, { desc = "OpenCode: Fix" })

  vim.keymap.set({ "n", "x" }, "<leader>or", function()
    require("opencode").prompt("Review @this for correctness and readability")
  end, { desc = "OpenCode: Review" })

  vim.keymap.set({ "n", "x" }, "<leader>ot", function()
    require("opencode").prompt("Add tests for @this")
  end, { desc = "OpenCode: Test" })

  vim.keymap.set({ "n", "x" }, "<leader>od", function()
    require("opencode").prompt("Add comments documenting @this")
  end, { desc = "OpenCode: Document" })
end

return M
