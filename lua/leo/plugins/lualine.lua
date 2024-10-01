-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- get lualine nightfly theme
local lualine_theme = require("lualine.themes.palenight")

-- configure lualine with modified theme
lualine.setup({
	options = {
		theme = lualine_theme,
	},
	sections = {
		lualine_a = {
			{
				"buffers",
				show_filename_only = true, -- Shows shortened relative path when set to false.
				-- hide_filename_extension = false, -- Hide filename extension when set to true.
				show_modified_status = true, -- Shows indicator when the buffer is modified.
				--
				mode = 2, -- 0: Shows buffer name
				-- -- 1: Shows buffer index
				-- -- 2: Shows buffer name + buffer index
				-- -- 3: Shows buffer number
				-- -- 4: Shows buffer name + buffer number
				--
				-- -- max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
				-- -- it can also be a function that returns
				-- -- the value of `max_length` dynamically.
				-- -- Automatically updates active buffer color to match color of other components (will be overidden if buffers_color is set)
				-- use_mode_colors = false,
				--
				-- buffers_color = {
				-- 	-- Same values as the general color option can be used here.
				-- 	active = "lualine_{section}_normal", -- Color for active buffer.
				-- 	inactive = "lualine_{section}_inactive", -- Color for inactive buffer.
				-- },
				--
				symbols = {
					modified = " ●", -- Text to show when the buffer is modified
					alternate_file = "#", -- Text to show to identify the alternate file
					directory = "", -- Text to show when the buffer is a directory
				},
			},
		},
	},
})
