local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
  profile = {
    enable = true,
  },
  max_jobs = 16,
})

return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")

  use("gpanders/editorconfig.nvim")

  use({
    "lewis6991/impatient.nvim",
    config = function()
      require("impatient").enable_profile()
    end,
  })

  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.indent_blankline")
    end,
  })

  use("kyazdani42/nvim-web-devicons")

  use({
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("plugins.nvim-tree")
    end,
  })

  -- use "github/copilot.vim"

  use({
    "windwp/nvim-autopairs",
    config = function()
      require("plugins.autopairs")
    end,
  })

  use({
    "akinsho/bufferline.nvim",
    branch = "main",
    config = function()
      require("plugins.bufferline")
    end,
  })

  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins.gitsigns")
    end,
  })

  use({
    "QaidVoid/tokyonight.nvim",
    config = function()
      require("plugins.tokyonight")
    end,
  })

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",

      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("plugins.cmp")
    end,
  })

  use({
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup()
    end,
  })

  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("plugins.null-ls")
    end,
  })

  use({
    "neovim/nvim-lspconfig",
    requires = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("lsp")
    end,
  })

  use({
    "ray-x/lsp_signature.nvim",
    config = function()
      require("plugins.lsp_signature")
    end,
  })

  use({
    "simrat39/rust-tools.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("plugins.rust-tools")
    end,
  })

  use("p00f/cphelper.nvim")

  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end,
  })

  -- JDTLS
  -- use "mfussenegger/nvim-jdtls"

  use({
    "mfussenegger/nvim-dap",
    config = function()
      require("plugins.dap")
    end,
  })

  use({
    "rcarriga/nvim-dap-ui",
    requires = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("plugins.dap-ui")
    end,
  })

  use({
    "nvim-lualine/lualine.nvim",
    requires = {
      "arkav/lualine-lsp-progress",
    },
    config = function()
      require("plugins.statusline")
    end,
  })

  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-telescope/telescope-media-files.nvim",
    },
    config = function()
      require("plugins.telescope")
    end,
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "windwp/nvim-ts-autotag",
    },
    run = ":TSUpdate",
    config = function()
      require("plugins.treesitter")
    end,
  })

  use({
    "numToStr/Comment.nvim",
    requires = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("plugins.comment")
    end,
  })

  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("plugins.colorizer")
    end,
  })

  use({
    "nvim-orgmode/orgmode",
    config = function()
      require("plugins.orgmode")
    end,
  })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
