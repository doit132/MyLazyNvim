-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- move
map("n", "j", "<Plug>(accelerated_jk_gj)", { desc = "acclerate down move" })
map("n", "k", "<Plug>(accelerated_jk_gk)", { desc = "acclerate up move" })

-- quit
map("n", "<C-q>", "<cmd>wq<cr>", { desc = "Save and quit" })
map("n", "Q", "<cmd>q!<cr>", { desc = "force quit" })

-- windows shotcut
map("i", "<C-z>", "<esc>ui", { desc = "undo" })
map("i", "<C-y>", "<esc><C-r>i", { desc = "redo" })
map("n", "<C-z>", "<nop>", { desc = "nop" })

vim.cmd([[noremap ; :]])
