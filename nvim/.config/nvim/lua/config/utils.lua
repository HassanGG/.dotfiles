local M = {}

M.get_browser = function()
  local browser = "xdg-open"
  if vim.fn.has('macunix') then
    browser = "open"
  end
  return browser
end

return M
