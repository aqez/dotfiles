vim.opt_local.makeprg = "cmake --build build"

require("formatting").cleanup_and_format_on_save("c-format", { async = false })
