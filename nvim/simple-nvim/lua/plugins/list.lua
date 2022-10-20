local normal = {
    {
        'stevearc/dressing.nvim',
        lock = true,
        config = function()
            require('dressing').setup()
        end,
    },
    {
        'nvim-telescope/telescope.nvim',
        lock = true,
        tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim', lock = true } },
        config = function()
            require('telescope').setup({
                defaults = {
                    layout_strategy = 'vertical',
                    layout_config = { vertical = { width = 0.7 } },
                },
            })
        end,
    },
    {
        'folke/which-key.nvim',
        lock = true,
        config = function()
            require('which-key').setup()
        end,
    },
    {
        'mrjones2014/legendary.nvim',
        lock = true,
        config = function()
            require('legendary').setup()
        end,
    },
    {
        'nvim-telescope/telescope-project.nvim',
        lock = true,
        after = 'telescope.nvim',
        config = function()
            require('telescope').load_extension('project')
        end,
    },
    {
        'neovim/nvim-lspconfig',
    },
    {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        config = function()
            require('nvim-tree').setup()
        end,
        lock = true,
    },
    { 'lukas-reineke/indent-blankline.nvim', lock = true },
    {
        'windwp/nvim-autopairs',
        lock = true,
        config = function()
            require('nvim-autopairs').setup()
        end,
    },
    { 'kyazdani42/nvim-web-devicons', lock = true },
    { 'preservim/tagbar', lock = true },
    { 'kevinhwang91/nvim-bqf', lock = true },
    { 'nvim-treesitter/nvim-treesitter', lock = true },
    {
        'nvim-lualine/lualine.nvim',
        lock = true,
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup({ options = { theme = 'tokyonight' } })
        end,
    },
    { 'akinsho/bufferline.nvim', lock = true, requires = 'kyazdani42/nvim-web-devicons' },
}

local themes = {
    { 'folke/tokyonight.nvim', lock = true },
    { 'navarasu/onedark.nvim', lock = true },
    { 'tanvirtin/monokai.nvim', lock = true },
    { 'rose-pine/neovim', lock = true, as = 'rose-pine' },
    { 'catppuccin/nvim', lock = true, as = 'catppuccin' },
}

local function ues_plugins_list(use)
    -- packer can manage itself
    use('wbthomason/packer.nvim')
    use('lewis6991/impatient.nvim')

    for i = 1, #normal, 1 do
        use(normal[i])
    end

    for i = 1, #themes, 1 do
        use(themes[i])
    end
end

return ues_plugins_list
