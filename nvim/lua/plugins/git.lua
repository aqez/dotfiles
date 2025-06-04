return {
    {
        "f-person/git-blame.nvim",
        keys = {
            { "<leader>gB", ":GitBlameToggle<CR>", desc = "Toggle git blame" },
        },
        lazy = false,
        opts = {}
    },
    {
        'TimUntersberger/neogit',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
        },
        keys = {
            { "<leader>g",  group = "Git" },
            { "<leader>gg", ":Neogit<CR>",    desc = "Open Neogit" },
            { "<leader>gf", ":!git pull<CR>", desc = "Git pull" },
        },
        opts = {}
    },
    {
        "pwntester/octo.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-tree/nvim-web-devicons"
        },
        opts = {
            default_to_projects_v2 = true
        },
        keys = {
            { "<leader>gi",  group = "Issues" },
            { "<leader>gic", ":Octo issue create<CR>",  desc = "Create issue" },
            { "<leader>gil", ":Octo issue list<CR>",    desc = "Open Octo issue list" },
            { "<leader>gib", ":Octo issue browser<CR>", desc = "Open issue in browser" },

            { "<leader>gp",  group = "Pull Requests" },
            { "<leader>gpb", ":Octo pr browser<CR>",    desc = "Open PR in browser" },
            { "<leader>gpc", ":Octo pr create<CR>",     desc = "Create Pull Request" },
            { "<leader>gpl", ":Octo pr list<CR>",       desc = "Open Octo PR list" },
            { "<leader>gpu", ":Octo pr url<CR>",        desc = "Copy PR URL" },
        }
    },
    {
        "topaxi/pipeline.nvim",
        keys = {
            { "<leader>ga", ":Pipeline<cr>", desc = "Github Actions" },
        },
        opts = {
            refresh_interval = 2
        }
    },
}
