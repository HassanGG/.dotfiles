-- https://github.com/mbbill/undotree

local M = { "mbbill/undotree" }

M.keys = {
  {
    '<leader>ut',
    function()
      vim.cmd.UndotreeToggle()
      vim.cmd.UndotreeFocus()
    end,
    desc = "undotree toggle focus"
  }
}

M.config = function()
  vim.g.undotree_WindowLayout = 3
end

return M
