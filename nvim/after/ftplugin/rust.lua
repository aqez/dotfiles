vim.keymap.set("n", "<C-b>", ":make build<CR>", { buffer = true, desc = "Cargo build" })

require("formatting").format_on_save("rust-format", { async = false })
