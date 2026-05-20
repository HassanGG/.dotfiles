-- https://github.com/nvim-telescope/telescope.nvim

local M = { 'nvim-telescope/telescope.nvim' }

M.dependencies = { 'nvim-lua/plenary.nvim' }

M.config = function()
  require('telescope').setup({})
  pcall(require('telescope').load_extension, 'fzf')
end

M.keys = {
  {
    "<leader>ff",
    function() require('telescope.builtin').find_files({ hidden = true }) end,
    desc = "telescope find files"
  },
  {
    "<leader>fr",
    function() require('telescope.builtin').live_grep({ hidden = true }) end,
    desc = "telescope live grep"
  },
  {
    "<leader>fb",
    function() require('telescope.builtin').buffers() end,
    desc = "telescope buffers"
  },
  {
    "<leader>fh",
    function() require('telescope.builtin').help_tags() end,
    desc = "telescope help tags"
  },
  {
    "<leader>fg",
    function() require('telescope.builtin').git_files() end,
    desc = "telescope git files"
  },
  {
    "<leader>fs",
    function() require('telescope.builtin').lsp_document_symbols() end,
    desc = "telescope lsp document symbols"
  },
  {
    "<leader>fw",
    function() require('telescope.builtin').lsp_dynamic_workspace_symbols() end,
    desc = "telescope dynamice workspace symbols"
  },
  {
    "<leader>fc",
    function() require('telescope.builtin').commands() end,
    desc = "telescope commands",
  },
  {
    "<leader>fd",
    function() require('telescope.builtin').diagnostics() end,
    desc = "telescope diagnostics"
  },
  {
    "<leader>fk",
    function() require('telescope.builtin').keymaps() end,
    desc = "telescope keymaps"
  },
  {
    '<leader>/',
    function()
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes')
        .get_dropdown { winblend = 10, previewer = false, })
    end,
    desc = '[/] Fuzzily search in current buffer'
  },
}

return M
