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
  -- Agregado a propósito: antes lo tomabas de tu .vimrc compartido (via vim-plug),
  -- pero como separamos las configs, hace falta declararlo acá también para que
  -- SetColorscheme() (en config/colors.lua) siga funcionando con "everforest" por defecto.
  { "sainnhe/everforest", lazy = false, priority = 1000 },
}
