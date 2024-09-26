vim.g.mapleader = " "

local keymap = vim.keymap


-- keymap.set("n", "<leader>bt", ":let g:buftabline_show= !g:buftabline_show|call buftabline#update(0)<CR>",
--     { silent = true })
-- keymap.set("n", "<leader>bd", ":bdelete<CR>", { silent = true })
--
keymap.set('n', '<leader>w', ':silent! noautocmd w<CR>', { noremap = true, silent = true })

-- keymap.set("n", "<leader>1",
--     ":%y<CR>:!xdotool key alt+space; sleep 0.1; xdotool mousemove 1324 238 click 1; sleep 0.1; xdotool key ctrl+a; sleep 0.1; xdotool key ctrl+v; sleep 0.1<CR>")
-- keymap.set("n", "<leader>2",
--     ":%y<CR>:!xdotool key alt+space; sleep 0.1; xdotool mousemove 1324 238 click 1; sleep 0.1; xdotool key ctrl+a; sleep 0.1; xdotool key ctrl+v; sleep 0.1; xdotool key ctrl+apostrophe<CR>")
-- keymap.set("n", "<leader>3",
--     ":!xdotool mousemove 1324 238 click 1; sleep 0.1; xdotool key ctrl+a; sleep 0.1; xdotool key ctrl+c; sleep 0.1; xdotool key alt+space; sleep 0.1; xdotool key enter; sleep 0.1; xdotool key p<CR>")

keymap.set("n", "<leader>1",
  ":%y<CR>:!echo 'key alt+space'|dotoolc; sleep 0.1;echo 'mouseto 0.9 0.5'| dotoolc ;echo 'mouseto 0.9 0.28'| dotoolc; sleep 0.01; echo 'click left'|dotoolc ; sleep 0.01; echo 'key ctrl+a' | dotoolc; sleep 0.01; echo 'key ctrl+v' | dotoolc<CR>")
keymap.set("n", "<leader>2",
  ":%y<CR>:!echo 'key alt+space'|dotoolc; sleep 0.1;echo 'mouseto 0.9 0.5'| dotoolc ; echo 'mouseto 0.9 0.28'|dotoolc; sleep 0.01; echo 'click left'|dotoolc; sleep 0.01; echo 'key ctrl+a'|dotoolc; sleep 0.01; echo 'key ctrl+v'|dotoolc; sleep 0.01; echo 'key ctrl+apostrophe' | dotoolc<CR>")
keymap.set("n", "<leader>3",
  ":!echo 'key alt+space'|dotoolc; sleep 0.1;echo 'mouseto 0.9 0.5'| dotoolc ; echo 'mouseto 0.95 0.28'|dotoolc; sleep 0.01; echo 'click left'|dotoolc; sleep 0.01; echo 'key ctrl+a'|dotoolc; sleep 0.01; echo 'key ctrl+c'|dotoolc; sleep 0.01; echo 'key alt+space'|dotoolc; sleep 0.1;  echo 'key enter'|dotoolc; sleep 0.01; echo 'key P' | dotoolc<CR>")

keymap.set("n", "H", ":bprev<CR>", { silent = true })
keymap.set("n", "L", ":bnext<CR>", { silent = true })

-- keymap.set({ "n", "v" }, "<tab>", "%")

-- keymap.set("i", "<C-b>", "<esc>pi")

keymap.set("n", "Q", "@qj")
keymap.set("x", "Q", ":norm @q<CR>")

keymap.set("n", "<leader>s", ":w<CR>")

keymap.set("n", "<leader>co", ":CodeiumToggle<CR>")

keymap.set("n", "<leader>rs", ":so<CR>")

keymap.set("n", "<leader>p", '"0p')

keymap.set("n", "<leader>.", 'f<l')

-- keymap.set("n", "<leader>tt",
--     ":highlight Normal guibg=none<CR>:highlight NonText guibg=none<CR>:hi CursorLine guibg=none<CR>",
--     { desc = "Transparent mode" })
-- keymap.set("n", "<leader>tn", ":colorscheme catppuccin<CR>", { desc = "Normal mode (catppuccin)" })

keymap.set("n", "<esc>", ":noh<CR>", { silent = true })
-- keymap.set("n", "<leader>ch", ":set hlsearch<CR>", { silent = true })
-- keymap.set("n", "g<leader>", "", { silent = true })

