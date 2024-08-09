local status, swenv = pcall(require, "swenv")
if not status then
	return
end

swenv.setup({
	-- Should return a list of tables with a `name` and a `path` entry each.
	-- Gets the argument `venvs_path` set below.
	-- By default just lists the entries in `venvs_path`.
	get_venvs = function(venvs_path)
		return require("swenv.api").get_venvs(venvs_path)
	end,
	-- Path passed to `get_venvs`.
	venvs_path = vim.fn.expand("/opt/miniconda3/envs/"),
	-- Something to do after setting an environment, for example call vim.cmd.LspRestart
	post_set_venv = nil,
})

vim.api.nvim_set_keymap(
	"n",
	"<leader>senv",
	':lua require("swenv.api").pick_venv()<CR>',
	{ noremap = true, silent = true }
)
