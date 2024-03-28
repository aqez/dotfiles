local function split(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end

local function get_name_from_path(path)
    local names = split(path, "\\.")
    local name = ""
    if #names >= 2 then
        name = names[#names - 1] .. "." .. names[#names]
    else
        name = names[#names]
    end
    return name
end

local function open_terminals_in_project()
    local allowed_folders = {}
    local terminals_file = vim.fn.system("find . -name '.terminals'")

    print("Terminals file: " .. terminals_file)

    if #terminals_file > 0 then
        print("Found terminals file, going to read it")
        local terminals = vim.fn.systemlist("cat " .. terminals_file)
        for k, v in pairs(terminals) do
            print("Adding " .. v .. " to allowed folders")
            allowed_folders[k] = "./" .. v
        end
    end

    local csproj_folders = vim.fn.systemlist("find . -name 'Program.cs' -maxdepth 2 -exec dirname {} \\; | uniq")
    local node_folders = vim.fn.systemlist("find . -name 'package.json' -maxdepth 2 -exec dirname {} \\; | uniq")
    local lisp_folders = vim.fn.systemlist("find . -name '*.asd' -maxdepth 2 -exec dirname {} \\; | uniq")

    for _, v in pairs(csproj_folders) do
        if #allowed_folders == 0 or vim.tbl_contains(allowed_folders, v) then
            local cmd = string.format('tmux new-window -dS -c %s -n %s "dotnet watch run"', v, get_name_from_path(v))
            vim.fn.system(cmd)
        end
    end

    for _, v in pairs(node_folders) do
        if #allowed_folders == 0 or vim.tbl_contains(allowed_folders, v) then
            local cmd = string.format('tmux new-window -dS -c %s -n %s "npm start; fish"', v, get_name_from_path(v))
            vim.fn.system(cmd)
        end
    end

    for _, v in pairs(lisp_folders) do
        if #allowed_folders == 0 or vim.tbl_contains(allowed_folders, v) then
            local sbcl_command = "ros run --eval '(ql:quickload :swank)'  --eval '(swank:create-server :dont-close t)'"
            local cmd = string.format('tmux new-window -dS -n "sbcl" %s', sbcl_command)
            vim.fn.system(cmd)
        end
    end
end

return {
    open_terminals_in_project = open_terminals_in_project
}
