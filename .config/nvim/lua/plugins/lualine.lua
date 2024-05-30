return {
	{
		"nvim-lualine/lualine.nvim",

		opts = function(_, opts)
			opts.sections.lualine_z = {
				{
					"buffers",
					icons_enabled = false,
					mode = 1,
					max_length = vim.o.columns * 1 / 8,
				},
			}
		end,
	},
}
