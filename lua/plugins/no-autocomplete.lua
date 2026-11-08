-- ───────────────────────────────────────
-- | DISABLE AUTO COMPLETION POPUP |
-- ───────────────────────────────────────

return {
  -- ! IMPORTANT: LazyVim bản mới dùng blink.cmp
  {
    "saghen/blink.cmp",
    -- ? Why this exists: optional = true nghĩa là chỉ chỉnh khi plugin có sẵn, không tự cài thêm
    optional = true,
    opts = {
      completion = {
        menu = { auto_show = false }, -- không tự bật menu khi gõ
        ghost_text = { enabled = false }, -- tắt chữ mờ gợi ý
      },
    },
  },

  -- ! IMPORTANT: LazyVim bản cũ dùng nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    opts = function(_, opts)
      -- TODO: muốn bật lại thì xoá cả file này đi
      opts.completion = { autocomplete = false }
      opts.experimental = { ghost_text = false }
    end,
  },
}
