local function return_to_buffer(prevbuff, prevbufftype, restbuff)
  local terminal_switch = prevbufftype == "terminal" and prevbuff ~= restbuff
  local buffer_switch = vim.fn.buflisted(prevbuff) == 1 and prevbuff ~= restbuff

  -- Enter the buffer we were at prior to entering rest
  if terminal_switch or buffer_switch then
    vim.cmd("buffer" .. prevbuff)
    return
  end

  -- If the buffer we were at prior to entering rest isn't listed
  -- anymore, attempt to enter any of the lastly edited buffers
  for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
    if vim.fn.buflisted(buffer) == 1 and buffer ~= restbuff then
      vim.cmd("silent buffer" .. buffer)
      return
    end
  end

  -- If there's no remaining buffers to return to, run the startup command
  vim.cmd("Startify")
end

local function enter_rest(currbuff, restbuff)
  -- Switch to existing panel buffer
  if vim.fn.bufexists(restbuff) == 1 then
    vim.cmd("silent buffer" .. restbuff)
  else
    -- Open the rest panel
    vim.cmd("Rest open")
    vim.g.rest_restbuff = vim.api.nvim_get_current_buf()
  end
end

local function exit_rest(prevbuff, prevbufftype, curbuff, restbuff)
  if curbuff ~= restbuff then
    return
  end

  return_to_buffer(prevbuff, prevbufftype, restbuff)
end

local function toggle_rest()
  local prevbuff = vim.g.rest_prevbuff
  local prevbufftype = vim.g.rest_prevbufftype
  local restbuff = vim.g.rest_restbuff
  local currbuff = vim.api.nvim_get_current_buf()

  if vim.bo.filetype == "rest_nvim_result" then
    exit_rest(prevbuff, prevbufftype, currbuff, restbuff)
  else
    vim.g.rest_prevbuff = currbuff
    vim.g.rest_prevbufftype = vim.bo.buftype
    enter_rest(currbuff, restbuff)
  end
end

return {
  "rest-nvim/rest.nvim",
  ft = "http",
  config = function()
    vim.filetype.add({ extension = { ["http"] = "http" } })
  end,
  keys = {
    { "<leader>ss", "<CMD> Rest send <CR>", desc = "Run request under cursor" },
    { "<leader>sS", "<CMD> Rest run <CR>", desc = "Run names request" },
    { "<C-'>", toggle_rest, desc = "Open results pane", mode = { "n", "i", "t" } },
    { "<leader>sp", "<CMD> Rest last <CR>", desc = "Run previous request" },
    { "<leader>sl", "<CMD> Rest logs <CR>", desc = "Open rest logs" },
    { "<leader>sc", "<CMD> Rest cookies <CR>", desc = "Open rest cookies" },
    { "<leader>se", "<CMD> Rest env <CR>", desc = "Open rest env" },
    { "<leader>sE", "<CMD> Rest env select <CR>", desc = "Set rest env" },
  },
}
