local terminals = require("open_terminals")

local wk = require("which-key")

wk.add({
    { "<BS>",       "<C-^>",                             desc = "Previous file" },
    { "<C-b>",      ":make<CR>",                         desc = "Build" },
    { "<C-j>",      ":cn<CR>",                           desc = "Next Quickfix" },
    { "<C-k>",      ":cp<CR>",                           desc = "Previous Quickfix" },
    { "<C-s>",      ":w<CR>",                            desc = "Save buffer" },
    { "<CR>",       ":noh<CR><CR>",                      desc = "Clear search highlights" },

    { "<leader>b",  group = "Buffers" },
    { "<leader>bo", ':%bdelete|edit #|normal`"<CR>',     desc = "Kill all but current buffer" },

    { "<leader>d",  group = "Debug/Diagnostics" },
    { "<leader>dd", vim.diagnostic.open_float,           desc = "Show line diagnostic in floating window" },
    { "<leader>dn", vim.diagnostic.goto_next,            desc = "Go to next diagnostic" },
    { "<leader>dp", vim.diagnostic.goto_prev,            desc = "Go to previous diagnostic" },

    { "<leader>h",  "<C-w>h",                            desc = "Move to left window" },
    { "<leader>j",  "<C-w>j",                            desc = "Move to bottom window" },
    { "<leader>k",  "<C-w>k",                            desc = "Move to top window" },
    { "<leader>l",  "<C-w>l",                            desc = "Move to right window" },

    { "<leader>p",  group = "Project" },
    { "<leader>pf", function()
        local path = vim.api.nvim_buf_get_name(0)
        if path == "" then
            vim.notify("No file loaded", vim.log.warn)
            return
        end
        local root = vim.fs.root(0, ".git") or vim.fn.getcwd()
        local rel = vim.fn.fnamemodify(path, ':')
        if rel:sub(1, #root + 1) == root .. "/" then
            rel = rel:sub(#root + 2)
        end
        vim.fn.setreg("+", rel)
        vim.notify("Copied: " .. rel, vim.log.info)
      end, desc = "Copy file path (relative to project root)" },
    { "<leader>pT", terminals.open_terminals_in_project, desc = "Open terminals in project" },

    { "[e",         ":cprev<CR>",                        desc = "Previous Quickfix" },
    { "]e",         ":cnext<CR>",                        desc = "Next Quickfix" },
})

local function get_current_line()
  return vim.api.nvim_get_current_line()
end

local function is_todo(line)
  return line:match("^%s*%- %[[ xX]%] ")
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.keymap.set("i", "<c-cr>", function()
            local line = get_current_line()

            if is_todo(line) then
                return "<Esc>o- [ ] <esc>A"
            end

            return "<CR>"
        end, { buffer = true, expr = true, noremap = true })
    end
})
