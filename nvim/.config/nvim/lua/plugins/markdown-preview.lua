-- https://github.com/iamcco/markdown-preview.nvim

local M = { "iamcco/markdown-preview.nvim" }

M.ft = { "markdown" }

M.build = "cd app && npx --yes yarn install"

M.keys = {
  { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown: Toggle preview" },
}

M.config = true

return M
