return {
    {
        "nvim-telescope/telescope-project.nvim",
        -- module = "telescope",
        after = "telescope.nvim",
        config = function()
            require("telescope").load_extension("project")
        end,
    },

    {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    },
}

