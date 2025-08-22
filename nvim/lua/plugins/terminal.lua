return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true,
        keys = {
            { "<leader>T", function() require('toggleterm').toggle() end, desc = "Toggle Terminal" }
        }
    }
}
