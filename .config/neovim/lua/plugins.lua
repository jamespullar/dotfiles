-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

	-- Tokyo Night theme
	-- https://github.com/folke/tokyonight.nvim
	use 'folke/tokyonight.nvim'

  -- Monokai Pro theme
  -- https://github.com/loctvl842/monokai-pro.nvim
  use {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup({
        devicons = true,
        filter = "octagon",
      })
    end
  }

  -- vim wiki
  -- https://github.com/vimwiki/vimwiki
  use {
    "vimwiki/vimwiki"
  }

  -- Telescope
  -- https://github.com/nvim-telescope/telescope.nvim
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Rainbow
  -- https://github.com/luochen1990/rainbow
  use 'luochen1990/rainbow'

  -- feline.vim
  -- https://github.com/feline-nvim/feline.nvim
  use 'feline-nvim/feline.nvim'

  -- tabby.nvim
  -- https://github.com/nanozuki/tabby.nvim
  use'nanozuki/tabby.nvim'

	-- nvim surround
	-- https://github.com/kylechui/nvim-surround
	use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
})
end)
