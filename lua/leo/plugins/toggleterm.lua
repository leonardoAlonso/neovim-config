local status, toggleterm = pcall(require, "toggleterm")
if not status then
	return
end

toggleterm.setup({

	direction = "float", -- "vertical" | "horizontal" | "window" | "float"
	close_on_exit = true, -- close the terminal window when the process exits
})
