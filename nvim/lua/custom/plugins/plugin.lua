return {
	-- Other plugins ...

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},

	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		priority = 1000,
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
