-- ~/.config/nvim/lua/plugins/lspconfig.lua

return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Import lspconfig plugin
      local lspconfig = require("lspconfig")
      
      -- Import cmp-nvim-lsp plugin
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      
      -- Enable keybinds and completion for LSP
      local capabilities = cmp_nvim_lsp.default_capabilities()
      
      -- Configure diagnostic signs
      vim.diagnostic.config({
          signs = {
              text = {
                  [vim.diagnostic.severity.ERROR] = " ",
                  [vim.diagnostic.severity.WARN] = " ",
                  [vim.diagnostic.severity.INFO] = " ",
                  [vim.diagnostic.severity.HINT] = "󰠠 ",
              }
          }
      })
      
      -- LSP keymaps (will be available when LSP attaches to buffer)
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        
        -- Keybindings for LSP functionality
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- Go to definition
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- Go to declaration
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- Go to implementation
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts) -- Show references
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Show hover info
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- Code actions
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Rename symbol
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- Show diagnostics
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- Previous diagnostic
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- Next diagnostic
      end
      
      -- Configure gopls (Go language server)
      lspconfig.gopls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          gopls = {
            gofumpt = true, -- Use gofumpt for formatting
            analyses = {
              unusedparams = true,
              unreachable = true,
            },
            staticcheck = true,
            usePlaceholders = true,
            completeUnimported = true,
          },
        },
      })

      -- Configure hyprls (Hyprlang language server)
      lspconfig.hyprls.setup({
          filetypes = { "hyprlang" },
          root_dir = function(fname)
              return require'lspconfig.util'.find_git_ancestor(fname) or vim.fn.getcwd()
          end,
          single_file_support = true,
      })
    end,
  },
}
