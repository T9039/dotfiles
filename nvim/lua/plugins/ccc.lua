return {
	"uga-rosa/ccc.nvim",
	config = function()
		require("ccc").setup()
	end,
	keys = {
		{ "<leader>cp", "<cmd>CccPick<cr>", desc = "Color Picker" },
		{ "<leader>cc", "<cmd>CccConvert<cr>", desc = "Convert Color Format" },
	},
}
