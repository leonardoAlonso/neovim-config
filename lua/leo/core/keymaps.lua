vim.g.mapleader = " "
local keymap = vim.keymap

-- general
--
keymap.set("i", "jk", "<Esc>", { noremap = true }) -- jk to escape in insert mode
keymap.set("n", "<leader>nh", "nohl<CR>") -- clear highlights
keymap.set("n", "x", '"_x') -- don't yank to register when deleting
keymap.set("n", "<leader>+", "<C-a>") -- increment number under cursor
keymap.set("n", "<leader>-", "<C-x>") -- decrement number under cursor
keymap.set("n", "<leader>q", ":q<CR>") -- quit
keymap.set("n", "<leader>w", ":w<CR>") -- save file

-- split windows
keymap.set("n", "<leader>sv", "<C-w>v") -- split window horizontally
keymap.set("n", "<leader>sh", "<C-w>s") -- split window vertically
keymap.set("n", "<leader>se", "<C-w>=") -- equalize window sizes
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split windo

-- tabs
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- plugin keymaps
--
-- vim maximazer

keymap.set("n", "<leader>sm", ":MaximizerToggle!<CR>") -- maximize current window

-- nvim tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle nvim tree

-- telescope
-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- bufferline

keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>") -- go to buffer 1
keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>") -- go to buffer 2
-- next buffer
keymap.set("n", "<leader>]", ":BufferLineCycleNext<CR>") -- go to next buffer
-- previous buffer
keymap.set("n", "<leader>[", ":BufferLineCyclePrev<CR>") -- go to previous buffer
-- close buffer
keymap.set("n", "<leader>bd", ":BufferLinePickClose<CR>") -- close buffer
-- pick buffer
keymap.set("n", "<leader>bp", ":BufferLinePick<CR>") -- pick buffer
