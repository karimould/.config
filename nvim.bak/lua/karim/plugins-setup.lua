local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import any extras modules here
    -- { import = "lazyvim.plugins.extras.lang.typescript" },
    -- { import = "lazyvim.plugins.extras.lang.json" },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- Install your plugins here
return packer.startup(function(use)
	-- Core
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use({ "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" }) -- An implementation of the Popup API from vim in Neovim
	use({ "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }) -- Useful lua functions used ny lots of plugins

	-- Window Manangment
	use({ "szw/vim-maximizer", commit = "2e54952fe91e140a2e69f35f22131219fcd9c5f1" })

	-- Coding
	use({ "numToStr/Comment.nvim", commit = "ad7ffa8ed2279f1c8a90212c7d3851f9b783a3d6" })

	-- Colorschemes
	use("bluz71/vim-nightfly-guicolors")

	-- cmp / autocompletion
	use({ "hrsh7th/nvim-cmp", commit = "c53dd36adcf512611fa7c523fced55447bfdbfa5" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }) -- buffer completions
	use({ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }) -- path completions

	-- snippets
	use({ "L3MON4D3/LuaSnip", commit = "619796e2477f7233e5fdff456240676a08482684" }) -- snippet engine
	use({ "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" }) -- for autocompletion
	use({ "rafamadriz/friendly-snippets", commit = "c93311fbcc840210a2c0db574177d84a35a2c9c1" }) -- useful snippets

	-- Which Key
	use({ "folke/which-key.nvim", commit = "61553aeb3d5ca8c11eea8be6eadf478062982ac9" })

	-- LSP
	use({ "williamboman/mason.nvim", commit = "d85d71e910d1b2c539d17ae0d47dad48f8f3c8a7" }) -- simple to use language server installer
	use({ "williamboman/mason-lspconfig.nvim", commit = "a910b4d50f7a32d2f9057d636418a16843094b7c" }) -- simple to use language server installer+´

	-- LSP Configs
	use({ "neovim/nvim-lspconfig", commit = "c96ec574eacfff8ad8dd4bdb6e96a1b3dbd268fd" }) -- easily configure language servers
	use({ "hrsh7th/cmp-nvim-lsp", commit = "78924d1d677b29b3d1fe429864185341724ee5a2" }) -- for autocompletion
	use({ "glepnir/lspsaga.nvim", commit = "201dbbd13d6bafe1144475bbcae9efde224e07ec" }) -- enhanced lsp uis
	use({ "jose-elias-alvarez/typescript.nvim", commit = "0c7d908ef7760dbca586ed7a7660d224406b1eab" }) -- additional functionality for typescript server (e.g. rename file & update imports)
	use({ "onsails/lspkind.nvim", commit = "c68b3a003483cf382428a43035079f78474cd11e" }) -- vs-code like icons for autocompletion

	-- formatting & linting
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "07d4ed4c6b561914aafd787453a685598bec510f" }) -- configure formatters & linters
	use({ "jayp0521/mason-null-ls.nvim", commit = "2958e76f284684146ac04da9361da431afc0e7cf" }) -- bridges gap b/w mason & null-ls

	-- Lualine
	use({
		"nvim-lualine/lualine.nvim",
		commit = "3325d5d43a7a2bc9baeef2b7e58e1d915278beaf",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- telescope
	use({ "nvim-telescope/telescope.nvim", commit = "7a4ffef931769c3fe7544214ed7ffde5852653f6" })

	-- nvim-tree
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- git
	use({
		"lewis6991/gitsigns.nvim",
		commit = "9ff7dfb051e5104088ff80556203634fc8f8546d",
	})
	use({
		"kdheepak/lazygit.nvim",
		commit = "32bffdebe273e571588f25c8a708ca7297928617",
	})

	-- bufferline
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

	-- Terminal
	use({ "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" })

	-- TreeSitter
	use({
		"nvim-treesitter/nvim-treesitter",
		commit = "692432df294ef3881f450dc80839e21c978cde28",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use({ "tpope/vim-surround", commit = "3d188ed2113431cf8dac77be61b842acb64433d9" }) -- add, delete, change surroundings (it's awesome)

	-- auto closing
	use({ "windwp/nvim-autopairs", commit = "6b6e35fc9aca1030a74cc022220bc22ea6c5daf4" }) -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", commit = "fdefe46c6807441460f11f11a167a2baf8e4534b", after = "nvim-treesitter" }) -- autoclose tags

	-- undotree
	use({ "mbbill/undotree", commit = "bd60cb564e3c3220b35293679669bb77af5f389d" })

	-- live server
	use({ "manzeloth/live-server", commit = "ecd7c1418823b65dd2bca710587c80afe42c973e" })

	-- harpoon
	use({ "ThePrimeagen/harpoon", commit = "21d0d1bfa3000e4384740bfaefa0ebc51c773786" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
