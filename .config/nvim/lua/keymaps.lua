local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

-- Normal mode
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader>ee", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>ef", ":NvimTreeFindFile<CR>", opts)

-- Resizing
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":resize -2<CR>", opts)
keymap("n", "<C-Right>", ":resize +2<CR>", opts)

-- Buffer navigation
keymap("n", "<TAB>", ":bnext<CR>", opts)
keymap("n", "<S-TAB>", ":bprevious<CR>", opts)

-- Visual mode indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- don't yank the replaced text
keymap("v", "p", '"_dP', opts)

-- Move lines
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)

-- Telescope
keymap("n", "<Leader>ff", ":Telescope fd<CR>", opts)
keymap("n", "<Leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<Leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<Leader>fh", ":Telescope help_tags<CR>", opts)
keymap("n", "<Leader>fm", ":Telescope media_files<CR>", opts)
keymap("n", "<Leader>gb", ":Telescope git_branches<CR>", opts)
keymap("n", "<Leader>gc", ":Telescope git_commits<CR>", opts)
keymap("n", "<Leader>gs", ":Telescope git_status<CR>", opts)
keymap("n", "<Leader>gp", ":Telescope git_bcommits<CR>", opts)

-- crates
keymap("n", "<Leader>vt", ":lua require('crates').toggle()<CR>", opts)
keymap("n", "<Leader>vr", ":lua require('crates').reload()<CR>", opts)
keymap("n", "<Leader>vu", ":lua require('crates').update_crate()<CR>", opts)
keymap("v", "<Leader>vu", ":lua require('crates').update_crates()<CR>", opts)
keymap("n", "<Leader>va", ":lua require('crates').update_all_crates()<CR>", opts)
keymap("n", "<Leader>vU", ":lua require('crates').upgrade_crate()<CR>", opts)
keymap("v", "<Leader>vU", ":lua require('crates').upgrade_crates()<CR>", opts)
keymap("n", "<Leader>vA", ":lua require('crates').upgrade_all_crates()<CR>", opts)

-- Debug Adapter Protocol
keymap("n", "<F5>", ":lua require('dap').continue()<CR>", opts)
keymap("n", "<F10>", ":lua require('dap').step_over()<CR>", opts)
keymap("n", "<F11>", ":lua require('dap').step_into()<CR>", opts)
keymap("n", "<F12>", ":lua require('dap').step_out()<CR>", opts)
keymap("n", "<Leader>b", ":lua require('dap').toggle_breakpoint()<CR>", opts)
keymap("n", "<Leader>B", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap("n", "<Leader>lp", ":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
keymap("n", "<Leader>dr", ":lua require('dap').repl_open()<CR>", opts)
keymap("n", "<Leader>dl", ":lua require('dap').run_last()<CR>", opts)

-- Trouble
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)

-- LSP
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
keymap("n", "<Leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
keymap("n", "<Leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
keymap("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

keymap("n", "gr", '<cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
keymap("n", "gi", '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', opts)
keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "fd", "<cmd>lua vim.lsp.buf.format{ async = true }<CR>", opts)
