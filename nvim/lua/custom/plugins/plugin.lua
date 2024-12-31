return {
	-- Other plugins ...

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
					icons = {
						{
							file = true,
							folder = true,
							folder_arrow = true,
							git = true,
						},
						glyphs = {
							default = "-",
						},
					},
				},
			})
		end,
	},

	-- Other plugins ...
}
