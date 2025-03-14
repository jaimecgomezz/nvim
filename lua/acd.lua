local roots_by_path = {}
local root_files = { ".git" }
local ignore_patterns = { "tmp", ":" }

local should_ignore_path = function(path)
  if path == nil or path == "" then
    return true
  end

  for _, pattern in pairs(ignore_patterns) do
    if string.match(path, pattern) then
      return true
    end
  end

  return false
end

local identify_root = function(path)
  local root = roots_by_path[path]

  if root == nil then
    local root_file = vim.fs.find(root_files, { path = path, upward = true })[1]

    if root_file ~= nil then
      root = vim.fs.dirname(root_file)
      roots_by_path[path] = root
    end
  end

  return root
end

local autoroot = function()
  local path = vim.api.nvim_buf_get_name(0)

  if should_ignore_path(path) then
    return
  end

  local root = identify_root(vim.fs.dirname(path))

  if root == nil then
    return
  end

  vim.fn.chdir(root)
end

vim.api.nvim_create_autocmd("BufEnter", { group = vim.api.nvim_create_augroup("autoroot", {}), callback = autoroot })
