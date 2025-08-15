-- lua/plugins/neo-tree.lua
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["<C-h>"] = "toggle_hidden", -- Ctrl+h toggles hidden files
        },
      },
    },
  },
}
