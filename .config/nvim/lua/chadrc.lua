-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "monekai",

	hl_override = {
		NvimTreeFolderIcon = { fg = "#ffd866" },
		NvimTreeOpenedFolderIcon = { fg = "#ffd866" },
		NvimTreeFolderName = { fg = "#f8f8f2" },
		NvimTreeOpenedFolderName = { fg = "#ffd866", bold = true },
		NvimTreeRootFolder = { fg = "#78dce8", bold = true },
		NvimTreeGitDirty = { fg = "#fc9867" },
		NvimTreeGitNew = { fg = "#a9dc76" },
		NvimTreeGitDeleted = { fg = "#ff6188" },
		NvimTreeIndentMarker = { fg = "#49483e" },
	},
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
