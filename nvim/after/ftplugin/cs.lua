vim.opt_local.makeprg = "dotnet build --nologo -v q /clp:NoSummary"
vim.opt_local.errorformat = [[%#%f(%l\,%c): %m]]

require("formatting").cleanup_and_format_on_save("csharp-format", { async = false })
