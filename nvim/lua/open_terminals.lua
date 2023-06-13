
local function open_terminals_in_project()
    local csproj_folders = vim.fn.systemlist("find . -name 'Program.cs' -maxdepth 2 -exec dirname {} \\; | uniq")
    local node_folders = vim.fn.systemlist("find . -name 'package.json' -maxdepth 2 -exec dirname {} \\; | uniq")

    for k, v in pairs(csproj_folders) do
        local cmd = string.format('tmux new-window -c %s -n %s "dotnet watch run"', v, v, v)
        vim.fn.system(cmd)
    end

    for k, v in pairs(node_folders) do
        local cmd = string.format('tmux new-window -c %s -n %s "npm start"', v, v, v)
        vim.fn.system(cmd)
    end
end

return {
    open_terminals_in_project = open_terminals_in_project
}
