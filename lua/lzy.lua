local vim = vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)


require('lazy').setup(
  {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { 'echasnovski/mini.files', dependencies = { 'echasnovski/mini.icons' }, version = '*', config = function() require('lzy.mini_files') end },
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }, config = function() require('lualine').setup() end }
  },
  {
    change_detection = { notify = false },
    install = { colorscheme = { "catppuccin-mocha" } },
    ui = { icons = { ft = "", lazy = "󰂠 ", loaded = "", not_loaded = "" } },
    performance = { rtp = { disabled_plugins = { "2html_plugin", "tohtml", "getscript", "getscriptPlugin", "gzip", "logipat", "netrw", "netrwPlugin", "netrwSettings", "netrwFileHandlers", "matchit", "tar", "tarPlugin", "rrhelper", "spellfile_plugin", "vimball", "vimballPlugin", "zip", "zipPlugin", "tutor", "rplugin", "syntax", "synmenu", "optwin", "compiler", "bugreport", "ftplugin", "editorconfig" } } }
  }
)