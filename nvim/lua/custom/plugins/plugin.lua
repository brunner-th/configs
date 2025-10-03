return {
	-- Other plugins ...

	{
		"navarasu/onedark.nvim",
		name = "onedark",
		priority = 1000,
		config = function()
			require("onedark").setup({
				style = "deep",
			})
		end,
	},

	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({})
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- Optional for file icons
		},
		config = function()
			require("nvim-tree").setup({
				-- Add your preferred configuration here
				view = {
					width = 30,
					side = "left",
				},
				renderer = {
					--icons = {
					--{
					--	file = true,
					--	folder = true,
					--	folder_arrow = true,
					--	git = true,
					--},
					--},
				},
			})
		end,
	},
	{
		"github/copilot.vim",
	},
	-- Other plugins ...
}
