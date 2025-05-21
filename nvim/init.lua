local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- set leader to space
vim.g.mapleader      = " "
vim.g.maplocalleader = " "

-- core settings & keymaps
require("core.options")    -- basic vim.opt settings
require("core.keymaps")    -- custom keybindings

-- plugin specs
local plugins = {
  require("plugins.treesitter"),
  require("plugins.bufferline"),
  require("plugins.lsp"),
  require("plugins.toggleterm"),
  require("plugins.cmp"),
  require("plugins.copilot"),
  require("plugins.telescope"),
  require("plugins.whichkey"),
  require("plugins.harpoon"),
  require("plugins.session"),
  require("plugins.python"),
  -- colorschemes
  --require("plugins.gruvbox"),
  --require("plugins.jellybeans"),
  require("plugins.neomodern"), --has in the plugin/neomodern.lua iceclimber | gyokuro | hojicha | roseprime
  -- require("plugins.eink"),

}

-- load & configure plugins
require("lazy").setup(plugins, {
  ui = {
    border = "rounded",
  },
  install = {
    colorscheme = { "gruvbox", "tokyonight", "catppuccin" },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

vim.api.nvim_create_user_command("ViHelp", function()
  vim.cmd("edit ~/Documents/text/vim_help.txt")
end, {})
vim.api.nvim_create_user_command("Todo", function()
  vim.cmd("edit ~/Documents/text/todo.txt")
end, {})
