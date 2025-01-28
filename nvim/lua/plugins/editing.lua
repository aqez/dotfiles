return {
    "romainl/vim-qf",
    {
        "mbbill/undotree",
        config = function()
            local wk = require("which-key")

            wk.add({
                { "<leader>u",  group = "Undo Tree" },
                { "<leader>ut", ":UndotreeToggle<CR>", desc = "Toggle undo tree" },
            })
        end
    },
    {
        "numToStr/Comment.nvim",
        opts = {},
        lazy = false
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
        config = function()
            require("nvim-surround").setup {}
        end
    },
}
