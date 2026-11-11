-- | ANIMATION PLUGINS (FULL FILE) |
-- ───────────────────────────────────────

return {
  -- ! IMPORTANT: con trỏ trượt, thấy rõ cả ở bước nhảy ngắn
  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
    opts = {
      smear_insert_mode = false,

      -- ? Why this exists: stiffness thấp = con trỏ đuổi chậm hơn = vệt kéo dài hơn 
      -- TODO: thấy chưa rõ thì giảm tiếp (0.4, 0.3), thấy lề mề thì tăng lại
      stiffness = 0.5,
      trailing_stiffness = 0.3,

      -- ! IMPORTANT: bộ thông số riêng cho Insert mode (lúc gõ chữ)
      stiffness_insert_mode = 0.5,
      trailing_stiffness_insert_mode = 0.3,

      -- WARNING: damping thấp quá con trỏ có thể "nảy" nhẹ, thấy lạ thì tăng lại 0.9
      damping_insert_mode = 0.85,
    },
  },

  -- ! IMPORTANT: cuộn trang mượt
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = {
      -- TODO: 1 = mặc định, 0.5 = nhanh gấp đôi
      duration_multiplier = 0.5,
    },
  },
}
