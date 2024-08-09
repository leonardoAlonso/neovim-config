local setup, nvimtree = pcall(require, "nvim-tree") -- check if nvim-tree is installed
if not setup then
	return
end

-- recomended settings for nvim tree docs

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
	filters = {
		dotfiles = false,
		custom = { "node_modules" },
		exclude = {},
	},
	view = {
		width = 30,
		side = "left",
	},
	git = {
		ignore = false,
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	renderer = {
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			},
		},
	},
})
