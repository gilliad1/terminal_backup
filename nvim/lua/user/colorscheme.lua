local M = {
  "LunarVim/darkplus.nvim",
  "Mofiqul/dracula.nvim",
  "rose-pine/neovim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  vim.cmd.colorscheme "rose-pine"
end

return M
