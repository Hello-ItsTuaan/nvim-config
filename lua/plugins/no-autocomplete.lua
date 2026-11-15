-- ───────────────────────────────────────
-- | COMPLETION |
-- ───────────────────────────────────────

return {
  -- ! IMPORTANT: LazyVim bản mới dùng blink.cmp
  {
    "saghen/blink.cmp",
    lazy = false,
    opts = function(_, opts)
      opts.keymap = {
        preset = "none",
        ["<Tab>"] = {
          function(cmp)
            local col = vim.fn.col(".")
            local line = vim.api.nvim_get_current_line()
            local next_char = line:sub(col, col)
            if next_char:match("[%)%]}\"'`]") then
              require("tabout").tabout()
              return true
            end
            if cmp.is_menu_visible() then
              return cmp.select_and_accept()
            end
            require("tabout").tabout()
            return true
          end,
          "fallback",
        },
        ["<S-Tab>"] = {
          function(cmp)
            if cmp.is_menu_visible() then
              return cmp.select_prev()
            end
            require("tabout").taboutBack()
            return true
          end,
          "fallback",
        },
        ["<C-Space>"] = { "show", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-e>"] = { "cancel", "fallback" },
        ["<CR>"] = { "fallback" },
      }
      opts.completion = {
        menu = { auto_show = true },
        list = {
          selection = {
            preselect = false,
            auto_insert = false,
          },
        },
        ghost_text = { enabled = false }, -- tắt chữ mờ gợi ý
      }
      return opts
    end,
  },

  -- ! IMPORTANT: LazyVim bản cũ dùng nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    opts = function(_, opts)
      opts.completion = { autocomplete = true }
      opts.experimental = { ghost_text = false }
    end,
  },
}
