return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.2",
  cmd = "Telescope",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    telescope.setup({})

    -- alias :Tel to :Telescope
    vim.api.nvim_create_user_command(
      'Tel',               -- new command name
      'Telescope <args>',  -- calls Telescope with arguments
      { nargs = '*' }      -- accept zero or more args
    )

    local km = vim.keymap.set
    km("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { silent = true })
    km("n", "<leader>fg", "<cmd>Telescope live_grep<CR>",  { silent = true })
    km("n", "<leader>fb", "<cmd>Telescope buffers<CR>",    { silent = true })
  end,
}
