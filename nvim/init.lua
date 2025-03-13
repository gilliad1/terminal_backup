require "user.launch"
require "user.options"
require "user.keymaps"
require "user.autocmds"
spec "user.colorscheme"
spec "user.devicons"
spec "user.treesitter"
spec "user.mason"
spec "user.schemastore"
spec "user.lspconfig"
spec "user.cmp"
spec "user.telescope"
spec "user.none-ls"
spec "user.illuminate"
spec "user.gitsigns"
spec "user.whichkey"
spec "user.nvimtree"
spec "user.comment"
spec "user.lualine"
spec "user.navic"
spec "user.breadcrumbs"
spec "user.harpoon"
spec "user.neotest"
spec "user.autopairs"
spec "user.neogit"
spec "user.alpha"
spec "user.project"
spec "user.indentline"
spec "user.toggleterm"
spec "user.noice"
require "user.lazy"

vim.g.mapleader = " "
vim.keymap.set('n', '<leader>-', ':Explore<CR>', { noremap = true })

local wk = require "which-key"
wk.add {
   { "<leader>xb", 
       function()
           local build_cmd = [[
               pkill -x app1;
               rm -rf ~/Library/Developer/Xcode/DerivedData;
               rm -rf ~/Library/Developer/Xcode/UserData/Preview\ Assets;
               rm -rf ~/Library/Developer/Xcode/UserData/IB\ Support;
               rm -rf ~/Library/Caches/com.apple.dt.Xcode;
               rm -rf ./build &&
               xcodebuild clean build -scheme 'app1' -configuration Debug -derivedDataPath ./build -verbose &&
               open ./build/Build/Products/Debug/app1.app
           ]]
           
           local output = vim.fn.system(build_cmd)
           if vim.v.shell_error ~= 0 then
               -- Create new buffer for output
               vim.cmd('vsplit')
               local buf = vim.api.nvim_create_buf(true, true)
               vim.api.nvim_win_set_buf(0, buf)
               
               -- Add the output to buffer
               local output_lines = vim.split(output, '\n')
               vim.api.nvim_buf_set_lines(buf, 0, -1, false, output_lines)
               
               -- Set buffer to read-only
               vim.api.nvim_buf_set_option(buf, 'modifiable', false)
               vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
               vim.api.nvim_buf_set_name(buf, 'Build Output')
           end
       end,
       desc = "Build and Run Xcode App" 
   }
}
