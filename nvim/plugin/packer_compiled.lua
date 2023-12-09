-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/aqez/.cache/nvim/packer_hererocks/2.1.1700008891/share/lua/5.1/?.lua;/home/aqez/.cache/nvim/packer_hererocks/2.1.1700008891/share/lua/5.1/?/init.lua;/home/aqez/.cache/nvim/packer_hererocks/2.1.1700008891/lib/luarocks/rocks-5.1/?.lua;/home/aqez/.cache/nvim/packer_hererocks/2.1.1700008891/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/aqez/.cache/nvim/packer_hererocks/2.1.1700008891/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    config = { "\27LJ\2\nµ\1\0\0\4\0\a\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0015\3\4\0B\1\2\0016\1\0\0'\3\5\0B\1\2\0029\1\6\1B\1\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\1\0\2\17updateevents\29TextChanged,TextChangedI\fhistory\2\15set_config\vconfig\fluasnip\frequire\0" },
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  catppuccin = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["fzf-lua"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/fzf-lua",
    url = "https://github.com/ibhagwan/fzf-lua"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["leap.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25add_default_mappings\tleap\frequire\0" },
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lsp-overloads.nvim"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/lsp-overloads.nvim",
    url = "https://github.com/Issafalcon/lsp-overloads.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n}\0\1\5\0\5\0\f9\1\0\0009\1\1\1\15\0\1\0X\2\a€6\1\2\0'\3\3\0B\1\2\0029\1\4\1\18\3\0\0004\4\0\0B\1\3\1K\0\1\0\nsetup\18lsp-overloads\frequire\26signatureHelpProvider\24server_capabilitiesU\1\1\5\0\6\0\n6\1\0\0'\3\1\0B\1\2\0028\1\0\0019\1\2\0015\3\4\0003\4\3\0=\4\5\3B\1\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\14lspconfig\frequireC\0\1\5\0\3\0\b6\1\0\0'\3\1\0B\1\2\0029\1\2\1\18\3\0\0004\4\0\0B\1\3\1K\0\1\0\nsetup\18lsp-overloads\frequire_\1\0\4\0\a\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\5\0003\3\4\0=\3\6\2B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\14omnisharp\14lspconfig\frequireC\0\1\5\0\3\0\b6\1\0\0'\3\1\0B\1\2\0029\1\2\1\18\3\0\0004\4\0\0B\1\3\1K\0\1\0\nsetup\18lsp-overloads\frequire®\1\1\0\a\0\15\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\v\0005\3\t\0005\4\a\0005\5\5\0005\6\4\0=\6\6\5=\5\b\4=\4\n\3=\3\f\0023\3\r\0=\3\14\2B\0\2\1K\0\1\0\14on_attach\0\rsettings\1\0\0\bLua\1\0\0\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\nsetup\vlua_ls\14lspconfig\frequireÌ\1\1\0\4\0\f\0\0246\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\4\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\5\0005\2\b\0003\3\6\0>\3\1\0023\3\a\0=\3\t\0023\3\n\0=\3\v\2B\0\2\1K\0\1\0\vlua_ls\0\14omnisharp\1\0\0\0\0\19setup_handlers\1\0\1\27automatic_installation\2\20mason-lspconfig\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neodev.nvim"] = {
    config = { "\27LJ\2\nu\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\flibrary\1\0\0\fplugins\1\0\1\ntypes\2\1\2\0\0\16nvim-dap-ui\nsetup\vneodev\frequire\0" },
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  neogit = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["nord.nvim"] = {
    config = { "\27LJ\2\nS\0\0\3\0\6\0\n6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\bset\tnord\frequire\17nord_borders\6g\bvim\0" },
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "https://github.com/shaunsingh/nord.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\21select_next_item\fvisibleF\0\0\2\1\2\0\t-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\3€-\0\0\0009\0\1\0B\0\1\1K\0\1\0\0À\21select_prev_item\fvisible·\3\1\0\n\0\29\00066\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0039\4\b\0009\4\t\4=\4\n\0035\4\14\0009\5\v\0009\a\v\0009\a\f\a)\tüÿB\a\2\0025\b\r\0B\5\3\2=\5\15\0049\5\v\0009\a\v\0009\a\f\a)\t\4\0B\a\2\0025\b\16\0B\5\3\2=\5\17\0049\5\v\0003\a\18\0B\5\2\2=\5\19\0049\5\v\0003\a\20\0B\5\2\2=\5\21\0049\5\v\0009\5\22\0055\a\23\0B\5\2\2=\5\24\4=\4\v\0034\4\4\0005\5\25\0>\5\1\0045\5\26\0>\5\2\0045\5\27\0>\5\3\4=\4\28\3B\1\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\t<CR>\1\0\1\vselect\1\fconfirm\f<S-Tab>\0\n<Tab>\0\n<C-k>\1\3\0\0\6i\6c\n<C-j>\1\0\0\1\3\0\0\6i\6c\16scroll_docs\fmapping\14preselect\tNone\18PreselectMode\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\nð\2\0\0\4\0\v\0\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0005\3\5\0=\3\6\2=\2\3\0019\1\a\0004\2\3\0005\3\t\0>\3\1\0025\3\n\0>\3\2\2=\2\b\1K\0\1\0\1\0\4\tname\19Launch program\frequest\vlaunch\fprogram\24${command:pickFile}\ttype\fcoreclr\1\0\4\tname\29Attach to dotnet process\frequest\vattach\14processId\27${command:pickProcess}\ttype\fcoreclr\acs\19configurations\targs\1\2\0\0\25--interpreter=vscode\1\0\2\fcommand\24/usr/bin/netcoredbg\ttype\15executable\fcoreclr\radapters\bdap\frequire\0" },
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ndapui\frequire\0" },
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nÊ\2\0\0\v\2\r\00166\0\0\0009\0\1\0009\0\2\0\18\2\0\0009\0\3\0B\0\2\0026\1\0\0009\1\1\0019\1\4\1\18\3\1\0009\1\3\1B\1\2\0026\2\0\0009\2\1\0029\2\5\2\18\4\2\0009\2\3\2B\2\2\2!\1\2\1-\2\0\0\"\2\2\0-\3\1\0\"\3\3\0016\4\6\0009\4\a\4\18\6\2\0B\4\2\0026\5\6\0009\5\a\5\18\a\3\0B\5\2\2!\6\2\0\25\6\0\0066\a\0\0009\a\1\a9\a\4\a\18\t\a\0009\a\3\aB\a\2\2!\a\3\a\25\a\0\a6\b\0\0009\b\1\b9\b\5\b\18\n\b\0009\b\3\bB\b\2\2!\a\b\a5\b\b\0=\a\t\b=\6\n\b=\4\v\b=\5\f\bL\b\2\0\2À\1À\vheight\nwidth\bcol\brow\1\0\2\vborder\frounded\rrelative\veditor\nfloor\tmath\14cmdheight\nlines\bget\fcolumns\bopt\bvim\4T\0\0\5\1\6\0\v6\0\0\0009\0\1\0006\2\2\0009\2\3\0029\2\4\2\18\4\2\0009\2\5\2B\2\2\2-\3\0\0\"\2\3\2D\0\2\0\2À\bget\fcolumns\bopt\bvim\nfloor\tmathý\1\1\0\t\0\f\2\0186\0\0\0'\2\1\0B\0\2\2*\1\0\0*\2\1\0009\3\2\0005\5\3\0005\6\4\0005\a\5\0003\b\6\0=\b\a\a=\a\b\0063\a\t\0=\a\n\6=\6\v\5B\3\2\0012\0\0€K\0\1\0\tview\nwidth\0\nfloat\20open_win_config\0\1\0\1\venable\2\1\0\1\19relativenumber\2\1\0\4\23sync_root_with_cwd\2\20respect_buf_cwd\2\17hijack_netrw\2\18disable_netrw\2\nsetup\14nvim-tree\frequireµæÌ™\19™³¦ÿ\3\1€€€ÿ\3\0" },
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-textobjects" },
    config = { "\27LJ\2\n¼\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3B\1\2\1K\0\1\0\frainbow\1\0\1\venable\2\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\2\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    config = { "\27LJ\2\nò\6\0\0\6\0\30\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\28\0005\3\6\0005\4\3\0005\5\4\0=\5\5\4=\4\a\0035\4\b\0005\5\t\0=\5\n\0045\5\v\0=\5\f\4=\4\r\0035\4\14\0005\5\15\0=\5\16\0045\5\17\0=\5\18\0045\5\19\0=\5\20\0045\5\21\0=\5\22\0045\5\23\0=\5\24\0045\5\25\0=\5\26\4=\4\27\3=\3\29\2B\0\2\1K\0\1\0\16textobjects\1\0\0\tmove\18goto_previous\1\0\3\a[a\21@parameter.inner\a[d\23@conditional.outer\a[A\21@parameter.outer\14goto_next\1\0\3\a]A\21@parameter.outer\a]a\21@parameter.inner\a]d\23@conditional.outer\22goto_previous_end\1\0\3\a[]\17@class.outer\a[M\20@function.outer\a[F\20@function.inner\24goto_previous_start\1\0\3\a[[\17@class.outer\a[m\20@function.outer\a[f\20@function.inner\18goto_next_end\1\0\3\a][\17@class.outer\a]M\20@function.outer\a]F\20@function.inner\20goto_next_start\1\0\3\a]]\17@class.outer\a]m\20@function.outer\a]f\20@function.inner\1\0\2\14set_jumps\2\venable\2\tswap\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\1\venable\2\vselect\1\0\0\fkeymaps\1\0\4\aif\20@function.inner\aac\17@class.outer\aaf\20@function.outer\aic\17@class.inner\1\0\2\venable\2\14lookahead\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  onehalf = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/onehalf/vim",
    url = "https://github.com/sonph/onehalf"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/rust.vim",
    url = "https://github.com/rust-lang/rust.vim"
  },
  ["smart-open.nvim"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/smart-open.nvim",
    url = "https://github.com/danielfalk/smart-open.nvim"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/sqlite.lua",
    url = "https://github.com/kkharji/sqlite.lua"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nØ\4\0\0\14\0\"\0;6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\25\0006\4\3\0009\4\4\4'\6\5\0006\a\0\0'\t\6\0B\a\2\0029\a\a\aB\a\1\0025\b\n\0006\t\0\0'\v\b\0B\t\2\0029\t\t\t=\t\v\b5\t\18\0005\n\14\0006\v\0\0'\r\f\0B\v\2\0029\v\r\v=\v\15\n6\v\0\0'\r\f\0B\v\2\0029\v\16\v=\v\17\n=\n\19\t5\n\21\0006\v\0\0'\r\f\0B\v\2\0029\v\20\v=\v\22\n=\n\23\t=\t\24\bB\4\4\2=\4\26\0035\4\28\0005\5\27\0=\5\29\0044\5\0\0=\5\30\4=\4\31\3B\1\2\0019\1 \0'\3\29\0B\1\2\0019\1 \0'\3\30\0B\1\2\0019\1 \0'\3!\0B\1\2\1K\0\1\0\15smart_open\19load_extension\15extensions\14ui-select\15fzy_native\1\0\0\1\0\2\28override_generic_sorter\1\25override_file_sorter\2\rdefaults\1\0\0\rmappings\6n\n<C-d>\1\0\0\18delete_buffer\6i\1\0\0\n<C-j>\24move_selection_next\n<C-k>\1\0\0\28move_selection_previous\22telescope.actions\16file_sorter\1\0\0\19get_fzy_sorter\22telescope.sorters\fget_ivy\21telescope.themes\nforce\15tbl_extend\bvim\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-colors-off"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/vim-colors-off",
    url = "https://github.com/pbrisbin/vim-colors-off"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  vimwiki = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/vimwiki",
    url = "https://github.com/vimwiki/vimwiki"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["yuck.vim"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/yuck.vim",
    url = "https://github.com/elkowar/yuck.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Runtimepath customization
time([[Runtimepath customization]], true)
vim.o.runtimepath = vim.o.runtimepath .. ",/home/aqez/.local/share/nvim/site/pack/packer/start/onehalf/vim"
time([[Runtimepath customization]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nØ\4\0\0\14\0\"\0;6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\25\0006\4\3\0009\4\4\4'\6\5\0006\a\0\0'\t\6\0B\a\2\0029\a\a\aB\a\1\0025\b\n\0006\t\0\0'\v\b\0B\t\2\0029\t\t\t=\t\v\b5\t\18\0005\n\14\0006\v\0\0'\r\f\0B\v\2\0029\v\r\v=\v\15\n6\v\0\0'\r\f\0B\v\2\0029\v\16\v=\v\17\n=\n\19\t5\n\21\0006\v\0\0'\r\f\0B\v\2\0029\v\20\v=\v\22\n=\n\23\t=\t\24\bB\4\4\2=\4\26\0035\4\28\0005\5\27\0=\5\29\0044\5\0\0=\5\30\4=\4\31\3B\1\2\0019\1 \0'\3\29\0B\1\2\0019\1 \0'\3\30\0B\1\2\0019\1 \0'\3!\0B\1\2\1K\0\1\0\15smart_open\19load_extension\15extensions\14ui-select\15fzy_native\1\0\0\1\0\2\28override_generic_sorter\1\25override_file_sorter\2\rdefaults\1\0\0\rmappings\6n\n<C-d>\1\0\0\18delete_buffer\6i\1\0\0\n<C-j>\24move_selection_next\n<C-k>\1\0\0\28move_selection_previous\22telescope.actions\16file_sorter\1\0\0\19get_fzy_sorter\22telescope.sorters\fget_ivy\21telescope.themes\nforce\15tbl_extend\bvim\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n}\0\1\5\0\5\0\f9\1\0\0009\1\1\1\15\0\1\0X\2\a€6\1\2\0'\3\3\0B\1\2\0029\1\4\1\18\3\0\0004\4\0\0B\1\3\1K\0\1\0\nsetup\18lsp-overloads\frequire\26signatureHelpProvider\24server_capabilitiesU\1\1\5\0\6\0\n6\1\0\0'\3\1\0B\1\2\0028\1\0\0019\1\2\0015\3\4\0003\4\3\0=\4\5\3B\1\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\14lspconfig\frequireC\0\1\5\0\3\0\b6\1\0\0'\3\1\0B\1\2\0029\1\2\1\18\3\0\0004\4\0\0B\1\3\1K\0\1\0\nsetup\18lsp-overloads\frequire_\1\0\4\0\a\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\5\0003\3\4\0=\3\6\2B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\14omnisharp\14lspconfig\frequireC\0\1\5\0\3\0\b6\1\0\0'\3\1\0B\1\2\0029\1\2\1\18\3\0\0004\4\0\0B\1\3\1K\0\1\0\nsetup\18lsp-overloads\frequire®\1\1\0\a\0\15\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\v\0005\3\t\0005\4\a\0005\5\5\0005\6\4\0=\6\6\5=\5\b\4=\4\n\3=\3\f\0023\3\r\0=\3\14\2B\0\2\1K\0\1\0\14on_attach\0\rsettings\1\0\0\bLua\1\0\0\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\nsetup\vlua_ls\14lspconfig\frequireÌ\1\1\0\4\0\f\0\0246\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\4\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\5\0005\2\b\0003\3\6\0>\3\1\0023\3\a\0=\3\t\0023\3\n\0=\3\v\2B\0\2\1K\0\1\0\vlua_ls\0\14omnisharp\1\0\0\0\0\19setup_handlers\1\0\1\27automatic_installation\2\20mason-lspconfig\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: nord.nvim
time([[Config for nord.nvim]], true)
try_loadstring("\27LJ\2\nS\0\0\3\0\6\0\n6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\bset\tnord\frequire\17nord_borders\6g\bvim\0", "config", "nord.nvim")
time([[Config for nord.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ndapui\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nÊ\2\0\0\v\2\r\00166\0\0\0009\0\1\0009\0\2\0\18\2\0\0009\0\3\0B\0\2\0026\1\0\0009\1\1\0019\1\4\1\18\3\1\0009\1\3\1B\1\2\0026\2\0\0009\2\1\0029\2\5\2\18\4\2\0009\2\3\2B\2\2\2!\1\2\1-\2\0\0\"\2\2\0-\3\1\0\"\3\3\0016\4\6\0009\4\a\4\18\6\2\0B\4\2\0026\5\6\0009\5\a\5\18\a\3\0B\5\2\2!\6\2\0\25\6\0\0066\a\0\0009\a\1\a9\a\4\a\18\t\a\0009\a\3\aB\a\2\2!\a\3\a\25\a\0\a6\b\0\0009\b\1\b9\b\5\b\18\n\b\0009\b\3\bB\b\2\2!\a\b\a5\b\b\0=\a\t\b=\6\n\b=\4\v\b=\5\f\bL\b\2\0\2À\1À\vheight\nwidth\bcol\brow\1\0\2\vborder\frounded\rrelative\veditor\nfloor\tmath\14cmdheight\nlines\bget\fcolumns\bopt\bvim\4T\0\0\5\1\6\0\v6\0\0\0009\0\1\0006\2\2\0009\2\3\0029\2\4\2\18\4\2\0009\2\5\2B\2\2\2-\3\0\0\"\2\3\2D\0\2\0\2À\bget\fcolumns\bopt\bvim\nfloor\tmathý\1\1\0\t\0\f\2\0186\0\0\0'\2\1\0B\0\2\2*\1\0\0*\2\1\0009\3\2\0005\5\3\0005\6\4\0005\a\5\0003\b\6\0=\b\a\a=\a\b\0063\a\t\0=\a\n\6=\6\v\5B\3\2\0012\0\0€K\0\1\0\tview\nwidth\0\nfloat\20open_win_config\0\1\0\1\venable\2\1\0\1\19relativenumber\2\1\0\4\23sync_root_with_cwd\2\20respect_buf_cwd\2\17hijack_netrw\2\18disable_netrw\2\nsetup\14nvim-tree\frequireµæÌ™\19™³¦ÿ\3\1€€€ÿ\3\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: onehalf
time([[Config for onehalf]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "onehalf")
time([[Config for onehalf]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\21select_next_item\fvisibleF\0\0\2\1\2\0\t-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\3€-\0\0\0009\0\1\0B\0\1\1K\0\1\0\0À\21select_prev_item\fvisible·\3\1\0\n\0\29\00066\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0039\4\b\0009\4\t\4=\4\n\0035\4\14\0009\5\v\0009\a\v\0009\a\f\a)\tüÿB\a\2\0025\b\r\0B\5\3\2=\5\15\0049\5\v\0009\a\v\0009\a\f\a)\t\4\0B\a\2\0025\b\16\0B\5\3\2=\5\17\0049\5\v\0003\a\18\0B\5\2\2=\5\19\0049\5\v\0003\a\20\0B\5\2\2=\5\21\0049\5\v\0009\5\22\0055\a\23\0B\5\2\2=\5\24\4=\4\v\0034\4\4\0005\5\25\0>\5\1\0045\5\26\0>\5\2\0045\5\27\0>\5\3\4=\4\28\3B\1\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\t<CR>\1\0\1\vselect\1\fconfirm\f<S-Tab>\0\n<Tab>\0\n<C-k>\1\3\0\0\6i\6c\n<C-j>\1\0\0\1\3\0\0\6i\6c\16scroll_docs\fmapping\14preselect\tNone\18PreselectMode\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n¼\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3B\1\2\1K\0\1\0\frainbow\1\0\1\venable\2\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\2\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nµ\1\0\0\4\0\a\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0015\3\4\0B\1\2\0016\1\0\0'\3\5\0B\1\2\0029\1\6\1B\1\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\1\0\2\17updateevents\29TextChanged,TextChangedI\fhistory\2\15set_config\vconfig\fluasnip\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25add_default_mappings\tleap\frequire\0", "config", "leap.nvim")
time([[Config for leap.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\nð\2\0\0\4\0\v\0\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0005\3\5\0=\3\6\2=\2\3\0019\1\a\0004\2\3\0005\3\t\0>\3\1\0025\3\n\0>\3\2\2=\2\b\1K\0\1\0\1\0\4\tname\19Launch program\frequest\vlaunch\fprogram\24${command:pickFile}\ttype\fcoreclr\1\0\4\tname\29Attach to dotnet process\frequest\vattach\14processId\27${command:pickProcess}\ttype\fcoreclr\acs\19configurations\targs\1\2\0\0\25--interpreter=vscode\1\0\2\fcommand\24/usr/bin/netcoredbg\ttype\15executable\fcoreclr\radapters\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: neodev.nvim
time([[Config for neodev.nvim]], true)
try_loadstring("\27LJ\2\nu\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\flibrary\1\0\0\fplugins\1\0\1\ntypes\2\1\2\0\0\16nvim-dap-ui\nsetup\vneodev\frequire\0", "config", "neodev.nvim")
time([[Config for neodev.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter-textobjects ]]

-- Config for: nvim-treesitter-textobjects
try_loadstring("\27LJ\2\nò\6\0\0\6\0\30\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\28\0005\3\6\0005\4\3\0005\5\4\0=\5\5\4=\4\a\0035\4\b\0005\5\t\0=\5\n\0045\5\v\0=\5\f\4=\4\r\0035\4\14\0005\5\15\0=\5\16\0045\5\17\0=\5\18\0045\5\19\0=\5\20\0045\5\21\0=\5\22\0045\5\23\0=\5\24\0045\5\25\0=\5\26\4=\4\27\3=\3\29\2B\0\2\1K\0\1\0\16textobjects\1\0\0\tmove\18goto_previous\1\0\3\a[a\21@parameter.inner\a[d\23@conditional.outer\a[A\21@parameter.outer\14goto_next\1\0\3\a]A\21@parameter.outer\a]a\21@parameter.inner\a]d\23@conditional.outer\22goto_previous_end\1\0\3\a[]\17@class.outer\a[M\20@function.outer\a[F\20@function.inner\24goto_previous_start\1\0\3\a[[\17@class.outer\a[m\20@function.outer\a[f\20@function.inner\18goto_next_end\1\0\3\a][\17@class.outer\a]M\20@function.outer\a]F\20@function.inner\20goto_next_start\1\0\3\a]]\17@class.outer\a]m\20@function.outer\a]f\20@function.inner\1\0\2\14set_jumps\2\venable\2\tswap\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\1\venable\2\vselect\1\0\0\fkeymaps\1\0\4\aif\20@function.inner\aac\17@class.outer\aaf\20@function.outer\aic\17@class.inner\1\0\2\venable\2\14lookahead\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter-textobjects")

time([[Sequenced loading]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
