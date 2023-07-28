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
local package_path_str = "/home/aqez/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/aqez/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/aqez/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/aqez/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/aqez/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  ["ChatGPT.nvim"] = {
    config = { "\27LJ\2\nÉ\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\23openai_edit_params\1\0\4\nmodel\26code-davinci-edit-001\6n\3\1\ntop_p\3\1\16temperature\4³æÌ™\3³æÌþ\3\18openai_params\1\0\a\nmodel\22gpt-3.5-turbo-16k\6n\3\1\ntop_p\3\1\16temperature\3\0\15max_tokens\3¬\2\21presence_penalty\3\0\22frequency_penalty\3\0\1\0\1\16api_key_cmd(cat /home/aqez/.config/openai.token\nsetup\fchatgpt\frequire\0" },
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/ChatGPT.nvim",
    url = "https://github.com/jackMort/ChatGPT.nvim"
  },
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
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
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
    config = { "\27LJ\2\n}\0\1\5\0\5\0\f9\1\0\0009\1\1\1\15\0\1\0X\2\a€6\1\2\0'\3\3\0B\1\2\0029\1\4\1\18\3\0\0004\4\0\0B\1\3\1K\0\1\0\nsetup\18lsp-overloads\frequire\26signatureHelpProvider\24server_capabilitiesU\1\1\5\0\6\0\n6\1\0\0'\3\1\0B\1\2\0028\1\0\0019\1\2\0015\3\4\0003\4\3\0=\4\5\3B\1\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\14lspconfig\frequirez\0\1\5\0\5\0\v9\1\0\0+\2\1\0=\2\1\0016\1\2\0'\3\3\0B\1\2\0029\1\4\1\18\3\0\0004\4\0\0B\1\3\1K\0\1\0\nsetup\18lsp-overloads\frequire\27semanticTokensProvider\24server_capabilities_\1\0\4\0\a\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\5\0003\3\4\0=\3\6\2B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\14omnisharp\14lspconfig\frequireC\0\1\5\0\3\0\b6\1\0\0'\3\1\0B\1\2\0029\1\2\1\18\3\0\0004\4\0\0B\1\3\1K\0\1\0\nsetup\18lsp-overloads\frequire®\1\1\0\a\0\15\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\v\0005\3\t\0005\4\a\0005\5\5\0005\6\4\0=\6\6\5=\5\b\4=\4\n\3=\3\f\0023\3\r\0=\3\14\2B\0\2\1K\0\1\0\14on_attach\0\rsettings\1\0\0\bLua\1\0\0\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\nsetup\vlua_ls\14lspconfig\frequireÌ\1\1\0\4\0\f\0\0246\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\4\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\5\0005\2\b\0003\3\6\0>\3\1\0023\3\a\0=\3\t\0023\3\n\0=\3\v\2B\0\2\1K\0\1\0\vlua_ls\0\14omnisharp\1\0\0\0\0\19setup_handlers\1\0\1\27automatic_installation\2\20mason-lspconfig\nsetup\nmason\frequire\0" },
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
    config = { "\27LJ\2\n{\0\0\3\0\a\0\0146\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0B\0\1\1K\0\1\0\bset\tnord\frequire\17nord_borders\28nord_disable_background\6g\bvim\0" },
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "https://github.com/shaunsingh/nord.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\21select_next_item\fvisibleF\0\0\2\1\2\0\t-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\3€-\0\0\0009\0\1\0B\0\1\1K\0\1\0\0À\21select_prev_item\fvisible·\3\1\0\n\0\29\00066\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0039\4\b\0009\4\t\4=\4\n\0035\4\14\0009\5\v\0009\a\v\0009\a\f\a)\tüÿB\a\2\0025\b\r\0B\5\3\2=\5\15\0049\5\v\0009\a\v\0009\a\f\a)\t\4\0B\a\2\0025\b\16\0B\5\3\2=\5\17\0049\5\v\0003\a\18\0B\5\2\2=\5\19\0049\5\v\0003\a\20\0B\5\2\2=\5\21\0049\5\v\0009\5\22\0055\a\23\0B\5\2\2=\5\24\4=\4\v\0034\4\4\0005\5\25\0>\5\1\0045\5\26\0>\5\2\0045\5\27\0>\5\3\4=\4\28\3B\1\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\t<CR>\1\0\1\vselect\2\fconfirm\f<S-Tab>\0\n<Tab>\0\n<C-k>\1\3\0\0\6i\6c\n<C-j>\1\0\0\1\3\0\0\6i\6c\16scroll_docs\fmapping\14preselect\tNone\18PreselectMode\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\nð\2\0\0\4\0\v\0\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0005\3\5\0=\3\6\2=\2\3\0019\1\a\0004\2\3\0005\3\t\0>\3\1\0025\3\n\0>\3\2\2=\2\b\1K\0\1\0\1\0\4\tname\19Launch program\ttype\fcoreclr\frequest\vlaunch\fprogram\24${command:pickFile}\1\0\4\tname\29Attach to dotnet process\ttype\fcoreclr\frequest\vattach\14processId\27${command:pickProcess}\acs\19configurations\targs\1\2\0\0\25--interpreter=vscode\1\0\2\ttype\15executable\fcommand\24/usr/bin/netcoredbg\fcoreclr\radapters\bdap\frequire\0" },
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
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n¼\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3B\1\2\1K\0\1\0\frainbow\1\0\1\venable\2\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\2\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/aqez/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
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
    config = { "\27LJ\2\n;\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\14expr,list\20vimwiki_folding\6g\bvim\0" },
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
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ndapui\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n}\0\1\5\0\5\0\f9\1\0\0009\1\1\1\15\0\1\0X\2\a€6\1\2\0'\3\3\0B\1\2\0029\1\4\1\18\3\0\0004\4\0\0B\1\3\1K\0\1\0\nsetup\18lsp-overloads\frequire\26signatureHelpProvider\24server_capabilitiesU\1\1\5\0\6\0\n6\1\0\0'\3\1\0B\1\2\0028\1\0\0019\1\2\0015\3\4\0003\4\3\0=\4\5\3B\1\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\14lspconfig\frequirez\0\1\5\0\5\0\v9\1\0\0+\2\1\0=\2\1\0016\1\2\0'\3\3\0B\1\2\0029\1\4\1\18\3\0\0004\4\0\0B\1\3\1K\0\1\0\nsetup\18lsp-overloads\frequire\27semanticTokensProvider\24server_capabilities_\1\0\4\0\a\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\5\0003\3\4\0=\3\6\2B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\14omnisharp\14lspconfig\frequireC\0\1\5\0\3\0\b6\1\0\0'\3\1\0B\1\2\0029\1\2\1\18\3\0\0004\4\0\0B\1\3\1K\0\1\0\nsetup\18lsp-overloads\frequire®\1\1\0\a\0\15\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\v\0005\3\t\0005\4\a\0005\5\5\0005\6\4\0=\6\6\5=\5\b\4=\4\n\3=\3\f\0023\3\r\0=\3\14\2B\0\2\1K\0\1\0\14on_attach\0\rsettings\1\0\0\bLua\1\0\0\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\nsetup\vlua_ls\14lspconfig\frequireÌ\1\1\0\4\0\f\0\0246\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\4\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\5\0005\2\b\0003\3\6\0>\3\1\0023\3\a\0=\3\t\0023\3\n\0=\3\v\2B\0\2\1K\0\1\0\vlua_ls\0\14omnisharp\1\0\0\0\0\19setup_handlers\1\0\1\27automatic_installation\2\20mason-lspconfig\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nµ\1\0\0\4\0\a\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0015\3\4\0B\1\2\0016\1\0\0'\3\5\0B\1\2\0029\1\6\1B\1\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\1\0\2\17updateevents\29TextChanged,TextChangedI\fhistory\2\15set_config\vconfig\fluasnip\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n¼\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3B\1\2\1K\0\1\0\frainbow\1\0\1\venable\2\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\2\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: onehalf
time([[Config for onehalf]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "onehalf")
time([[Config for onehalf]], false)
-- Config for: nord.nvim
time([[Config for nord.nvim]], true)
try_loadstring("\27LJ\2\n{\0\0\3\0\a\0\0146\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0B\0\1\1K\0\1\0\bset\tnord\frequire\17nord_borders\28nord_disable_background\6g\bvim\0", "config", "nord.nvim")
time([[Config for nord.nvim]], false)
-- Config for: vimwiki
time([[Config for vimwiki]], true)
try_loadstring("\27LJ\2\n;\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\14expr,list\20vimwiki_folding\6g\bvim\0", "config", "vimwiki")
time([[Config for vimwiki]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\21select_next_item\fvisibleF\0\0\2\1\2\0\t-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\3€-\0\0\0009\0\1\0B\0\1\1K\0\1\0\0À\21select_prev_item\fvisible·\3\1\0\n\0\29\00066\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0039\4\b\0009\4\t\4=\4\n\0035\4\14\0009\5\v\0009\a\v\0009\a\f\a)\tüÿB\a\2\0025\b\r\0B\5\3\2=\5\15\0049\5\v\0009\a\v\0009\a\f\a)\t\4\0B\a\2\0025\b\16\0B\5\3\2=\5\17\0049\5\v\0003\a\18\0B\5\2\2=\5\19\0049\5\v\0003\a\20\0B\5\2\2=\5\21\0049\5\v\0009\5\22\0055\a\23\0B\5\2\2=\5\24\4=\4\v\0034\4\4\0005\5\25\0>\5\1\0045\5\26\0>\5\2\0045\5\27\0>\5\3\4=\4\28\3B\1\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\t<CR>\1\0\1\vselect\2\fconfirm\f<S-Tab>\0\n<Tab>\0\n<C-k>\1\3\0\0\6i\6c\n<C-j>\1\0\0\1\3\0\0\6i\6c\16scroll_docs\fmapping\14preselect\tNone\18PreselectMode\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: ChatGPT.nvim
time([[Config for ChatGPT.nvim]], true)
try_loadstring("\27LJ\2\nÉ\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\23openai_edit_params\1\0\4\nmodel\26code-davinci-edit-001\6n\3\1\ntop_p\3\1\16temperature\4³æÌ™\3³æÌþ\3\18openai_params\1\0\a\nmodel\22gpt-3.5-turbo-16k\6n\3\1\ntop_p\3\1\16temperature\3\0\15max_tokens\3¬\2\21presence_penalty\3\0\22frequency_penalty\3\0\1\0\1\16api_key_cmd(cat /home/aqez/.config/openai.token\nsetup\fchatgpt\frequire\0", "config", "ChatGPT.nvim")
time([[Config for ChatGPT.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25add_default_mappings\tleap\frequire\0", "config", "leap.nvim")
time([[Config for leap.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nØ\4\0\0\14\0\"\0;6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\25\0006\4\3\0009\4\4\4'\6\5\0006\a\0\0'\t\6\0B\a\2\0029\a\a\aB\a\1\0025\b\n\0006\t\0\0'\v\b\0B\t\2\0029\t\t\t=\t\v\b5\t\18\0005\n\14\0006\v\0\0'\r\f\0B\v\2\0029\v\r\v=\v\15\n6\v\0\0'\r\f\0B\v\2\0029\v\16\v=\v\17\n=\n\19\t5\n\21\0006\v\0\0'\r\f\0B\v\2\0029\v\20\v=\v\22\n=\n\23\t=\t\24\bB\4\4\2=\4\26\0035\4\28\0005\5\27\0=\5\29\0044\5\0\0=\5\30\4=\4\31\3B\1\2\0019\1 \0'\3\29\0B\1\2\0019\1 \0'\3\30\0B\1\2\0019\1 \0'\3!\0B\1\2\1K\0\1\0\15smart_open\19load_extension\15extensions\14ui-select\15fzy_native\1\0\0\1\0\2\28override_generic_sorter\1\25override_file_sorter\2\rdefaults\1\0\0\rmappings\6n\n<C-d>\1\0\0\18delete_buffer\6i\1\0\0\n<C-j>\24move_selection_next\n<C-k>\1\0\0\28move_selection_previous\22telescope.actions\16file_sorter\1\0\0\19get_fzy_sorter\22telescope.sorters\fget_ivy\21telescope.themes\nforce\15tbl_extend\bvim\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\nð\2\0\0\4\0\v\0\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0005\3\5\0=\3\6\2=\2\3\0019\1\a\0004\2\3\0005\3\t\0>\3\1\0025\3\n\0>\3\2\2=\2\b\1K\0\1\0\1\0\4\tname\19Launch program\ttype\fcoreclr\frequest\vlaunch\fprogram\24${command:pickFile}\1\0\4\tname\29Attach to dotnet process\ttype\fcoreclr\frequest\vattach\14processId\27${command:pickProcess}\acs\19configurations\targs\1\2\0\0\25--interpreter=vscode\1\0\2\ttype\15executable\fcommand\24/usr/bin/netcoredbg\fcoreclr\radapters\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: neodev.nvim
time([[Config for neodev.nvim]], true)
try_loadstring("\27LJ\2\nu\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\flibrary\1\0\0\fplugins\1\0\1\ntypes\2\1\2\0\0\16nvim-dap-ui\nsetup\vneodev\frequire\0", "config", "neodev.nvim")
time([[Config for neodev.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)

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
