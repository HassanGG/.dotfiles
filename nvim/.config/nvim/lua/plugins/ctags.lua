-- https://github.com/wsdjeg/ctags.nvim

local M = { 'wsdjeg/ctags.nvim' }

M.dependencies = { 'wsdjeg/job.nvim' }

M.keys = {
  { '<leader>ct', function() require('ctags').update() end, desc = 'Ctags: Regenerate tags' },
}

M.config = function()
  require('ctags').setup({
    cache_dir = vim.fn.stdpath('data') .. '/ctags/',
    events = { 'BufWritePost' },
  })

  local fname = require('ctags.util').path_to_fname(vim.fn.getcwd())
  local dir = require('ctags.util').unify_path(require('ctags.config').cache_dir) .. fname
  vim.o.tags = dir .. '/tags,' .. vim.o.tags
end

return M
