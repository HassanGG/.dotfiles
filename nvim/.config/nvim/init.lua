-- Options
vim.o.autoindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.g.mapleader = " "
vim.o.signcolumn = "yes"
vim.o.autoread = true
vim.o.ignorecase = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.undodir = vim.fn.stdpath('data') .. "/undodir"
vim.o.undofile = true
vim.o.updatetime = 400
vim.o.scrolloff = 8
vim.o.cursorline = true
vim.o.breakindent = true
vim.o.completeopt = "menuone,noselect"
vim.opt.formatoptions:remove { "c", "r", "o" }
vim.cmd("colorscheme lunaperche")
vim.o.timeout = false
vim.g.netrw_keepdir = 0
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })

-- Autocmd
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  pattern = "*",
})

-- Mac
if vim.fn.has("mac") == 1 then
  vim.keymap.set('i', '<M-BS>', '<C-w>') -- set option backspace behavior
end

vim.keymap.set({ "n", "v" }, "<leader>x", ":q<CR>", { desc = "Close window" })

-- Increase/Decrease window size (Height)
vim.keymap.set("n", "<C-Up>", ":resize +5<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -5<CR>", { desc = "Decrease window height" })

-- Increase/Decrease window size (Width)
vim.keymap.set("n", "<C-Right>", ":vertical resize +5<CR>", { desc = "Increase window width" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -5<CR>", { desc = "Decrease window width" })


-- leader y to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]], { desc = "Paste from clipboard (before)" })
vim.keymap.set("v", "p", [["_dP]], { desc = "Paste without yanking" })
vim.keymap.set("v", "P", [["_dP]], { desc = "Paste without yanking (before)" })

-- terminal
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

-- delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to void register" })

-- cursor stays at beginning of line
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })

-- toggle diagnostic virtual lines
vim.keymap.set("n", "<leader>uv", function()
  local enabled = vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = not enabled, virtual_text = false })
  print("Diagnostic virtual lines: " .. (enabled and "OFF" or "ON"))
end, { desc = "Toggle diagnostic virtual lines" })

-- Lazy.nvim
require("config.lazy")
