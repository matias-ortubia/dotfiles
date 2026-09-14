return {
 {
 "nvim-tree/nvim-tree.lua",
 dependencies = { "nvim-tree/nvim-web-devicons" },
 config = function()
 require("nvim-tree").setup({})
 vim.keymap.set("n", "<C-t>", "<CMD>NvimTreeToggle<CR>", { desc = "Toggle file tree (like NERDTree)" })
 end,
 },
}
