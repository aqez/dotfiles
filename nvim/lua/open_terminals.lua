local function split(inputstr, sep)
    print("Splitting " .. inputstr .. " on " .. sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end

local function open_terminals_in_project()
    local csproj_folders = vim.fn.systemlist("find . -name 'Program.cs' -maxdepth 2 -exec dirname {} \\; | uniq")
    local node_folders = vim.fn.systemlist("find . -name 'package.json' -maxdepth 2 -exec dirname {} \\; | uniq")

    for k, v in pairs(csproj_folders) do
        local names = split(v, "\\.")
        local cmd = string.format('tmux new-window -dS -c %s -n %s', v, v, names[#names])
        vim.fn.system(cmd)
    end

    for k, v in pairs(node_folders) do
        local names = split(v, "\\.")
        local cmd = string.format('tmux new-window -dS -c %s -n %s "npm start; fish"', v, v, names[#names])
        vim.fn.system(cmd)
    end
end

return {
    open_terminals_in_project = open_terminals_in_project
}
