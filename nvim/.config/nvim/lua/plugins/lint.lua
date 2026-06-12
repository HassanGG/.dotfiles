return {
  "mfussenegger/nvim-lint",
  config = function()
    require("lint").linters_by_ft = {}

    if vim.fn.executable("checkmake") == 1 then
      require("lint").linters_by_ft.make = { "checkmake" }
    end

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })

    local nmap = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { desc = "Diagnostic: " .. desc })
    end

    nmap("K", vim.diagnostic.open_float, "Open diagnostic float")
    nmap("]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "[N]ext [D]iagnostic")
    nmap("[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "[P]revious [D]iagnostic")
  end,
}
