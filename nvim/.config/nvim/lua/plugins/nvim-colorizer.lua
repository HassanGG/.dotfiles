-- https://github.com/NvChad/nvim-colorizer.lua

local M = { 'NvChad/nvim-colorizer.lua' }

M.config = function()
  require('colorizer').setup({
    filetypes = { '*' },
    user_default_options = {
      RGB = true,
      RRGGBB = true,
      names = false,
      RRGGBBAA = true,
      rgb_fn = false,
      hsl_fn = false,
      css = false,
      css_fn = false,
      mode = 'background',
    },
  })
end

return M
