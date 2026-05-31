local M = { "nvim-treesitter/nvim-treesitter" }

M.build = ":TSUpdate"

M.event = { "BufReadPost", "BufNewFile" }

M.dependencies = {
  "nvim-treesitter/nvim-treesitter-textobjects",
}

M.config = function()
  require("nvim-treesitter.config").setup({
    ensure_installed = { "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
    install_dir = vim.fs.joinpath(vim.fn.stdpath('data'), 'site'),
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
      },
    },
  })
end

return M
