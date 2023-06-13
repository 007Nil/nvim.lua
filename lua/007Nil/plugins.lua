local status, packer = pcall(require, 'packer')

function install_packer()
        local fn = vim.fn
        local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

if (not status) then
        print("Packer is not installed..")
        print("Let's install Packer")
        local status, _ = pcall(install_packer)
        print("Packer is installed Now!!")
        print("Reopen nvim..")

        install_packer()
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use) 
        use 'wbthomason/packer.nvim'
        --  A truecolor, solarized dark colorscheme
        --  Github: https://github.com/svrana/neosolarized.nvim
        use {
                'svrana/neosolarized.nvim',
                requires = { 'tjdevries/colorbuddy.nvim' }
        }
        -- A blazing fast and easy to configure Neovim statusline written in Lua.
        -- Github: https://github.com/nvim-lualine/lualine.nvim
        use {
                'nvim-lualine/lualine.nvim',
                requires = { 'nvim-tree/nvim-web-devicons', opt = true }
        }
        -- File Browser extension for telescope.nvim
        -- Github: https://github.com/nvim-telescope/telescope-file-browser.nvim
        use {
                "nvim-telescope/telescope-file-browser.nvim",
                requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
        }
        -- A high-performance color highlighter for Neovim
        -- GitHub: https://github.com/norcalli/nvim-colorizer.lua
        use ('norcalli/nvim-colorizer.lua')

        -- Treesitter configurations and abstraction layer for Neovim.
        -- Github: https://github.com/nvim-treesitter/nvim-treesitter
        use {
                'nvim-treesitter/nvim-treesitter',
                run = ':TSUpdate'
        }

end)
