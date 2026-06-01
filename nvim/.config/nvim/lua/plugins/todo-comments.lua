-- https://github.com/folke/todo-comments.nvim

local M = { "folke/todo-comments.nvim" }

M.dependencies = { "nvim-lua/plenary.nvim" }

M.keys = {
  { "<leader>st", function() require("todo-comments.search").setqflist({ open = true }) end, desc = "Todo: Search todos" },
  { "]t", function() require("todo-comments").jump_next() end,                                desc = "Todo: Next" },
  { "[t", function() require("todo-comments").jump_prev() end,                                desc = "Todo: Prev" },
}

M.config = function()
  require("todo-comments").setup({})
end

return M
