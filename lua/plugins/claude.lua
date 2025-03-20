function read_api_key(file)
  local api_key = ""

  local f = io.open(file, "rb")
  if f then
    f:close()
  end

  if f == nil then
    return api_key
  end

  for line in io.lines(file) do
    api_key = line
  end

  return api_key
end

return {
  "pasky/claude.vim",
  init = function()
    vim.g.claude_api_key = read_api_key("/home/thbrd/.claude/apikey")
  end,
}
