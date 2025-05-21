-- lua/plugins/toggleterm.lua
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    open_mapping    = "<leader>t",      -- <Space>t toggles (only in Normal mode)
    direction       = "horizontal",     -- bottom split
    size = function(term)
      if term.direction == "horizontal" then
        return math.floor(vim.o.lines * 0.3)
      end
      return 80
    end,
    start_in_insert    = true,          -- drop into Insert when it opens
    insert_mappings    = false,         -- ⛔ disable <leader> mapping in Insert mode
    terminal_mappings  = true,          -- keep navigation mappings in terminal
    persist_size       = true,
    persist_mode       = true,
    shade_terminals    = true,
    shading_factor     = 2,
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    vim.api.nvim_create_augroup("ToggleTermKeymaps", { clear = true })
    vim.api.nvim_create_autocmd("TermOpen", {
      group    = "ToggleTermKeymaps",
      pattern  = "term://*toggleterm#*",
      callback = function()
        local buf = 0
        local km   = vim.keymap.set
        local o    = { buffer = buf, silent = true }

        -- Exit terminal mode with <Esc>
        km("t", "<Esc>", "<Esc>", o)

        -- Navigate splits with Cmd + h/j/k/l
        km("t", "<D-h>", "<Esc><Cmd>wincmd h<CR>", o)
        km("t", "<D-j>", "<Esc><Cmd>wincmd j<CR>", o)
        km("t", "<D-k>", "<Esc><Cmd>wincmd k<CR>", o)
        km("t", "<D-l>", "<Esc><Cmd>wincmd l<CR>", o)

        -- Always allow <Space>t to toggle off from inside terminal
        km("t", "<leader>t", "<Esc><Cmd>ToggleTerm<CR>", o)
      end,
    })
  end,
}
