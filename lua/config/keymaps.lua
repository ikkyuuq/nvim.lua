local g = vim.g
local map = vim.keymap.set

g.mapleader = " "
g.maplocalleader = " "

-- Exit insert mode
map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
-- map("i", "jj", "<ESC>")

-- Remove search highligt after searching
map("n", "<ESC>", ":nohl<CR>", { desc = "Remove search highlight", silent = true })
map("n", "<leader>nh", ":nohl<CR>", { desc = "Remove search highlight", silent = true })

-- Better window navigation
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the below window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the above window" })

-- split window
map("n", "<leader>wv", ":vsplit<CR>", { desc = "[W]indow split [V]ertical", silent = true })
map("n", "<leader>wh", ":split<CR>", { desc = "[W]indow split [Herizontal", silent = true })

-- Stay in indent mode
map("v", "<", "<gv", { desc = "Indent left in visual mode" })
map("v", ">", ">gv", { desc = "Indent right in visual mode" })

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List", silent = true })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List", silent = true })

map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down", silent = true })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down", silent = true })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down", silent = true })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up", silent = true })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up", silent = true })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up", silent = true })

-- diagnostic
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	sverity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end

map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- Move to start/end of line
map({ "n", "x", "o" }, "H", "^")
map({ "n", "x", "o" }, "L", "g_")

-- Navigate buffers
map("n", "<Right>", ":bnext<CR>", { silent = true })
map("n", "<Left>", ":bprevious<CR>", { silent = true })
map("n", "<leader>bd", ":bd<CR>", { desc = "Close buffer", silent = true })
map("n", "<leader>bo", ":bufdo bd<CR>", { desc = "Close all other beffers", silent = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All", silent = true })

-- highlights under cursor
-- map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" }
-- map("n", "<leader>uI", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })

map("n", "<C-u>", "<C-u>zz", { desc = "Scroll upwards (center)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll downwards (center)" })

-- Zen mode
map("n", "<leader>zz", ":ZenMode<CR>", { desc = "Zen Mode", silent = true })

-- select a session to load
vim.keymap.set("n", "<leader>qS", function()
	require("persistence").select()
end)

-- Undo tree
map("n", "<leader>ut", ":UndotreeToggle<CR>", { desc = "Undo Tree", silent = true })

-- Toggle terminal
map("t", "<ESC><ESC>", "<C-\\><C-n>", { desc = "Escapre terminal mode" })
map("t", "<C-x>", "<C-\\><C-n>", { desc = "Exit Terminal" })
map("n", "<C-/>", '<cmd>exe v:count1 . "ToggleTerm"<CR>', { desc = "Toggle Terminal", silent = true })
map("i", "<C-/>", '<cmd>exe v:count1 . "ToggleTerm"<CR>', { desc = "Toggle Terminal", silent = true })
map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Move to left terminal", noremap = true })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Move to right terminal", noremap = true })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Move to bottom terminal", noremap = true })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Move to top terminal", noremap = true })
