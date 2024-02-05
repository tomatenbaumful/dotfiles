vim.g.mapleader = " "
vim.g.copilot_assume_mapped = true

vim.keymap.set("n", "<leader>fa", "gg=G<C-o>")
-- New tab
vim.keymap.set("n", "tn", ":tabnew %<CR>", { desc = "New tab" })
vim.keymap.set("n", "tc", ":tabclose<CR>", { desc = "Close tab" })
-- Split window
vim.keymap.set("n", "ss", ":split<Return><C-w>w", { desc = "Split window horizontally" }) -- Horizontal
vim.keymap.set("n", "sv", ":vsplit<Return><C-w>w", { desc = "Split window vertically" }) -- Vertical
-- Move window
vim.keymap.set("", "<C-h>", "<C-w>h", { desc = "Move window (left)" }) -- Left
vim.keymap.set("", "<C-k>", "<C-w>k", { desc = "Move window (up)" }) -- Up
vim.keymap.set("", "<C-j>", "<C-w>j", { desc = "Move window (down)" }) -- Down
vim.keymap.set("", "<C-l>", "<C-w>l", { desc = "Move window (right)" }) -- Right

-- Resize window
vim.keymap.set("n", "<C-w><left>", "<C-w><", { desc = "Resize window (left)" })
vim.keymap.set("n", "<C-w><right>", "<C-w>>", { desc = "Resize window (right)" })
vim.keymap.set("n", "<C-w><up>", "<C-w>+", { desc = "Resize window (up)" })
vim.keymap.set("n", "<C-w><down>", "<C-w>-", { desc = "Resize window (down)" })

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Jumping pages keeps cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump page up" })

-- Keep search terms in the middle of the screen
vim.keymap.set("n", "n", "nzzzv", { desc = "Jump to next search term" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Jump to previous search term" })

-- Pastes copied buffer and keeps it in the register
vim.keymap.set("x", "<leader>p", '"_dP')

local opts = {
	shiftwidth = 2,
	tabstop = 2,
	expandtab = true,
	wrap = false,
	termguicolors = true,
	number = true,
	relativenumber = true,
	scrolloff = 14,
	signcolumn = "yes",
	hlsearch = false,
	incsearch = true,

	conceallevel = 0,
	formatoptions = vim.o.formatoptions:gsub("cro", ""),
	updatetime = 50,
	ignorecase = true,
	smartcase = true,
	splitbelow = true,
	splitright = true,
}

for opt, val in pairs(opts) do
	vim.o[opt] = val
end
