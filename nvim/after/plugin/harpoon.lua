local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>ad", mark.rm_file)
vim.keymap.set("n", "<leader>ac", mark.clear_all)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
vim.keymap.set("n", "<C-a>", ui.nav_prev)
vim.keymap.set("n", "<C-s>", ui.nav_next)
