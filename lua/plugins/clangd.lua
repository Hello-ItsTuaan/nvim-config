-- ─────────────────────────────────────────
-- | CLANGD FIX | lua/plugins/clangd.lua
-- ─────────────────────────────────────────

return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.diagnostic.config({
        update_in_insert = true,
        underline = true,
        signs = true,
      })
    end,
    opts = {
      servers = {
        clangd = {
          mason = false,
          capabilities = require("blink.cmp").get_lsp_capabilities(),
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--all-scopes-completion",
            "--completion-style=detailed",
          },
        },
      },
    },
  },
}
