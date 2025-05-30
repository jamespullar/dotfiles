return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim", -- Image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require("neo-tree").setup({
        window = {
          width = 30, -- Default is 40
          mappings = {
            ["P"] = {
              "toggle_preview",
              config = {
                use_float = false,
                use_image_nvim = true,
              },
            },
          }
        }
      })
    end,
}

