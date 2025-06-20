--[[
-- neovim settings
]]

local global = vim.g
local o = vim.opt


o.number = true -- Show line numbers
o.relativenumber = true -- Show line numbers relative to the current line


o.termguicolors = true
o.syntax = "on"
o.cursorline = true
o.ruler = true
o.wrap = false


o.smoothscroll = true


o.autoindent = true -- Match indent from current line when starting new lines
o.smartindent = true
o.shiftwidth = 4
o.softtabstop = 4
o.tabstop = 4
o.expandtab = true


o.clipboard="unnamed,unnamedplus"

