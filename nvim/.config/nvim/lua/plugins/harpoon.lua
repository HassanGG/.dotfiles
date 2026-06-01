-- https://github.com/ThePrimeagen/harpoon

local M = { "ThePrimeagen/harpoon" }

M.dependencies = { "nvim-lua/plenary.nvim" }

M.keys = {
  { "<leader>ma", function() require("harpoon.mark").add_file() end,                       desc = "Harpoon: Add file" },
  { "<leader>hh", function() require("harpoon.ui").toggle_quick_menu() end,                 desc = "Harpoon: Toggle menu" },
  { "<leader>1",  function() require("harpoon.ui").nav_file(1) end,                         desc = "Harpoon: Select 1" },
  { "<leader>2",  function() require("harpoon.ui").nav_file(2) end,                         desc = "Harpoon: Select 2" },
  { "<leader>3",  function() require("harpoon.ui").nav_file(3) end,                         desc = "Harpoon: Select 3" },
  { "<leader>4",  function() require("harpoon.ui").nav_file(4) end,                         desc = "Harpoon: Select 4" },
  { "<leader>5",  function() require("harpoon.ui").nav_file(5) end,                         desc = "Harpoon: Select 5" },
  { "<leader>6",  function() require("harpoon.ui").nav_file(6) end,                         desc = "Harpoon: Select 6" },
  { "<leader>7",  function() require("harpoon.ui").nav_file(7) end,                         desc = "Harpoon: Select 7" },
  { "<leader>8",  function() require("harpoon.ui").nav_file(8) end,                         desc = "Harpoon: Select 8" },
  { "<leader>9",  function() require("harpoon.ui").nav_file(9) end,                         desc = "Harpoon: Select 9" },
}

M.config = function()
  require("harpoon").setup({
    global_settings = {
      save_on_toggle = true,
    },
  })
end

return M
