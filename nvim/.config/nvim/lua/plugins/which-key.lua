-- https://github.com/folke/which-key.nvim

vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = "#000000" })

local M = { "folke/which-key.nvim" }

M.event = "VeryLazy"

M.config = true

return M
