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
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true
vim.o.updatetime = 400
vim.o.scrolloff = 8
vim.o.cursorline = true
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.breakindent = true
vim.o.completeopt = "menuone,noselect"
vim.opt.formatoptions:remove { "c", "r", "o" }
vim.cmd("colorscheme lunaperche")
vim.o.timeout = false
-- vim.o.autochdir = true
vim.g.netrw_keepdir = 0
vim.g.netrw_localcopydircmd = 'cp -r'

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

-- leader y to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]])
vim.keymap.set("v", "p", [["_dP]])
vim.keymap.set("v", "P", [["_dP]])

-- terminal
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

-- delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- cursor stays at beginning of line
vim.keymap.set("n", "J", "mzJ`z")

-- Lazy.nvim
require("config.lazy")
