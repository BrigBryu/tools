-- lua/plugins/python.lua
return {
  "vim-python/python-syntax",
  ft = "python",      -- only loads for *.py buffers
  init = function()
    -- Optional: keep it super-light by disabling extras
    vim.g.python_highlight_all = 1      -- enable full syntax set
    vim.g.python_slow_sync = 0          -- turn off costly sync checks
    vim.g.python_highlight_space_errors = 0
  end,
}
