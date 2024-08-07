local setup, nvimtree = pcall(require, "nvim-tree") -- check if nvim-tree is installed
if not setup then
	return
end

-- recomended settings for nvim tree docs

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "✗",
		staged = "✓",
		unmerged = "",
		renamed = "➜",
		untracked = "U",
		deleted = "",
	},
	folder = {
		default = "",
		open = "",
	},
}

nvimtree.setup({
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})
