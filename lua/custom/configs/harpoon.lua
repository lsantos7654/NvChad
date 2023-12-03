local harpoon = require "harpoon"
harpoon.setup()

M.harpoon = {
  plugin = true,
  n = {
    ["<leader>a"] = {
      function()
        harpoon.mark.add_file()
      end,
      "Add file to Harpoon",
    },
    ["<C-e>"] = {
      function()
        harpoon.ui.toggle_quick_menu()
      end,
      "Toggle Harpoon menu",
    },

    ["<C-h>"] = {
      function()
        harpoon.ui.nav_file(1)
      end,
      "Navigate to Harpoon file 1",
    },
    ["<C-t>"] = {
      function()
        harpoon.ui.nav_file(2)
      end,
      "Navigate to Harpoon file 2",
    },
    ["<C-n>"] = {
      function()
        harpoon.ui.nav_file(3)
      end,
      "Navigate to Harpoon file 3",
    },
    ["<C-s>"] = {
      function()
        harpoon.ui.nav_file(4)
      end,
      "Navigate to Harpoon file 4",
    },
  },
}
