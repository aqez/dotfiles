return {
    "romainl/vim-qf",
    {
        "mbbill/undotree",
        keys = {
            { "<leader>u",  group = "Undo Tree" },
            { "<leader>ut", ":UndotreeToggle<CR>", desc = "Toggle undo tree" },
        }
    },
    {
        "numToStr/Comment.nvim",
        opts = {},
        lazy = false
    },
    {
        'SCJangra/table-nvim',
        ft = 'markdown',
        opts = {},
    },
    {
        "ggandor/leap.nvim",
        dependencies = {
            "tpope/vim-repeat"
        },
        config = function()
            require('leap').create_default_mappings()
        end
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = true
    },
}
