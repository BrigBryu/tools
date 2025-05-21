return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "gdscript", "lua", "bash", "python" },
    highlight = { enable = true },
    indent    = { enable = true },
  },
}
