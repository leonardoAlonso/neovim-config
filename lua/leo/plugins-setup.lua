-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	-- packer can manage itself
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

	-- use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
	-- use({ "catppuccin/nvim", as = "catppuccin" }) -- preferred colorscheme

	use("rebelot/kanagawa.nvim")

	-- use("folke/tokyonight.nvim") -- preferred colorscheme

	-- tmux & split window navigator
	use("christoomey/vim-tmux-navigator") -- navigate between tmux panes and vim splits
	use("szw/vim-maximizer") -- maximize splits  (use :MaximizerToggle)

	-- essential plugins
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})
	use("vim-scripts/ReplaceWithRegister") -- replace text with register content (use gr)

	-- coment with gc
	use("numToStr/Comment.nvim") -- comment with gc

	-- file explorer

	use("nvim-tree/nvim-tree.lua") -- file explorer

	-- icons
	use("kyazdani42/nvim-web-devicons") -- file icons

	-- satus line
	use("nvim-lualine/lualine.nvim") -- status line

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	-- copilot
	use({ "github/copilot.vim", branch = "release" })
	use({ "wakatime/vim-wakatime", lazy = false })
	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	}) -- enhanced lsp uis
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
	--
	-- -- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
	})

	-- auto closing
	-- use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	use({
		"MeanderingProgrammer/render-markdown.nvim",
		after = { "nvim-treesitter" },
		requires = {
			{ "nvim-tree/nvim-web-devicons", opt = true },
		},
	})

	use("romgrk/barbar.nvim") -- tabline
	use({
		"folke/todo-comments.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	}) -- comment toggler

	-- nvim v0.7.2
	-- use({
	-- 	"kdheepak/lazygit.nvim",
	-- 	-- optional for floating window border decoration
	-- 	requires = {
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- })
	use({
		"NeogitOrg/neogit",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "sindrets/diffview.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
	})
	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({ "ChristianChiarulli/swenv.nvim", requires = { "nvim-lua/plenary.nvim" } }) -- switch between virtual environments

	use({
		"folke/which-key.nvim",
	}) -- keybindings helper

	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})

	use({
		"tpope/vim-fugitive",
	})

	use({
		"FabijanZulj/blame.nvim",
		lazy = false,
		config = function()
			require("blame").setup({})
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
