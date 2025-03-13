local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
}

function M.config()
  local harpoon = require("harpoon")
  harpoon:setup()
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

---  keymap("n", "<s-m>", function()
---    require('harpoon'):list():append()
---    vim.notify "󱡅  marked file"
---  end, opts)
  keymap("n", "\\a", function() 
    local current_file = vim.fn.expand('%:p')  -- Get full path of current file
    harpoon:list():add()
    vim.notify(string.format("󱡅  marked file %s", current_file))
  end, opts)
  keymap("n", "<TAB>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, opts)
  keymap("n", "\\1", function() harpoon:list():select(1) end, opts)
  keymap("n", "\\2", function() harpoon:list():select(2) end, opts)
  keymap("n", "\\3", function() harpoon:list():select(3) end, opts)
  keymap("n", "\\4", function() harpoon:list():select(4) end, opts)
  keymap("n", "\\c", function() harpoon:list():clear() end, opts)
  keymap("n", "\\d", function() harpoon:list():remove() end, opts)
end

---function M.mark_file()
---  require("harpoon.mark").add_file()
---  vim.notify "󱡅  marked file"
---end

return M
