return {
  "cdmill/neomodern.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("neomodern").setup({
      --theme   = "gyokuro",
      theme   = "hojicha",
      --theme   = "roseprime",
      --theme   = "iceclimber",  -- pick one: iceclimber | gyokuro | hojicha | roseprime
      variant = "dark",        -- or "light"
    })
    require("neomodern").load()
  end,
}
