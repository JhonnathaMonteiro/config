-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_setup(name)
	return string.format('require("setup/%s")', name)
end

return require("packer").startup(function(use)
	-- Packer can manage itself
	use({ "wbthomason/packer.nvim" })

	-- Theme
	use({ "rebelot/kanagawa.nvim", config = get_setup("kanagawa") })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/vim-vsnip" },
			{ "hrsh7th/cmp-vsnip" },
			{ "hrsh7th/vim-vsnip-integ" },
			{ "hrsh7th/cmp-calc" },
			{ "rafamadriz/friendly-snippets" },
		},
		config = get_setup("cmp"),
	})

	-- Autopairs
	use({
		"windwp/nvim-autopairs",
		after = "nvim-cmp",
		config = get_setup("autopairs"),
	})

	-- ts autotag
	use({ "windwp/nvim-ts-autotag", config = get_setup("ts_autotag") })

	-- File browsing
	use("nvim-telescope/telescope-file-browser.nvim")

	-- Native LSP
	use({ "neovim/nvim-lspconfig", config = get_setup("lsp") })
	use("simrat39/rust-tools.nvim")

    -- Null ls
    use({ "jose-elias-alvarez/null-ls.nvim", after = "nvim-lspconfig", config = get_setup("null_ls") })

	-- Lualine
	use({ "nvim-lualine/lualine.nvim", config = get_setup("lualine") })

	-- debugging
	use("mfussenegger/nvim-dap")
	use("leoluz/nvim-dap-go")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	use("nvim-telescope/telescope-dap.nvim")

	-- Grammar checking because I can't english
	use("rhysd/vim-grammarous")

	-- Telescope Requirements
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")

	-- Telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- Git
	use({ "lewis6991/gitsigns.nvim", config = get_setup("gitsigns") })
    use({ 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' })

	-- lspkind
	use({ "onsails/lspkind.nvim" })

	-- todo comments
	use("folke/todo-comments.nvim")

	-- Ident lines
	use({ "lukas-reineke/indent-blankline.nvim", config = get_setup("indent_blankline") })

	-- devicons
	use("kyazdani42/nvim-web-devicons")

	--  fullstack dev
	use("pangloss/vim-javascript")
	use("leafgarland/typescript-vim")
	use("maxmellon/vim-jsx-pretty")
	use("jparise/vim-graphql")
	use("mattn/emmet-vim")
end)
