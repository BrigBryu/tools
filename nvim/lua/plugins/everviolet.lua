return {
  "everviolet/nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- replace `everviolet` with the actual theme name if it differs
    vim.cmd([[colorscheme everviolet]])
  end,
}
