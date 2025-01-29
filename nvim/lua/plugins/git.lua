return {
    {
        "f-person/git-blame.nvim",
        config = function()
            local wk = require("which-key")
            wk.add({
                { "<leader>gB", ":GitBlameToggle<CR>", desc = "Toggle git blame" },
            })
        end
    },
    {
        'TimUntersberger/neogit',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            require('neogit').setup {}

            local wk = require("which-key")

            wk.add({
                { "<leader>g",  group = "Git" },
                { "<leader>gg", ":Neogit<CR>",    desc = "Open Neogit" },
                { "<leader>gf", ":!git pull<CR>", desc = "Git pull" },
            })
        end
    },
    {
        "pwntester/octo.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("octo").setup({
                default_to_projects_v2 = true
            })

            local wk = require("which-key")

            wk.add({
                { "<leader>gi",  group = "Issues" },
                { "<leader>gic", ":Octo issue create<CR>", desc = "Create issue" },
                { "<leader>gil", ":Octo issue list<CR>",   desc = "Open Octo issue list" },

                { "<leader>gp",  group = "Pull Requests" },
                { "<leader>gpb", ":Octo pr browser<CR>",   desc = "Open PR in browser" },
                { "<leader>gpc", ":Octo pr create<CR>",    desc = "Create Pull Request" },
                { "<leader>gpl", ":Octo pr list<CR>",      desc = "Open Octo PR list" },
                { "<leader>gpu", ":Octo pr url<CR>",       desc = "Copy PR URL" },
            })
        end
    },
    {
        "topaxi/pipeline.nvim",
        --config = function()
        --    require("pipeline-nvim").setup({
        --        refresh_interval = 2
        --    })

        --    local wk = require("which-key")

        --    wk.add({
        --        { "<leader>ga", ":Pipeline<cr>", desc = "Github Actions" },
        --    })
        --end
    },
}
