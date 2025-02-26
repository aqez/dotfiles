return {
    {
        'mfussenegger/nvim-dap',
        keys = function()
            local dap = require('dap')
            return {
                { "<F10>",      dap.step_over,         desc = "Step over" },
                { "<F11>",      dap.step_into,         desc = "Step into" },
                { "<F12>",      dap.step_out,          desc = "Step out" },
                { "<F5>",       dap.continue,          desc = "Continue debugging" },
                { "<F9>",       dap.toggle_breakpoint, desc = "Toggle breakpoint" },
                { "<leader>dr", dap.repl.open,         desc = "Open debugging REPL" },
            }
        end,
        config = function()
            local dap = require('dap')
            local debuggers_folder = vim.fn.stdpath('data') .. "/mason"

            dap.adapters.coreclr = {
                type = "executable",
                command = debuggers_folder .. "/packages/netcoredbg/netcoredbg",
                args = { "--interpreter=vscode" }
            }

            dap.adapters.netcoredbg = dap.adapters.coreclr
            dap.adapters.dotnet = dap.adapters.coreclr

            dap.configurations.cs = {
                {
                    type = "coreclr",
                    name = "attach - netcoredbg",
                    request = "attach",
                    processId = require('dap.utils').pick_process,
                }
            }

            local wk = require('which-key')
            wk.add({
            })
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        keys = function()
            local dapui = require("dapui")
            local dapui_widgets = require("dap.ui.widgets")
            return {
                { "<leader>dh", dapui_widgets.preview, desc = "Show hover" },
                { "<leader>dt", dapui.toggle,          desc = "Toggle debugging UI" },
            }
        end
    },
    {
        "leoluz/nvim-dap-go",
        dependencies = { "mfussenegger/nvim-dap" },
    },
}
