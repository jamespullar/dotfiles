--[[
-- key bindings
]]

local g = vim.g
local k = vim.keymap


g.mapleader = " " -- Set vim leader to <space>

k.set('n', '<Leader>', 'za') -- Toggle folds with leader key

-- Split navigation using Ctrl+hjkl
k.set('n', '<C-h>', '<C-w>h')
k.set('n', '<C-j>', '<C-w>j')
k.set('n', '<C-k>', '<C-w>k')
k.set('n', '<C-l>', '<C-w>l')
