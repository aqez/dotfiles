-- Find the body (everything after the frontmatter) of the most recent daily
-- note that exists before `target_time`. Scans backwards day-by-day so gaps
-- (weekends, skipped days) are handled. Returns a list of lines or nil.
local function previous_daily_body(target_time)
    local daily = require("obsidian.daily")
    local Note = require("obsidian.note")
    local day = 24 * 60 * 60
    for i = 1, 365 do
        local path = daily.daily_note_path(target_time - i * day)
        if path:is_file() then
            local body = Note.from_file(path):body_lines()
            -- Trim leading/trailing blank lines.
            while #body > 0 and body[1]:match("^%s*$") do
                table.remove(body, 1)
            end
            while #body > 0 and body[#body]:match("^%s*$") do
                table.remove(body)
            end
            if #body > 0 then
                return body
            end
            return nil
        end
    end
    return nil
end

-- Open the daily note for `target_time`. If it doesn't exist yet, create it
-- and seed its body with the previous filled-out daily note's content.
local function open_daily(target_time)
    local daily = require("obsidian.daily")
    local note = daily.daily { date = target_time }

    if note:exists() then
        note:open()
        return
    end

    local body = previous_daily_body(target_time)
    note:write {
        update_content = function(content)
            if body and #body > 0 then
                if #content > 0 and not content[#content]:match("^%s*$") then
                    table.insert(content, "")
                end
                vim.list_extend(content, body)
            end
            return content
        end,
    }
    note:open()
end

return {
    {
        "obsidian-nvim/obsidian.nvim",
        version = "*",
        ft = "markdown",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        opts = {
            legacy_commands = false,
            workspaces = {
                { name = "notes", path = "~/repos/notes" }
            },
            daily_notes = {
                folder = "dailies"
            },
            checkbox = {
                order = { " ", "/", "x" }
            },
            ui = { enable = true },
            note_id_func = ( function(title)
                return title:gsub(' ', '-'):gsub('\\[\\^A-Za-z0-9-\\]', ''):lower()
            end),
        },
        keys = {
            { "<leader>n",   group = "Notes" },
            { "<leader>ns",  "<cmd>Obsidian search<cr>",    desc = "Search Notes" },
            { "<leader>nn",  "<cmd>Obsidian new<cr>",       desc = "New Note" },

            { "<leader>nd",  group = "Dailies",            desc = "Dailies" },
            --{ "<leader>ndd", ":ObsidianDailies<cr>",   desc = "Today" },
            { "<leader>ndd", "<cmd>Obsidian dailies<cr>",   desc = "Dailies" },
            { "<leader>ndt", function() open_daily(os.time()) end, desc = "Today" },
            { "<leader>ndy", "<cmd>Obsidian yesterday<cr>", desc = "Yesterday" },
            { "<leader>ndT", "<cmd>Obsidian tomorrow<cr>",  desc = "Tomorrow" },
        }
    }
}
