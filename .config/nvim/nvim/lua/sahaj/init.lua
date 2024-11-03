require("sahaj.remap")

vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Lazy initialization
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "sahaj.plugins" }, }, {
  checker = { enabled = true, notify = false, },
  change_detection = { notify = false, },
})
codeiumString = " {.}%3{codeium#GetStatusString()}"

-- plugs = require("sahaj.plugins")
-- function DevMode()
--     require("lazy").setup({
--         { import = "sahaj.plugins" }, }, {
--         checker = { enabled = true, notify = false, },
--         change_detection = { notify = false, },
--     })
--     codeiumString = " {.}%3{codeium#GetStatusString()}"
-- end

file = vim.fn.expand('%')

-- If text type file, use Light plugins
-- if (not file:find(".", 1, true) or file:find(".txt", 1, true) or file:find(".md", 1, true)) and file ~= "" then
--     require("lazy").setup({
--         { import = "sahaj.pluginsLight" }, }, {
--         checker = { enabled = true, notify = false, },
--         change_detection = { notify = false, },
--     })
-- else
--     DevMode()
-- end

-- function DevMode()
--     require("lazy").load({    {
--         "ThePrimeagen/vim-apm",
--         config = function()
--             local apm = require("vim-apm")
--
--             apm:setup({})
--             vim.keymap.set("n", "<leader>apm", function() apm:toggle_monitor() end)
--         end
--
--     },
--     { 'declancm/cinnamon.nvim',   opts = { default_delay = 4 } },
-- })
--     codeiumString = " {.}%3{codeium#GetStatusString()}"
-- end
--
-- file = vim.fn.expand('%')
--
-- -- If not text type file, load all plugins
-- if not ((not file:find(".", 1, true) or file:find(".txt", 1, true))) and file ~= "" then
--     DevMode()
-- end

-- vim.keymap.set("n", "<leader>D", ":lua DevMode()<CR>")

vim.cmd [[colorscheme catppuccin]]
vim.cmd [[hi LocalHighlight guibg=#2a2b3c guifg=none]]

-- vim.g.codeium_enabled = false
vim.opt.showmode = false
vim.opt.breakindent = true
-- vim.opt.signcolumn = 'yes'

-- Transparent 󰈸󰈸
function transparent()
  vim.cmd [[colorscheme catppuccin
    hi Normal guibg=none ctermbg=none
    hi NormalFloat guibg=none ctermbg=none
    hi LineNr guibg=none ctermbg=none
    hi Folded guibg=none ctermbg=none
    hi NonText guibg=none ctermbg=none
    hi SpecialKey guibg=none ctermbg=none
    hi VertSplit guibg=none ctermbg=none
    hi SignColumn guibg=none ctermbg=none
    hi EndOfBuffer guibg=none ctermbg=none
    hi CursorLine guibg=none
    hi StatusLine none
    hi NormalNC guibg=none ctermbg=none
    hi TelescopePreviewNormal none
    hi TelescopePreviewBorder none
    hi TelescopeResultNormal none
    hi TelescopeResultBorder none
    hi TelescopePromptNormal none
    hi TelescopePromptBorder none
    hi TelescopePromptPrefix none
    hi TelescopeSelection none
    hi DiagnosticVirtualTextWarn none
    hi DiagnosticVirtualTextError none
    hi DiagnosticVirtualTextInfo none
    hi DiagnosticVirtualTextHint none
    hi LocalHighlight guibg=none gui=underline
    " hi Constant guibg=none
    " hi WarningMsg guibg=none
    " hi Comment guibg=none
    " hi Title guibg=none
    " hi Question guibg=none

]]
end

transparent()

--Remove Transparency
function opaque()
  vim.cmd [[colorscheme catppuccin
    hi LocalHighlight guibg=#2a2b3c guifg=none
    " hi Normal guibg=#1e1e2e
    ]]
  --Telescope Colours
  local colors = require("catppuccin.palettes").get_palette()
  local TelescopeColor = {
    TelescopeMatching = { fg = colors.flamingo },
    TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },

    TelescopePromptPrefix = { bg = colors.surface0 },
    TelescopePromptNormal = { bg = colors.surface0 },
    TelescopeResultsNormal = { bg = colors.mantle },
    TelescopePreviewNormal = { bg = colors.mantle },
    TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
    TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
    TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
    TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
    TelescopeResultsTitle = { fg = colors.mantle },
    TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
  }

  for hl, col in pairs(TelescopeColor) do
    vim.api.nvim_set_hl(0, hl, col)
  end
end

vim.cmd [[let g:buftabline_show = 1]]

vim.opt.guicursor = {
  "n-v-c:block-Cursor",
  "i-ci-ve:ver25-Cursor",
  "r-cr:hor20-Cursor",
  "o:hor50-Cursor",
}

vim.opt.conceallevel = 1
vim.opt.magic = false

vim.opt.inccommand = 'split'

vim.opt.mouse = ''

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.smartindent = true

-- vim.opt.wrap = false
-- vim.opt.hlsearch = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 500

-- vim.opt.autoindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cursorline = true

vim.opt.clipboard:append("unnamedplus")
vim.opt.iskeyword:append("-")

vim.opt.foldmethod = "manual"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true

local cmp_enabled = true
vim.api.nvim_create_user_command("ToggleAutoComplete", function()
  if cmp_enabled then
    require("cmp").setup.buffer({ enabled = false })
    cmp_enabled = false
  else
    require("cmp").setup.buffer({ enabled = true })
    cmp_enabled = true
  end
end, {})

-- local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
-- vim.api.nvim_create_autocmd('TextYankPost', {
--     callback = function()
--         vim.highlight.on_yank()
--     end,
--     group = highlight_group,
--     pattern = '*',
-- })

vim.cmd [[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="TabLineSel", timeout=200})
augroup END
]]
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.jsx,*.tsx",
--   callback = function()
--     vim.cmd("TailwindSortSync")
--   end,
-- })

vim.o.statusline = " "
    .. "  "
    .. " %F"
    .. " %#StatusModified#"
    .. " %m"
    .. " %#StatusNorm#"
    .. "%="
    .. "%y"
    .. " %#StatusBuffer#"
    .. "  "
    .. "%n"
    .. "%#StatusLocation#"
    .. " %l,%c"
    .. " %#StatusPercent#"
    .. " %p%%  "
    .. codeiumString
