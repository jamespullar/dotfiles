""" init.vim

" ============= packer.nvim ============= "{{{
" https://github.com/wbthomason/packer.nvim
" ~/.config/nvim/lua/plugins.lua

lua require('plugins')

"}}}

" ============= general settings ============= "{{{

" colorscheme tokyonight-moon
colorscheme monokai-pro

set termguicolors

set number relativenumber                               " show hybrid relative line numbers
set tabstop=2 softtabstop=2 shiftwidth=2 autoindent
set expandtab																						" insert spaces instead of tabs
set nojoinspaces																				" prevent double spaces after puncuation

set title                                               " tab title as file name
set emoji                                               " enable emojis
set cursorline																					" highlight current line

set splitbelow																					" horizontal splits below current
set splitright																					" vertical splits to right of current

set ignorecase                                          " case insensitive search
set smartcase                                           " ... unless query has uppercase letters

"}}}

" ============= key mappings ============= "{{{

let mapleader="\<SPACE>"																" map leader key to SPACE

"}}}

" ============= plugin configuration ============= "{{{

" rainbow brackets
let g:rainbow_active = 1

lua << EOF

-- Telescope bindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Monokai Pro
-- require("monokai-pro").setup()

-- nvim-scrollbar
-- require("scrollbar").setup()

-- feline
require("feline").setup()

-- tabby
require('tabby.tabline').use_preset('active_wins_at_tail', {
  theme = {
    fill = 'TabLineFill', -- tabline background
    head = 'TabLine', -- head element highlight
    current_tab = 'TabLineSel', -- current tab label highlight
    tab = 'TabLine', -- other tab label highlight
    win = 'TabLine', -- window highlight
    tail = 'TabLine', -- tail element highlight
  },
  nerdfont = true, -- whether use nerdfont
  tab_name = {
      name_fallback = 'function({tabid}), return a string',
  },
  buf_name = {
      mode = "'unique'|'relative'|'tail'|'shorten'",
  },
})

-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close#rwblokzijl
-- local function tab_win_closed(winnr)
  -- local api = require"nvim-tree.api"
  -- local tabnr = vim.api.nvim_win_get_tabpage(winnr)
  -- local bufnr = vim.api.nvim_win_get_buf(winnr)
  -- local buf_info = vim.fn.getbufinfo(bufnr)[1]
  -- local tab_wins = vim.tbl_filter(function(w) return w~=winnr end, vim.api.nvim_tabpage_list_wins(tabnr))
  -- local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
  -- if buf_info.name:match(".*NvimTree_%d*$") then            -- close buffer was nvim tree
    -- -- Close all nvim tree on :q
    -- if not vim.tbl_isempty(tab_bufs) then                      -- and was not the last window (not closed automatically by code below)
      -- api.tree.close()
    -- end
  -- else                                                      -- else closed buffer was normal buffer
    -- if #tab_bufs == 1 then                                    -- if there is only 1 buffer left in the tab
      -- local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
      -- if last_buf_info.name:match(".*NvimTree_%d*$") then       -- and that buffer is nvim tree
        -- vim.schedule(function ()
          -- if #vim.api.nvim_list_wins() == 1 then                -- if its the last buffer in vim
            -- vim.cmd "quit"                                        -- then close all of vim
          -- else                                                  -- else there are more tabs open
            -- vim.api.nvim_win_close(tab_wins[1], true)             -- then close only the tab
          -- end
        -- end)
      -- end
    -- end
  -- end
-- end

-- vim.api.nvim_create_autocmd("WinClosed", {
  -- callback = function ()
    -- local winnr = tonumber(vim.fn.expand("<amatch>"))
    -- vim.schedule_wrap(tab_win_closed(winnr))
  -- end,
  -- nested = true
-- })
EOF

"}}}
