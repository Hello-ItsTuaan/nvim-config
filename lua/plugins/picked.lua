-- ─────────────────────────────────────────────
-- | PICKED PLUGINS (LINUX) |
-- File: ~/.config/nvim/lua/plugins/picked.lua
-- ─────────────────────────────────────────────

-- ! IMPORTANT: file phải bắt đầu bằng `return {`, mỗi plugin là 1 table trong list
return {
  -- ─── competitest.nvim ───
  -- ? Why this exists: chạy code với test case, lấy sample từ Codeforces
  {
    "xeluxee/competitest.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    cmd = "CompetiTest",
    keys = {
      { "<leader>cr", "<cmd>CompetiTest run<cr>", desc = "CP: Run testcases" },
      { "<leader>ca", "<cmd>CompetiTest add_testcase<cr>", desc = "CP: Add testcase" },
      { "<leader>ce", "<cmd>CompetiTest edit_testcase<cr>", desc = "CP: Edit testcase" },
      { "<leader>cc", "<cmd>CompetiTest receive problem<cr>", desc = "CP: Receive problem" },
    },
    config = function()
      require("competitest").setup({
        compile_command = {
          cpp = {
            exec = "g++",
            args = { "-std=c++17", "-O2", "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" },
          },
        },
        run_command = {
          cpp = { exec = "./$(FNOEXT)" },
        },
      })
    end,
  },

  -- ─── multicursor.nvim ───
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()
      local set = vim.keymap.set

      set({ "n", "x" }, "<C-Up>", function()
        mc.lineAddCursor(-1)
      end, { desc = "Add cursor above" })
      set({ "n", "x" }, "<C-Down>", function()
        mc.lineAddCursor(1)
      end, { desc = "Add cursor below" })
      set({ "n", "x" }, "<C-n>", function()
        mc.matchAddCursor(1)
      end, { desc = "Add cursor at next match" })
      set({ "n", "x" }, "<C-q>", mc.toggleCursor, { desc = "Toggle cursor" })

      -- WARNING: các phím dưới chỉ hoạt động khi đang có nhiều con trỏ
      mc.addKeymapLayer(function(layerSet)
        layerSet({ "n", "x" }, "<Left>", mc.prevCursor)
        layerSet({ "n", "x" }, "<Right>", mc.nextCursor)
        layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)
        layerSet("n", "<Esc>", function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end)
      end)
    end,
  },

  -- ─── nvim-treesitter-context ───
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "LazyFile",
    opts = { max_lines = 3 },
  },

  -- ─── tiny-inline-diagnostic.nvim ───
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup()
      -- TODO: tắt virtual text mặc định để không hiện lỗi 2 lần
      vim.diagnostic.config({ virtual_text = false })
    end,
  },

  -- ─── rainbow-delimiters.nvim ───
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
  },
}
