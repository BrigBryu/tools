-- lua/plugins/harpoon.lua
return {
  "ThePrimeagen/harpoon",
  branch       = "harpoon2",                 -- use the new v2 branch
  dependencies = { "nvim-lua/plenary.nvim" },
  event        = "VeryLazy",
  config = function()
    ---------------------------------------------------------------------------
    -- 1.  SET-UP
    ---------------------------------------------------------------------------
    local harpoon = require("harpoon")
    harpoon:setup()          -- note the ':' so `self.settings` is initialised

    -- convenience helpers
    local map       = vim.keymap.set
    local base_opts = { silent = true, noremap = true }
    local function O(desc)  -- merge base_opts + description
      return vim.tbl_extend("force", base_opts, { desc = desc })
    end

    ---------------------------------------------------------------------------
    -- 2.  PRIMARY ACTIONS
    ---------------------------------------------------------------------------
    -- add current file (optional label prompt)
    map("n", "<leader>ha", function()
      harpoon:list():append()
    end, O("Harpoon ▸ add file"))

    -- quick-menu toggle
    map("n", "<leader>hh", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, O("Harpoon ▸ quick menu"))

    -- jump straight to marks 1-4
    for i = 1, 4 do
      map("n", "<leader>h" .. i, function()
        harpoon:list():select(i)
      end, O("Harpoon ▸ goto mark " .. i))
    end

    ---------------------------------------------------------------------------
    -- 3.  MAINTENANCE ACTIONS
    ---------------------------------------------------------------------------
    -- delete the current buffer from Harpoon
    map("n", "<leader>hd", function()
      harpoon:list():remove()
    end, O("Harpoon ▸ delete current"))

    -- rename label for the current Harpoon entry
    map("n", "<leader>hr", function()
      local list = harpoon:list()
      local idx  = list:get_current_index()
      if not idx then return end
      local new  = vim.fn.input("Rename Harpoon label: ", list.items[idx].value)
      if new ~= "" then
        list:replace_at(idx, { value = list.items[idx].value,
                               context = { label = new } })
      end
    end, O("Harpoon ▸ rename label"))

    -- move current entry to a different slot (1-9)
    map("n", "<leader>hs", function()
      local list = harpoon:list()
      local from = list:get_current_index()
      if not from then return end
      local to = tonumber(vim.fn.input("Move to slot (1-9): "))
      if to and to >= 1 and to <= 9 then
        list:swap(from, to)
      end
    end, O("Harpoon ▸ swap slot"))
  end,
}
