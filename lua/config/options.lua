local opt = vim.opt

opt.number = true -- display line numbers
opt.relativenumber = true -- display relative line numbers
opt.numberwidth = 2 -- set width of line number columns
opt.signcolumn = "yes" -- always show sign column
opt.colorcolumn = "80" -- set color column to 80 characters
opt.wrap = false -- display lines as signle line
opt.scrolloff = 10 -- number of lines to keeep above/below cursor
opt.sidescrolloff = 8 -- number of column to keep the left/right of cursor

-- Tab spacing / behavior
opt.expandtab = true -- convert tabs to spaces
opt.shiftwidth = 2 -- number of spaces inserted for each indentation level
opt.tabstop = 2 -- number of spaces inserted for tab character
opt.softtabstop = 2 -- number of spaces inserted for <Tab> key
opt.smartindent = true -- enable smart indentation
opt.breakindent = true -- enalbe line breaking indentation

-- General
local g = vim.g

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.guicursor = ""
opt.list = true
opt.fillchars = { fold = " ", foldclose = "›", foldsep = " ", eob = " ", diff = "╱" }
opt.listchars = { tab = "· ", trail = "—", extends = "…", precedes = "…", eol = "↴", nbsp = "␣" }
opt.backup = false -- disable backup file creation
opt.clipboard = "unnamedplus" -- enable system clipboard access
opt.conceallevel = 0 -- show concealed characters in markdonw files
opt.fileencoding = "utf-8" -- set file encoding to UTF-8
opt.mouse = "a" -- enable mouse support
opt.showmode = false -- hide mode display
opt.splitbelow = true -- force horizontal splits below current window
opt.splitright = true -- force verical splits right of current window
opt.termguicolors = true -- enable term GUI colors
opt.timeoutlen = 700 -- set timeout for testped sequences
opt.undofile = true -- enable persistent undo
opt.updatetime = 100 -- set faster completion
opt.writebackup = false -- prevent editing of files edited elsewhere
opt.cursorline = true -- highligt current line

-- Searching
opt.hlsearch = true -- highlight all matches in search
opt.ignorecase = true -- ignore case in search
opt.smartcase = true -- match case if explicity stated

opt.backspace = { "indent", "eol", "start" }

opt.path = "**" -- set path to search for files

opt.wildignore:append({ "*/node_modules/*" })

-- Set filetypes

vim.filetype.add({
	extension = {
		env = "dotenv",
	},
	filename = {
		[".env"] = "dotenv",
		["env"] = "dotenv",
	},
	pattern = {
		["[jt]sconfig.*.json"] = "jsonc",
		["%.env%.[%w_.-]+"] = "dotenv",
	},
})