keymap.set("n", "<leader>'", "vi\"")
keymap.set("v", "<leader>'", "<esc>f\";vi\"")

-- keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection down" })
-- keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection up" })

keymap.set("n", "J", "mzJ`z")
-- Quick search and replace
keymap.set("n", "<leader>n", "*''cgn")
keymap.set("v", "<leader>n", "\"hy/<C-r>h<CR>Ncgn")

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- keymap.set("n", "<leader>o", "o<ESC>")
-- keymap.set("n", "<leader>O", "o<ESC>")
-- keymap.set("i", "<C-o>", "<ESC>o")
keymap.set("n", "<C-o>", "<ESC>o<ESC>")

keymap.set("n", "<C-E>", "<C-O>", { noremap = true })

-- search and replace on recently c insert if forgot to search
keymap.set("n", "g.", '/\\V\\C<C-r>"<CR>cgn<C-a><Esc>')

-- keymap.set("n", "J", "5j")
-- keymap.set("n", "K", "5k", {buffer=true}) in init.lua

-- keymap.set("n", "<leader>t", ":tabnew<CR>")
-- keymap.set("n", "<leader>w", ":tabclose<CR>")

-- keymap.set("n", "<CR>", ":bnext<CR>")
-- keymap.set("n", "<leader><CR>", ":bprev<CR>")

-- keymap.set("x", "p", '"_dP')
keymap.set({ "n", "x" }, "<leader>d", '"_d')
keymap.set({ "n", "x" }, "c", '"_c')
keymap.set({ "n", "x" }, "C", '"_C')


keymap.set("v", "y", "y`>")

-- keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- keymap.set("n", "<leader>Y", [["+Y]])
-- keymap.set({ "n", "v" }, "<leader>d", [["_d]])

keymap.set("n", "Q", "<nop>")
-- keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
keymap.set("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format()<CR>")

keymap.set("v", "/", "<esc>/\\%V")

keymap.set("n", "<C-L>", ":vertical resize -5<CR>")
keymap.set("n", "<C-H>", ":vertical resize +5<CR>")


keymap.set("n", "<leader>;", "<cmd>cnext<CR>zz")
keymap.set("n", "\\", "<cmd>cprev<CR>zz")
-- keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

keymap.set("n", "<leader>rn", [[:%sno/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]])
keymap.set("v", "<leader>rn", [["hy:%sno/<C-r>h/<C-r>h/gIc<left><left><left><Left>]])
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nlua/sahaj/lazy.lua")
keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>gd", ":lua vim.diagnostic.disable(0)<CR>")
keymap.set("n", "<leader>ge", ":lua vim.diagnostic.enable(0)<CR>")

keymap.set("i", "<C-x>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>")

keymap.set("t", "<esc>", "<C-\\><C-n>")

keymap.set("i", "<C-d>", "<Del>")

keymap.set({ "n", "v" }, "<C-n>", "nvgn")

keymap.set("n", "<leader>cd", ":cd %:h<CR>", { desc = "Change cwd to buffer dir" })

--plugins-keymaps
keymap.set("n", "<leader>z", "<Cmd>ZenMode<CR>")

keymap.set("n", "<leader>cc", ":CccPick<CR>")
--undotree
keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")

-- lsp
keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
-- keymap.set("n", "H", ":lua vim.lsp.buf.hover()<CR>")
-- keymap.set("i", "<C-h>", ":lua vim.lsp.buf.signature_help()<CR>")
keymap.set("n", "]d", ":lua vim.diagnostic.goto_next()<CR>")
keymap.set("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>")
keymap.set("n", "<leader>vws", ":lua vim.lsp.buf.workspace_symbol()<CR>")
keymap.set("n", "<leader>o", ":lua vim.diagnostic.open_float()<CR>")
keymap.set("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
keymap.set("n", "<leader>lrf", ":lua vim.lsp.buf.references()<CR>")
keymap.set("n", "<leader>lrn", ":lua vim.lsp.buf.rename()<CR>")
keymap.set("n", "<leader>cmd", ":lua require('cmp').setup.buffer { enabled = false }<CR>")
keymap.set("n", "<leader>cme", ":lua require('cmp').setup.buffer { enabled = true }<CR>")

-- telescope
keymap.set("n", "<leader>fm", "<cmd>Telescope file_browser<cr>", { desc = "File Browser" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "File Browser" })
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Show open buffers" })
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Show git commits" })
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>", { desc = "Show git commits for current buffer" })
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Show git branches" })
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Show current git changes per file" })
keymap.set("n", "<leader>ft", "<cmd>Telescope<cr>", { desc = "Open Telescope options" })
keymap.set("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", { desc = "Find lsp references" })

keymap.set('n', '<leader>fps', function()
    require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") });
  end,
  { desc = "Find string, then filter with path" })

keymap.set('n', '<leader>fc', function()
    require("telescope.builtin").find_files({ cwd = require("telescope.utils").buffer_dir() });
  end,
  { desc = "Find files in cwd" })

-- Hop
-- keymap.set({ "n", "x" }, "<leader><leader>", ":HopWord<CR>")
-- keymap.set({ "n", "x" }, "S", "<cmd>HopChar2<CR>")
-- keymap.set({ "n", "x" }, "s", "<cmd>Pounce<CR>")
-- keymap.set({ "n", "x" }, "f", "<cmd>HopChar1CurrentLineAC<CR>")
-- keymap.set({ "n", "x" }, "F", "<cmd>HopChar1CurrentLineBC<CR>")


--runners
-- keymap.set("n", "<leader>9", ":!python3 %<CR>")
-- keymap.set("n", "<leader>8", ":!(foot -e sh -c 'python3 %;read e')<CR>", { silent = true })
vim.cmd [[
autocmd filetype python nnoremap <leader>9 :!python3 %<CR>
autocmd filetype python nnoremap <leader>8 :!(footclient -a float -w1200x700 -e sh -c 'python3 %;read e'&)<CR>
autocmd filetype c nnoremap <leader>9  :!gcc % -o %:r && ./%:r<CR>
autocmd filetype c nnoremap <leader>8  :!(footclient -a float -w1200x700-e sh -c 'gcc % -o %:r && ./%:r;read e'&)<CR>
autocmd filetype cpp nnoremap <leader>9  :!g++ % -o %:r && ./%:r<CR>
autocmd filetype cpp nnoremap <leader>8  :!(footclient -a float -w1200x700-e sh -c 'g++ % -o %:r && ./%:r;read e'&)<CR>
]]
-- Function to go to a pattern in a specified direction
function GotoPattern(pattern, dir)
  local saved_search_reg = vim.fn.getreg('/')
  local flags = "We"
  if dir == "b" then
    flags = flags .. "b"
  end
  for i = 1, vim.v.count1 do
    vim.fn.search(pattern, flags)
  end
  vim.fn.setreg('/', saved_search_reg)
end

-- keymap.set('n', 'w', [[:<C-U>lua GotoPattern('\\<\\w', 'f')<CR>]], { noremap = true, silent = true })
-- keymap.set('n', 'b', [[:lua GotoPattern('\\<\\w', 'b')<CR>]],
--     { noremap = true, silent = true })
-- vim.cmd [[vnoremap <silent> w :<C-U>let g:_saved_search_reg=@/<CR>gv/\(^\\|\<\)[A-Za-z0-9_]<CR>:<C-U>let @/=g:_saved_search_reg<CR>gv]]

function ToggleCheckbox()
  local line = vim.api.nvim_get_current_line()
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))
  local uncheckedspace, _ = string.find(line, "- %[ %]")
  local unchecked, _ = string.find(line, "- %[%]")
  local checked, _ = string.find(line, "- %[x%]")

  if uncheckedspace ~= nil then
    newLine = string.gsub(line, "%[ %]", "[x]")
  elseif unchecked ~= nil then
    newLine = string.gsub(line, "%[%]", "[x]")
  elseif checked ~= nil then
    newLine = string.gsub(line, "%[x%]", "[ ]")
  else
    newLine = "- [ ] " .. line
  end
  vim.api.nvim_set_current_line(newLine)
end

function ToggleCheckboxVisual()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")

  for line_num = start_line, end_line do
    vim.cmd("normal! " .. line_num .. "gg")
    ToggleCheckbox()
    -- vim.api.nvim_buf_set_line(0, line_num - 1, line_num - 1, false, ToggleLineCheckbox(vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, false)[1]))
  end
end

-- keymap.set("n", "<leader>t", ":lua ToggleCheckbox()<CR>")
keymap.set("v", "<leader>ch", ":lua ToggleCheckboxVisual()<CR>")
