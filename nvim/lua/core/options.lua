local o = vim.opt

-- UI
o.number         = true        -- show absolute line numbers
o.relativenumber = true        -- show relative line numbers
o.cursorline     = true        -- highlight the current line
o.signcolumn     = "yes"       -- always show the sign column
o.termguicolors  = true        -- enable true-color support
o.scrolloff      = 8           -- keep 8 lines above/below cursor
o.sidescrolloff  = 8           -- keep 8 columns left/right of cursor

-- turn OFF special-list characters (no more “>” glyphs)
o.list           = false

-- Tabs & Indentation
o.expandtab      = false       -- use real tabs, not spaces
o.tabstop        = 3           -- a literal <Tab> is 3 spaces wide
o.shiftwidth     = 3           -- << and >> shift by 3
o.softtabstop    = 3           -- Tab/backspace in insert mode behaves like 3

o.autoindent     = true        -- copy indent from current line on break
o.smartindent    = true        -- C-like smart indenting

-- Splits
o.splitright     = true        -- vertical splits go to the right
o.splitbelow     = true        -- horizontal splits go below

-- Search
o.ignorecase     = true        -- case-insensitive search...
o.smartcase      = true        -- ...unless uppercase letters are used
o.hlsearch       = true        -- highlight all search matches

-- File handling
o.clipboard      = "unnamedplus"  -- use system clipboard
o.swapfile       = false           -- disable swap files
o.backup         = false           -- disable backup files
o.writebackup    = false
o.undofile       = true            -- persistent undo history

-- Performance & UX
o.hidden         = true        -- keep buffers alive when they’re hidden
o.updatetime     = 300         -- faster CursorHold events
o.timeoutlen     = 500         -- shorter keymap timeout
o.wrap           = false       -- don't wrap long lines
o.confirm        = true        -- prompt to save before closing modified buffers
