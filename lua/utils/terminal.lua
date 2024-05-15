local M = {}

local function default_on_open(term)
	vim.cmd("startinsert!")
	vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
end

function M.open_term(cmd, opts)
	opts = opts or {}
	opts.hidden = opts.hidden or true
	opts.direction = opts.direction or "float"
	opts.float_opts = opts.float_opts or {
		border = "none",
		width = 100000,
		height = 100000,
	}
	opts.on_open = opts.on_open or default_on_open
	opts.on_exit = opts.on_exit or nil
	opts.dir = opts.dir or "git_dir"

	local Terminal = require("toggleterm.terminal").Terminal
	local term = Terminal:new({
		cmd = cmd,

		hidden = opts.hidden,
		direction = opts.direction,
		float_opts = opts.float_opts,

		dir = opts.dir,
		-- close_on_exit = false,
		on_open = opts.on_open,
		on_exit = opts.on_exit,
	})
	term:toggle()
end

return M
