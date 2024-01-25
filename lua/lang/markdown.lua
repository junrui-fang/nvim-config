return {
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,

		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },

		config = function()
			vim.g.mkdp_auto_close = 1
			vim.g.mkdp_theme = "dark"
		end,

		keys = {
			{ "<leader>m", "<cmd>MarkdownPreview<cr>", ft = "markdown", desc = "Markdown Preview" },
		},
	},
}
