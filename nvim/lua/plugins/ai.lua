return {
    {
        "jackMort/ChatGPT.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "folke/trouble.nvim", -- optional
            "nvim-telescope/telescope.nvim"
        },
        config = function()
            local gpt = require("chatgpt")

            gpt.setup({
                openai_params = {
                    --model = "gpt-4o-mini-2024-07-18"
                    model = "chatgpt-4o-latest"
                },
                openai_edit_params = {
                    model = "chatgpt-4o-latest"
                },
                api_key_cmd = "cat /home/aqez/gpt.token"
            })
        end
    }
}
