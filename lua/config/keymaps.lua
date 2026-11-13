-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ---------------------------------------------
-- | COMPILE AND RUN C++ (F5)                  |
-- ---------------------------------------------
-- One key saves, builds, and runs the current C++ file.
vim.keymap.set("n", "<F5>", function()
  vim.cmd("write")

  local file = vim.fn.expand("%:p")
  local exe = vim.fn.expand("%:p:r")

  local cmd = string.format(
    'clang++ -std=c++17 "%s" -o "%s" && "%s"',
    file, exe, exe
  )

  vim.cmd("botright split | resize 14")
  vim.cmd("terminal " .. cmd)
  vim.cmd("startinsert")
end, { desc = "Compile and run C++" })