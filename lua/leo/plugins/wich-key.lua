local status, which_key = pcall(require, "which-key")
if not status then
	return
end

which_key.setup({
	plugins = {
		marks = true, -- Shows a list of your marks on ' and `
		registers = true, -- Shows your registers on " in normal or <C-r> in insert mode
		spelling = {
			enabled = true, -- Shows suggestions for spelling
			suggestions = 20, -- Number of spelling suggestions to show
		},
	},
})
