-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ---------------------------------------------
-- | COMPILE AND RUN C++ (F5)                  |
-- ---------------------------------------------
-- ? Why this exists: one key = save + build + run, no need to leave nvim
-- ! IMPORTANT: start nvim from a terminal that loaded the VS environment
-- TODO: remove -IC:/cpinclude if you do not use the fake bits/stdc++.h
vim.keymap.set("n", "<F5>", function()
  vim.cmd("write")

  local file = vim.fn.expand("%:p")
  local exe = vim.fn.expand("%:p:r") .. ".exe"

  local cmd = string.format(
    'clang++ -std=c++17 -IC:/cpinclude "%s" -o "%s" && "%s"',
    file, exe, exe
  )

  vim.cmd("botright split | resize 14")
  vim.cmd("terminal " .. cmd)
  vim.cmd("startinsert")
end, { desc = "Compile and run C++" })