-- ~/.config/nvim/lua/plugins/nvim-cmp.lua

return {
  -- Autocompletion engine
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- LSP completion source
      "hrsh7th/cmp-nvim-lsp",
      -- Buffer completion source
      "hrsh7th/cmp-buffer",
      -- Path completion source
      "hrsh7th/cmp-path",
      -- Command line completion source
      "hrsh7th/cmp-cmdline",
      -- Snippet engine (required for nvim-cmp)
      "L3MON4D3/LuaSnip",
      -- Snippet completion source
      "saadparwaiz1/cmp_luasnip",
      -- Additional Go snippets
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      
      -- Load friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()
      
      -- Custom completion menu icons
      local kind_icons = {
        Text = "󰉿",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰜢",
        Variable = "󰀫",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "",
      }
      
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        
        -- Completion window appearance
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        
        -- Key mappings for completion
        mapping = cmp.mapping.preset.insert({
          -- Navigate completion items
          ["<C-k>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
          ["<C-j>"] = cmp.mapping.select_next_item(), -- Next suggestion
          
          -- Scroll documentation
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          
          -- Open completion menu
          ["<C-Space>"] = cmp.mapping.complete(),
          
          -- Close completion menu
          ["<C-e>"] = cmp.mapping.abort(),
          
          -- Confirm selection
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false, -- Only confirm explicitly selected items
          }),
          
          -- Tab completion with snippet support
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        
        -- Completion sources (order matters for priority)
        sources = cmp.config.sources({
          { name = "nvim_lsp" },    -- LSP completions (highest priority)
          { name = "luasnip" },     -- Snippet completions
          { name = "path" },        -- File path completions
        }, {
          { name = "buffer" },      -- Buffer text completions (lower priority)
        }),
        
        -- Customize completion menu appearance
        formatting = {
          format = function(entry, vim_item)
            -- Add icons to completion items
            vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
            
            -- Show source of completion
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
            })[entry.source.name]
            
            return vim_item
          end,
        },
        
        -- Experimental features
        experimental = {
          ghost_text = true, -- Show ghost text for inline suggestions
        },
      })
      
      -- Setup completion for command line
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" }
        }
      })
      
      -- Setup completion for command line commands
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" }
        }, {
          { name = "cmdline" }
        })
      })
    end,
  },
  
  -- LSP completion source
  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = true, -- Loaded by nvim-cmp
  },
  
  -- Buffer completion source
  {
    "hrsh7th/cmp-buffer",
    lazy = true,
  },
  
  -- Path completion source
  {
    "hrsh7th/cmp-path",
    lazy = true,
  },
  
  -- Command line completion source
  {
    "hrsh7th/cmp-cmdline",
    lazy = true,
  },
  
  -- Snippet engine
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local luasnip = require("luasnip")
      
      -- Enable autotrigger snippets
      luasnip.config.setup({
        enable_autosnippets = true,
        store_selection_keys = "<Tab>",
      })
      
      -- Load snippets from friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()
      
      -- Custom Go snippets (optional)
      luasnip.add_snippets("go", {
        luasnip.snippet("main", {
          luasnip.text_node({
            "package main",
            "",
            "import (",
            '\t"fmt"',
            ")",
            "",
            "func main() {",
            "\t"
          }),
          luasnip.insert_node(1, "// TODO"),
          luasnip.text_node({
            "",
            "}"
          })
        }),
        
        luasnip.snippet("iferr", {
          luasnip.text_node("if err != nil {"),
          luasnip.text_node({"", "\t"}),
          luasnip.insert_node(1, "return err"),
          luasnip.text_node({"", "}"})
        }),
      })
    end,
  },
  
  -- Snippet completion source
  {
    "saadparwaiz1/cmp_luasnip",
    lazy = true,
  },
  
  -- Additional snippets collection
  {
    "rafamadriz/friendly-snippets",
    lazy = true,
  },
}
