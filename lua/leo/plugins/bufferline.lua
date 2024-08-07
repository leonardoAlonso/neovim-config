local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both"
		close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
		middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
		indicator_icon = "▎",
		buffer_close_icon = "󰅙",
		modified_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 30,
		max_prefix_length = 15, -- prefix used when a buffer is deduplicated
		tab_size = 18,
		mappings = true,
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and "" or (e == "warning" and "" or "")
				s = s .. n .. sym
			end
			return s
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
			},
		},
		show_buffer_icons = true, -- disable filetype icons for buffers
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		separator_style = "thin",
		always_show_bufferline = true,
	},
	highlights = {
		fill = {
			guifg = "#282c34",
			guibg = "#282c34",
		},
		background = {
			guifg = "#282c34",
			guibg = "#282c34",
		},
		buffer_visible = {
			guifg = "#8ec07c",
			guibg = "#282c34",
		},
		close_button = {
			guifg = "#fb4934",
			guibg = "#282c34",
		},
		close_button_visible = {
			guifg = "#fb4934",
			guibg = "#282c34",
		},
		tab = {
			guifg = "#8ec07c",
			guibg = "#282c34",
		},
		tab_selected = {
			guifg = "#282c34",
			guibg = "#8ec07c",
		},
		tab_close = {
			guifg = "#282c34",
			guibg = "#282c34",
		},
		duplicate_selected = {
			guifg = "#282c34",
			guibg = "#282c34",
		},
		duplicate_visible = {
			guifg = "#282c34",
			guibg = "#282c34",
		},
		duplicate = {
			guifg = "#282c34",
			guibg = "#282c34",
		},
		indicator_selected = {
			guifg = "#282c34",
			guibg = "#282c34",
		},
		modified_selected = {
			guifg = "#282c34",
			guibg = "#282c34",
		},
		modified_visible = {
			guifg = "#282c34",
			guibg = "#282c34",
		},
		modified = {
			guifg = "#282c34",
			guibg = "#282c34",
		},
		separator = {
			guifg = "#282c34",
			guibg = "#282c34",
		},
	},
})
