-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Lua (init.lua)

local map = LazyVim.safe_keymap_set

-- Mapping for MarkdownPreview command with <M-m>
map({ "n" }, "<M-m>", ":MarkdownPreview<CR>", { silent = true })
--
-- CopilotChat - Quick chat keybinding with <leader>ccq
map({ "n" }, "<leader>ccq", function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end, { desc = "CopilotChat - Quick chat", silent = true })
