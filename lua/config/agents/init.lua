local M = {}

local prompts_dir = vim.fn.stdpath("config") .. "/lua/config/agents/"

function M.load(name)
  local path = prompts_dir .. name .. ".md"
  local ok, lines = pcall(vim.fn.readfile, path)
  if ok and lines then
    return table.concat(lines, "\n")
  end
  vim.notify("Prompt file not found: " .. path, vim.log.levels.WARN)
  return ""
end

return M
