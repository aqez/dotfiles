local dap = require('dap')
local dapui = require("dapui")

require('dapui').setup({})
require("nvim-dap-virtual-text").setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dap.adapters.rust = {
    type = "server",
    host = "127.0.0.1",
    executable = {
        command = "/home/aqez/codelldb/extension/adapter/codelldb",
        args = { "--port", "${port}" }
    },
    port = "${port}"
}

dap.configurations.rust = {
    {
        type = 'rust';
        request = 'launch';
        name = "Launch";
        program = "${workspaceFolder}/target/debug/${workspaceFolderBasename}";
    },
}

dap.adapters.coreclr = {
    type = 'executable',
    command = '/usr/bin/netcoredbg',
    args = { '--interpreter=vscode'}
}

dap.configurations.cs = {
    {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/debug/", 'file')
        end,
    },
    {
        type = "coreclr",
        name = "attach - netcoredbg",
        request = "attach",
        processId = function()
            return vim.fn.input("Process Id")
        end
    }
}
