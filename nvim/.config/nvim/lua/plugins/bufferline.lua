return {
	"akinsho/bufferline.nvim",
	version = "4.4.1",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
			},
		})
	end,
}
