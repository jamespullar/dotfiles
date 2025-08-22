-- ~/.config/nvim/lua/plugins/telescope.lua

return {
  -- Telescope fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- Native fzf for better performance
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- File browser extension
      "nvim-telescope/telescope-file-browser.nvim",
      -- UI improvements
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "Telescope",
    keys = {
      -- File pickers
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
      { "<leader>fr", "<cmd>Telescope recent_files<cr>", desc = "Recent files" },
      
      -- Git pickers
      { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
      { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
      { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
      
      -- LSP pickers (Go development specific)
      { "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "LSP references" },
      { "<leader>ld", "<cmd>Telescope lsp_definitions<cr>", desc = "LSP definitions" },
      { "<leader>li", "<cmd>Telescope lsp_implementations<cr>", desc = "LSP implementations" },
      { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document symbols" },
      { "<leader>lw", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace symbols" },
      { "<leader>lx", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
      
      -- Search pickers
      { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Search word under cursor" },
      { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
      
      -- File browser
      { "<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "File browser" },
      
      -- Resume last picker
      { "<leader>fr", "<cmd>Telescope resume<cr>", desc = "Resume last picker" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      
      telescope.setup({
        defaults = {
          -- Default configuration for telescope goes here
          prompt_prefix = "🔍 ",
          selection_caret = "➤ ",
          entry_prefix = "  ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "descending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              mirror = false,
              width = 0.87,
              height = 0.80,
              preview_cutoff = 120,
              preview_width = 0.6,
              preview_height = 0.4,
              prompt_position = "top",
            },
            vertical = {
              mirror = false,
              width = 0.87,
              height = 0.80,
              preview_cutoff = 40,
            },
          },
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          file_ignore_patterns = {
            "node_modules",
            ".git/",
            "vendor/",
            "%.lock",
            "__pycache__",
            "%.sqlite3",
            "%.ipynb",
            "go.sum",
            "go.mod",
            ".env",
            "%.jpg",
            "%.jpeg",
            "%.png",
            "%.svg",
            "%.otf",
            "%.ttf",
          },
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          winblend = 0,
          border = {},
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          color_devicons = true,
          set_env = { ["COLORTERM"] = "truecolor" },
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
          
          -- Key mappings within telescope
          mappings = {
            i = {
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,
              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,
              ["<PageUp>"] = actions.results_scrolling_up,
              ["<PageDown>"] = actions.results_scrolling_down,
              ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-l>"] = actions.complete_tag,
              ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
            },
            n = {
              ["<esc>"] = actions.close,
              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,
              ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["j"] = actions.move_selection_next,
              ["k"] = actions.move_selection_previous,
              ["H"] = actions.move_to_top,
              ["M"] = actions.move_to_middle,
              ["L"] = actions.move_to_bottom,
              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,
              ["gg"] = actions.move_to_top,
              ["G"] = actions.move_to_bottom,
              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,
              ["<PageUp>"] = actions.results_scrolling_up,
              ["<PageDown>"] = actions.results_scrolling_down,
              ["?"] = actions.which_key,
            },
          },
        },
        
        pickers = {
          -- Find files configuration
          find_files = {
            theme = "dropdown",
            previewer = true,
            hidden = false,
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
            layout_config = {
              dropdown = {
                width = 0.9,
                height = 0.8,
                preview_width = 0.6,
                preview_height = 0.4,
              }
            }
          },
          
          -- Live grep configuration  
          live_grep = {
            theme = "ivy",
            additional_args = function()
              return { "--hidden" }
            end,
          },
          
          -- Buffer configuration
          buffers = {
            theme = "dropdown",
            previewer = false,
            initial_mode = "normal",
            mappings = {
              i = {
                ["<C-d>"] = actions.delete_buffer,
              },
              n = {
                ["dd"] = actions.delete_buffer,
              },
            },
          },
          
          -- LSP references
          lsp_references = {
            theme = "ivy",
            initial_mode = "normal",
          },
          
          -- LSP definitions
          lsp_definitions = {
            theme = "ivy",
            initial_mode = "normal",
          },
          
          -- Document symbols (great for Go structs/functions)
          lsp_document_symbols = {
            theme = "dropdown",
            previewer = false,
          },
          
          -- Workspace symbols (search across Go modules)
          lsp_workspace_symbols = {
            theme = "ivy",
          },
          
          -- Diagnostics (errors, warnings, etc.)
          diagnostics = {
            theme = "ivy",
            initial_mode = "normal",
          },
          
          -- Git commits
          git_commits = {
            theme = "ivy",
          },
          
          -- Git branches
          git_branches = {
            theme = "ivy",
            initial_mode = "normal",
          },
        },
        
        extensions = {
          -- FZF native extension for better performance
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          
          -- File browser extension
          file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            mappings = {
              ["i"] = {
                -- Custom mappings for file browser
              },
              ["n"] = {
                -- Custom mappings for file browser in normal mode
              },
            },
          },
        },
      })
      
      -- Load extensions
      telescope.load_extension("fzf")
      telescope.load_extension("file_browser")
    end,
  },
  
  -- Required dependency
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  
  -- FZF native for better performance
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    lazy = true,
  },
  
  -- File browser extension
  {
    "nvim-telescope/telescope-file-browser.nvim",
    lazy = true,
  },
  
  -- Icons
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
}
