-- https://github.com/AstroNvim/astrocore/blob/main/lua/astrocore/buffer.lua
local M = {}

function M.is_valid(bufnr)
  if not bufnr then bufnr = 0 end
  return vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buflisted
end

function M.close(bufnr, force)
  if not bufnr or bufnr == 0 then bufnr = vim.api.nvim_get_current_buf() end
  if M.is_valid(bufnr) then
    local buftype = vim.bo[bufnr].buftype
    vim.cmd(("silent! %s %d"):format((force or buftype == "terminal") and "bdelete!" or "confirm bdelete", bufnr))
  end
end

return M
