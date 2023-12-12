return {
	"goolord/alpha-nvim",
  enabled = true,
	event = "VimEnter",
	config = function()
		require("alpha").setup(require("alpha.themes.dashboard").config)
	end,
}
