-- ─────────────────────────────────────────
-- | CLANGD FIX | lua/plugins/clangd.lua
-- ─────────────────────────────────────────

-- ! IMPORTANT: dùng clangd của MSYS2, KHÔNG dùng bản của Mason nữa
-- ? Why this exists: clangd của Mason theo kiểu MSVC nên không tìm ra
--   header MinGW; clangd của MSYS2 thì tự biết.
-- WARNING: nếu cài MSYS2 ở chỗ khác thì phải đổi lại path
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          mason = false,
          cmd = {
            "C:/msys64/mingw64/bin/clangd.exe",
            "--background-index",
            "--clang-tidy",
            "--query-driver=C:/msys64/mingw64/bin/*",
          },
        },
      },
    },
  },
}
