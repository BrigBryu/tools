return {
  "alexxGmZ/e-ink.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- if it has a setup function, call it here; then:
    vim.cmd([[colorscheme e-ink]])
  end,
}
