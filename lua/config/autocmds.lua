local api = vim.api

-- don't auto comment new line except for .js and .ts files
api.nvim_create_autocmd("BufEnter", {
	callback = function()
		if vim.bo.filetype ~= "javascript" and vim.bo.filetype ~= "typescript" then
			vim.opt_local.formatoptions:remove({ "c", "r", "o" })
		end
	end,
})

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- go to last loc when opening a buffer
-- this mean that when you open a file, you will be at the last position
api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})
