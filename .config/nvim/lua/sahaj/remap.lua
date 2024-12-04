vim.g.mapleader = " "

local keymap = vim.keymap
-- keymap.set("x", "p", function() return 'pgv"' .. vim.v.register .. "y" end, { remap = false, expr = true })
keymap.set("x", "p", "P")
keymap.set("n", "zM", "<cmd>%foldc<CR>", { silent = true })
keymap.set("n", "<leader>zm", "<cmd>%foldc!<CR>", { silent = true })
keymap.set("n", "<leader>lt", ":!xdg-open https://leetcode.com/problems/<cword><CR>")
keymap.set("n", "<leader>tr", ":lua transparent()<CR>", { silent = true })
keymap.set("n", "<leader>to", ":lua opaque()<CR>", { silent = true })

keymap.set("n", "<leader>q", 'cs"`ysa`}')

keymap.set('n', '<leader>w', ':silent! noautocmd w<CR>', { noremap = true, silent = true })

keymap.set("n", "<leader>1",
  ":3,$y<CR>:!echo 'key alt+space'|dotoolc; sleep 0.1;echo 'mouseto 0.9 0.3'| dotoolc; sleep 0.01; echo 'click left'|dotoolc ; sleep 0.01; echo 'key ctrl+a' | dotoolc; sleep 0.01; echo 'key ctrl+v' | dotoolc<CR>")
keymap.set("n", "<leader>2",
  ":3,$y<CR>:!echo 'key alt+space'|dotoolc; sleep 0.1;echo 'mouseto 0.9 0.3'|dotoolc; sleep 0.01; echo 'click left'|dotoolc; sleep 0.01; echo 'key ctrl+a'|dotoolc; sleep 0.01; echo 'key ctrl+v'|dotoolc; sleep 0.01; echo 'key ctrl+apostrophe' | dotoolc<CR>")
keymap.set("n", "<leader>3",
  ":!echo 'key alt+space'|dotoolc; sleep 0.1;echo 'mouseto 0.95 0.3'|dotool; sleep 0.01; echo 'click left'|dotoolc; sleep 0.01; echo 'key ctrl+a'|dotoolc; sleep 0.01; echo 'key ctrl+c'|dotoolc; sleep 0.01; echo 'key alt+space'|dotoolc; sleep 0.1;  echo 'key enter'|dotoolc; sleep 0.01; echo 'key P' | dotoolc<CR>")
keymap.set("n", "<leader>4",
  ":3,$y<CR>:!echo 'key alt+space'|dotoolc; sleep 0.1;echo 'mouseto 0.9 0.3'|dotool; sleep 0.01; echo 'click left'|dotoolc; sleep 0.01; echo 'key ctrl+a'|dotoolc; sleep 0.01; echo 'key ctrl+v'|dotoolc; sleep 0.01; echo 'key ctrl+apostrophe' | dotoolc<CR>")

keymap.set("n", "H", ":bprev<CR>", { silent = true })
keymap.set("n", "L", ":bnext<CR>", { silent = true })

keymap.set("x", "Q", ":norm @q<CR>")

keymap.set("n", "<leader>s", ":w<CR>")

keymap.set("n", "<leader>co", ":CodeiumToggle<CR>")

keymap.set("n", "<leader>p", '"0p')

keymap.set("n", "<esc>", ":noh<CR>", { silent = true })
keymap.set("n", "<leader>ch", ":set hlsearch<CR>", { silent = true })

keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection up" })

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
keymap.set({ "n", "x" }, "<leader>d", '"_d')
keymap.set({ "n", "x" }, "c", '"_c')
keymap.set({ "n", "x" }, "C", '"_C')

keymap.set("v", "y", "y`>")
keymap.set("n", "Q", "<nop>")
keymap.set("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format()<CR>")
keymap.set("v", "/", "<esc>/\\%V")
keymap.set("n", "<C-L>", ":vertical resize -5<CR>")
keymap.set("n", "<C-H>", ":vertical resize +5<CR>")
keymap.set("n", "<leader>;", "<cmd>cnext<CR>zz")
keymap.set("n", "<leader>,", "<cmd>cprev<CR>zz")
-- keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

