local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Map leader to space
vim.g.mapleader = " "

-- Switch Session
map("n", "<Leader>1", ":SearchSession<CR>")

-- Update Plugins
map("n", "<Leader>u", ":PackerSync<CR>")

-- Quick new file
map("n", "<Leader>n", "<cmd>enew<CR>")

-- Easy select all of file
map("n", "<Leader>sa", "ggVG<c-$>")

-- Make visual yanks place the cursor back where started
map("v", "y", "ygv<Esc>")

-- Easier file save
map("n", "<Leader>w", "<cmd>:w<CR>")
map("n", "<Delete>", "<cmd>:w<CR>")

-- More molecular undo of text
-- map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", "!", "!<c-g>u")
map("i", "?", "?<c-g>u")
map("i", ";", ";<c-g>u")
map("i", ":", ":<c-g>u")

-- Navigate buffers
map("n", "<leader>bn", "<cmd>:bnext<CR>")
map("n", "<leader>bp", "<cmd>:bprevious<CR>")
map("n", "<leader>bf", "<cmd>:bfirst<CR>")
map("n", "<leader>bl", "<cmd>:blast<CR>")

-- Line bubbling
map("n", "<c-j>", "<cmd>m .+1<CR>==", { silent = true })
map("n", "<c-k>", "<cmd>m .-2<CR>==", { silent = true })
map("v", "<c-j>", ":m '>+1<CR>==gv=gv", { silent = true })
map("v", "<c-k>", ":m '<-2<CR>==gv=gv", { silent = true })

--debugging
map("n", "<F5>", ":lua require'dap'.continue()<CR>")
map("n", "<F3>", ":lua require'dap'.step_over()<CR>")
map("n", "<F2>", ":lua require'dap'.step_into()<CR>")
map("n", "<F12>", ":lua require'dap'.step_out()<CR>")
map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
map("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
map("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
map("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>")

--After searching, pressing escape stops the highlight
map("n", "<esc>", ":noh<cr><esc>", { silent = true })

-- Open Lazygit
map("n", "<leader>l", ":LazyGit<cr>", { silent = true })

-- Telescope
local km = vim.keymap

-- Add moves of more than 5 to the jump list
km.set("n", "j", [[(v:count > 5 ? "m'" . v:count : "") . 'j']], { expr = true, desc = "if j > 5 then add to jumplist" })
km.set("n", "<leader>p", function()
	require("telescope.builtin").find_files()
end)
km.set("n", "<leader>m", function()
	require("telescope.builtin").marks()
end)
km.set("n", "<leader>y", function()
	require("telescope.builtin").git_bcommits()
end)
km.set("n", "<leader>sg", function()
	require("telescope.builtin").live_grep()
end)
km.set("n", "<leader>sb", function()
	require("telescope.builtin").buffers()
end)
km.set("n", "<leader>sr", function()
	require("telescope.builtin").registers()
end)
km.set("n", "<leader>sf", function()
	require("telescope").extensions.file_browser.file_browser()
end)
km.set("n", "<leader>sh", function()
	require("telescope.builtin").help_tags()
end)
km.set({ "v", "n" }, "<leader>cn", function()
	vim.lsp.buf.rename()
end, { noremap = true, silent = true })
km.set("n", "<leader>ci", function()
	vim.diagnostic.open_float()
end)

-- Easier split mappings
map("n", "<Leader><Down>", "<C-W><C-J>", { silent = true })
map("n", "<Leader><Up>", "<C-W><C-K>", { silent = true })
map("n", "<Leader><Right>", "<C-W><C-L>", { silent = true })
map("n", "<Leader><Left>", "<C-W><C-H>", { silent = true })
map("n", "<Leader>;", "<C-W>R", { silent = true })
map("n", "<Leader>[", "<C-W>_", { silent = true })
map("n", "<Leader>]", "<C-W>|", { silent = true })
map("n", "<Leader>=", "<C-W>=", { silent = true })

-- Pounce
km.set({ "n", "v" }, "h", ":Pounce<CR>", { silent = true })
km.set("n", "H", ":PounceRepeat<CR>", { silent = true })

-- Symbols outline
map("n", "<leader>o", ":SymbolsOutline<cr>")

-- Make Option and backspace delete whole words in OSX/Kitty. Requires `macos_option_as_alt yes` to be set in Kitty config
map("i", "<A-BS>", "<C-W>")
