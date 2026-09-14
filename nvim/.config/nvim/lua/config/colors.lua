function SetColorscheme(color)
    --color = color or "everforest"
    --color = color or "catppuccin-mocha"
    color = color or "evergarden"

    vim.cmd.colorscheme(color)
end

SetColorscheme()
