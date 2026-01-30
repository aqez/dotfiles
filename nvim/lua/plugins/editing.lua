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
        "https://codeberg.org/andyg/leap.nvim",
        dependencies = {
            "tpope/vim-repeat"
        },
        config = function()
            vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)')
            vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')
            vim.keymap.set('n',             'gs', '<Plug>(leap-from-window)')
        end
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = true
    },
}
