-- lua/plugins/cmp.lua
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",   -- LSP source
    "hrsh7th/cmp-buffer",     -- buffer words
    "hrsh7th/cmp-path",       -- filesystem paths
    "L3MON4D3/LuaSnip",       -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- snippet completions
  },
  config = function()
    local cmp     = require("cmp")
    local luasnip = require("luasnip")

    -- load any VSCode-format snippets you have
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<Tab>"]     = cmp.mapping.confirm({ select = true }),   -- confirm with Tab
        ["<C-j>"]     = cmp.mapping.select_next_item(),           -- next with Ctrl-j
        ["<C-k>"]     = cmp.mapping.select_prev_item(),           -- prev with Ctrl-k
        ["<C-Space>"] = cmp.mapping.complete(),                   -- manually trigger
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}
