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
