return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    lspconfig.gdscript.setup({
      cmd       = { "gdscript-language-server", "--stdio" },
      filetypes = { "gdscript" },
      root_dir  = lspconfig.util.find_git_ancestor,
    })
  end,
}
