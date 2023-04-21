local settings = require("user-conf")
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_config(name)
  return string.format('require("config/%s")', name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer...")
  vim.api.nvim_command("packadd packer.nvim")
end

-- initialize and configure packer
local packer = require("packer")

packer.init({
  enable = true, -- enable profiling via :PackerCompile profile=true
  threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
  max_jobs = 20, -- Limit the number of simultaneous jobs. nil means no limit. Set to 20 in order to prevent PackerSync form being "stuck" -> https://github.com/wbthomason/packer.nvim/issues/746
  -- Have packer use a popup window
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

packer.startup(function(use)
  -- actual plugins list
  --
  use("wbthomason/packer.nvim")

  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    setup = get_config("telescope_setup"),
    config = get_config("telescope"),
  })
  use({
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
  })

  use({
    "nvim-telescope/telescope-frecency.nvim",
    after='telescope.nvim',
    config = function()
      require("telescope").load_extension("frecency")
    end,
    requires = 'tami5/sqlite.lua'
  })
  use({ "jvgrootveld/telescope-zoxide" })
  use({ "crispgm/telescope-heading.nvim" })
  use({ "jose-elias-alvarez/null-ls.nvim", config = get_config("null-ls") })
  use({ "MunifTanjim/prettier.nvim", config = get_config("prettier") })
  use({ "nvim-telescope/telescope-symbols.nvim" })
  use({ "nvim-telescope/telescope-file-browser.nvim" })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ "nvim-telescope/telescope-packer.nvim" })
  use({ "nvim-telescope/telescope-ui-select.nvim" })
  use({ "nvim-telescope/telescope-project.nvim" })

  use({
    "williamboman/mason.nvim",
    requires = { { "williamboman/mason-lspconfig.nvim" }, { "neovim/nvim-lspconfig" }},
    config = get_config("mason"),
  })
  use({
    "williamboman/mason-lspconfig.nvim",
    config = get_config("mason-lspconfig"),
  })
  use({
    "nvim-treesitter/nvim-treesitter",
    config = get_config("treesitter"),
    run = ":TSUpdate",
  })
  use({
    "kyazdani42/nvim-tree.lua",
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    config = get_config("nvim-tree-setup")
  })

  use({ "ahmedkhalf/project.nvim", config = get_config("project") })
  use({ "EdenEast/nightfox.nvim", config = get_config("nightfox") })
  use({
    "nvim-lualine/lualine.nvim",
    config = get_config("lualine"),
    event = "VimEnter",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })
  use({ "SmiteshP/nvim-navic" })
  use({ "onsails/lspkind-nvim", requires = { "famiu/bufdelete.nvim" } })
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "f3fora/cmp-spell",
      "hrsh7th/cmp-calc",
      "lukas-reineke/cmp-rg",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = get_config("cmp"),
  })

  use({ "rafamadriz/friendly-snippets" })
  use({
    "L3MON4D3/LuaSnip",
    requires = "saadparwaiz1/cmp_luasnip",
    config = get_config("luasnip"),
  })
  use({
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
    },
    config = get_config("diffview"),
  })

  use({
    "TimUntersberger/neogit",
    requires = { "nvim-lua/plenary.nvim" },
    cmd = "Neogit",
    config = get_config("neogit"),
  })
  use 'simrat39/rust-tools.nvim'

  -- Debugging
  use 'mfussenegger/nvim-dap'
  use({ "f-person/git-blame.nvim", config = get_config("git-blame") })

  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = get_config("gitsigns"),
  })

  use({ "tpope/vim-fugitive" }) -- yeah this is not lua but one of the best Vim plugins ever

  -- language server
  use({ "neovim/nvim-lspconfig", config = get_config("lsp") })
  use({ "RRethy/vim-illuminate", config = get_config("illuminate") })
  use({ "folke/which-key.nvim", config = get_config("which-key") })

end)
