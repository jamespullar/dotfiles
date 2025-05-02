return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/playground",
      "windwp/nvim-ts-autotag",
      "RRethy/nvim-treesitter-endwise",
      "HiPhish/nvim-ts-rainbow2",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "go",
          "gomod",
          "gowork",
          "gosum",
          "gotmpl",
          "lua",
          "vim",
          "query",
        },
        auto_install = true,

        -- Syntax highlighting
        highlight = {
          enable = true,
        },

        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            include_surrounding_whitespace = true,
          }
        },
      })
    end,
}

