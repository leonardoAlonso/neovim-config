
local keymap = vim.keymap

keymap.set("n", "<leader>vs", "require(swenv.api).pick_env()<CR>")
