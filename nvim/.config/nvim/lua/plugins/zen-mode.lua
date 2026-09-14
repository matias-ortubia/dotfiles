return {
 {
 "folke/zen-mode.nvim",
 config = function()
 vim.keymap.set("n", "<leader>zen", "<CMD>ZenMode<CR>", { desc = "Toggle zen mode" })
 end,
 },
}
