-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme

-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    })
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Install plugins
return packer.startup(function(use)
    -- Add you plugins here:
    use('wbthomason/packer.nvim') -- packer can manage itself

    use({
        'folke/which-key.nvim',
        config = function()
            require('which-key').setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    })

    use({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } },
    })

    use({
        'nvim-telescope/telescope-project.nvim',
        after = 'telescope.nvim',
        config = function()
            require('telescope').load_extension('project')
        end,
    })

    -- File explorer
    use('kyazdani42/nvim-tree.lua')

    -- Indent line
    use('lukas-reineke/indent-blankline.nvim')

    -- Autopair
    use({
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end,
    })

    -- Icons
    use('kyazdani42/nvim-web-devicons')

    -- Tag viewer
    use('preservim/tagbar')

    use({ 'kevinhwang91/nvim-bqf' })

    -- Treesitter interface
    use({
        'nvim-treesitter/nvim-treesitter',
        commit = 'dd8475fbd2fdc368d5bc10bd585232a65c6c8d64',
    })

    -- Color schemes
    use('navarasu/onedark.nvim')
    use('tanvirtin/monokai.nvim')
    use({ 'rose-pine/neovim', as = 'rose-pine' })

    -- LSP
    use('neovim/nvim-lspconfig')

    -- Autocomplete
    use({
        'hrsh7th/nvim-cmp',
        requires = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'saadparwaiz1/cmp_luasnip',
        },
    })

    -- Statusline
    use({
        'feline-nvim/feline.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
    })

    -- git labels
    use({
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('gitsigns').setup()
        end,
    })

    -- Dashboard (start screen)
    use({
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
    })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
