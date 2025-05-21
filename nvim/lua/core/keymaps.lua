-- lua/core/keymaps.lua
-- this file is loaded **after** <leader> is set

local km   = vim.keymap.set
local opts = { silent = true, noremap = true }

-- ── File-explorer & fuzzy find ────────────────────────────────────────────────
-- <leader>f → Telescope file picker (opens in current buffer)
km("n", "<leader>f", "<Cmd>Telescope find_files<CR>", opts)

-- <leader>n → create a blank buffer, then Telescope picker (replaces it)
km("n", "<leader>n", function()
  vim.cmd("enew")                                   -- step 1: new empty buffer
  require("telescope.builtin").find_files()         -- step 2: file-picker
end, opts)

-- ── Bufferline navigation ────────────────────────────────────────────────────
-- Jump straight to the 1st-5th buffer displayed in bufferline
for i = 1, 5 do
  km("n", ("<leader>%d"):format(i),
     ("<Cmd>BufferLineGoToBuffer %d<CR>"):format(i),
     opts)
end

-- Cycle left / right through buffers
km("n", "<leader>h", "<Cmd>BufferLineCyclePrev<CR>", opts)
km("n", "<leader>l", "<Cmd>BufferLineCycleNext<CR>", opts)

-- Re-order or close buffers
km("n", "<leader><", "<Cmd>BufferLineMovePrev<CR>",  opts)
km("n", "<leader>>", "<Cmd>BufferLineMoveNext<CR>",  opts)
km("n", "<leader>c", "<Cmd>BufferLinePickClose<CR>", opts)

-- ── Session commands ─────────────────────────────────────────────────────────
km("n", "<leader>ss", "<Cmd>SaveSession<CR>",    opts)
km("n", "<leader>sr", "<Cmd>RestoreSession<CR>", opts)
