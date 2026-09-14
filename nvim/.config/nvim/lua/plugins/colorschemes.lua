return {
  { "rose-pine/neovim", name = "rose-pine" },
  { "rebelot/kanagawa.nvim" },
  { "tiagovla/tokyodark.nvim" },
  { "DanielEliasib/sweet-fusion" },
  { "DeviusVim/deviuspro.nvim" },
  {
    "luisiacc/gruvbox-baby",
    config = function()
      vim.g.gruvbox_baby_background_color = "dark"
      vim.g.gruvbox_baby_function_style = "NONE"
    end,
  },
  { "catppuccin/nvim", name = "catppuccin" },
  { "sainnhe/everforest", lazy = false, priority = 1000 },
  {
    'everviolet/nvim', name = 'evergarden',
    priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
    opts = {
      theme = {
        variant = 'winter', -- 'winter'|'fall'|'spring'|'summer'
        accent = 'green',
      },
      editor = {
        transparent_background = false,
        sign = { color = 'none' },
        float = {
          color = 'mantle',
          solid_border = false,
        },
        completion = {
          color = 'surface0',
        },
      },
    }
  }
}