keymap.set("n", "<leader>rn", [[:%sno/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]])
keymap.set("v", "<leader>rn", [["hy:%sno/<C-r>h/<C-r>h/gIc<left><left><left><Left>]])
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nlua/sahaj/lazy.lua")
keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>gd", ":lua vim.diagnostic.disable(0)<CR>")
keymap.set("n", "<leader>ge", ":lua vim.diagnostic.enable(0)<CR>")

keymap.set("t", "<esc>", "<C-\\><C-n>")

keymap.set("i", "<C-d>", "<Del>")

keymap.set({ "n", "v" }, "<C-n>", "nvgn")

keymap.set("n", "<leader>cd", ":cd %:h<CR>", { desc = "Change cwd to buffer dir" })

--plugins-keymaps
keymap.set("n", "<leader>tc", ":TailwindConcealToggle<CR>")

--ccc
keymap.set("n", "<leader>cc", ":CccPick<CR>")

--undotree
keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")

-- lsp
keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
keymap.set("i", "<C-t>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>")
keymap.set("n", "]d", ":lua vim.diagnostic.goto_next()<CR>")
keymap.set("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>")
keymap.set("n", "<leader>vws", ":lua vim.lsp.buf.workspace_symbol()<CR>")
keymap.set("n", "<leader>o", ":lua vim.diagnostic.open_float()<CR>")
keymap.set("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
keymap.set("n", "<leader>lrf", ":lua vim.lsp.buf.references()<CR>")
keymap.set("n", "<leader>lrn", ":lua vim.lsp.buf.rename()<CR>")
keymap.set("n", "<leader>cmd", ":lua require('cmp').setup.buffer { enabled = false }<CR>")
keymap.set("n", "<leader>cme", ":lua require('cmp').setup.buffer { enabled = true }<CR>")

local show_only_errors = false
function toggle_diagnostics()
  if show_only_errors then
    vim.diagnostic.config({
      virtual_text = { severity = { min = vim.diagnostic.severity.WARN }, prefix = '•' }
    })
    show_only_errors = false
    print("Showing warnings and errors")
  else
    vim.diagnostic.config({
      virtual_text = { severity = { min = vim.diagnostic.severity.ERROR }, prefix = '•' }
    })
    show_only_errors = true
    print("Showing only errors")
  end
end

vim.keymap.set("n", "<leader>tw", toggle_diagnostics, { desc = "Toggle warnings+errors/errors" })

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


-- Conform
keymap.set("n", "<leader>ct", ":ConformToggle<CR>", { desc = "Toggle Format on save" })
keymap.set("n", "<leader>cb", ":ConformToggle!<CR>", { desc = "Toggle Format on save in current buffer" })

--runners
vim.cmd [[
autocmd filetype python nnoremap <leader>9 :!python3 %<CR>
autocmd filetype python nnoremap <leader>8 :!(footclient -a float -w1200x700 -e sh -c 'python3 %;read e'&)<CR>
autocmd filetype c nnoremap <leader>9  :!gcc % -o %:r && ./%:r<CR>
autocmd filetype c nnoremap <leader>8  :!(footclient -a float -w1200x700-e sh -c 'gcc % -o %:r && ./%:r;read e'&)<CR>
autocmd filetype cpp nnoremap <leader>9  :!g++ % -o %:r && ./%:r<CR>
autocmd filetype cpp nnoremap <leader>8  :!(footclient -a float -w1200x700-e sh -c 'g++ % -o %:r && ./%:r;read e'&)<CR>
autocmd filetype qml nnoremap <leader>9  :!qmlscene %<CR>
autocmd filetype qml nnoremap <leader>8  :!(footclient -a float -w1200x700-e sh -c 'qmlscene %'&)<CR>
]]
