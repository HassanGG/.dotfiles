local M = { "lewis6991/gitsigns.nvim" }

M.opts = {
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  on_attach = function(bufnr)
    local gs = require("gitsigns")


    local function preview_hunk()
      gs.preview_hunk()
      vim.schedule(function()
        for _, winid in ipairs(vim.api.nvim_list_wins()) do
          if vim.w[winid].gitsigns_preview == "hunk" then
            vim.api.nvim_set_current_win(winid)
            return
          end
        end
      end)
    end

    vim.keymap.set({"n", "v"}, "]c", function() gs.nav_hunk("next") end, { buffer = bufnr, desc = "Next hunk" })
    vim.keymap.set({"n", "v"}, "[c", function() gs.nav_hunk("prev") end, { buffer = bufnr, desc = "Prev hunk" })

    vim.keymap.set({"n", "v"}, "<leader>gp", preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
    vim.keymap.set({"n", "v"}, "<leader>gb", function() gs.blame_line({ full = true }) end, { buffer = bufnr, desc = "Blame line" })
    vim.keymap.set({"n", "v"}, "<leader>tb", gs.toggle_current_line_blame, { buffer = bufnr, desc = "Toggle blame" })

    vim.keymap.set("n", "<leader>gs", gs.stage_hunk, { buffer = bufnr, desc = "Stage hunk" })
    vim.keymap.set("v", "<leader>gs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { buffer = bufnr, desc = "Stage hunk" })

    vim.keymap.set("n", "<leader>gr", gs.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })
    vim.keymap.set("v", "<leader>gr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { buffer = bufnr, desc = "Reset hunk" })
  end,
}

return M
