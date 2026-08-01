-- https://github.com/Pocco81/auto-save.nvim

local M = { "Pocco81/auto-save.nvim" }

M.event = "InsertLeave"

M.config = function()
  require("auto-save").setup({
    trigger_events = { "InsertLeave" },
    debounce_delay = 135,
    condition = function(buf)
      local fn = vim.fn
      local utils = require("auto-save.utils.data")

      if fn.getbufvar(buf, "&modifiable") == 1
        and utils.not_in(fn.getbufvar(buf, "&filetype"), { "", "oil" })
      then
        return true
      end
      return false
    end,
  })
end

return M
