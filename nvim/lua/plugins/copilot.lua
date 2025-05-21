-- lua/plugins/copilot.lua
return {
  "zbirenbaum/copilot.lua",
  -- only load when you explicitly call :ToggleCopilot
  cmd = "ToggleCopilot",
  config = function()
    local copilot = require("copilot")
    copilot.setup({
      suggestion = {
        -- start disabled
        enabled      = false,
        auto_trigger = false,
        debounce     = 75,
        keymap = {
          accept  = "<Tab>",
          next    = "<C-n>",
          prev    = "<C-p>",
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = false },
    })

    -- make sure cmp is on by default in every buffer
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        require("cmp").setup.buffer({ enabled = true })
      end,
    })

    -- toggle command
    vim.api.nvim_create_user_command("ToggleCopilot", function()
      local S   = require("copilot.suggestion")
      local cmp = require("cmp")

      -- flip Copilot auto-trigger in this buffer
      S.toggle_auto_trigger()
      S.dismiss()

      if vim.b.copilot_suggestion_auto_trigger then
        -- Copilot → ON, disable cmp
        cmp.setup.buffer({ enabled = false })
        print("Copilot ▶ ON; nvim-cmp ⏴ OFF")
      else
        -- Copilot → OFF, re-enable cmp
        cmp.setup.buffer({ enabled = true })
        print("Copilot ⏹ OFF; nvim-cmp ⏵ ON")
      end
    end, {
      desc = "Toggle Copilot inline suggestions and nvim-cmp popup",
    })
  end,
}
