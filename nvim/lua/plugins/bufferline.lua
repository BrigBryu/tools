-- lua/plugins/bufferline.lua
return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      -- show ordinal numbers for buffers
      numbers = "ordinal",

      -- show LSP diagnostics on buffer tabs
--      diagnostics = "nvim_lsp",

      -- slanted separators between tabs
      separator_style = "slant",
    },
    highlights = {
      -- any custom highlight overrides go in here
    },
  },
}
