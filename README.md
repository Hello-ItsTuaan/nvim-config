# Neovim Configuration

Personal Neovim configuration built on [LazyVim](https://www.lazyvim.org/).
This setup is tailored for C++ development, Omarchy themes, transparent UI
panels, smooth animations, and predictable completion behavior.

## Features

### C++ development

- Uses `clangd` through `nvim-lspconfig`.
- Enables clangd background indexing, clang-tidy, all-scopes completion, and
  detailed completion items.
- Connects clangd capabilities to `blink.cmp`.
- Keeps diagnostics visible while typing, including signs and underlines.
- Disables automatic formatting for C++ buffers.
- Enables `autoindent`, `cindent`, and `smartindent` for C++ files.
- Installs the Tree-sitter C++ parser automatically for `tabout.nvim`.
- `<F5>` saves the current C++ file, compiles it with
  `clang++ -std=c++17`, and runs the executable in a bottom terminal split.

### Completion and tab navigation

- Uses `blink.cmp` with an explicit, minimal keymap instead of its preset.
- `<Tab>`:
  - Moves through matching brackets, quotes, and backticks with tabout.
  - Accepts the visible completion item when the completion menu is open.
  - Falls back to tabout when no completion item is selected.
- `<Shift-Tab>` selects the previous completion item or tabs backward.
- `<Ctrl-Space>` opens completion manually.
- `<Ctrl-N>` and `<Ctrl-P>` move through completion items.
- `<Ctrl-E>` cancels the completion menu.
- `<Enter>` falls back to normal Enter behavior.
- Disables ghost text, automatic preselection, and automatic insertion.
- Keeps compatibility settings for older `nvim-cmp` configurations.
- Excludes filetypes without a Tree-sitter parser from tabout automatically.

### Appearance and Omarchy integration

- Loads Omarchy-compatible themes without applying every theme at startup.
- Makes all configured colorschemes available for theme hot-reloading.
- Hot-reloads colorscheme plugins after Omarchy theme changes.
- Clears stale highlight groups and reapplies transparency after a theme reload.
- Makes editor windows, menus, popups, file trees, notifications, Telescope,
  status lines, and other UI surfaces transparent while preserving foreground
  colors and other attributes.
- Keeps the current-line highlight useful in Neo-tree while making the editor
  cursor line transparent.
- Makes Lualine sections transparent so the terminal background remains visible.

### Motion

- Adds `smear-cursor.nvim` for a subtle cursor trail.
- Adds `neoscroll.nvim` for smooth scrolling.
- Uses separate cursor-trail tuning for normal and insert mode.

## Important keymap

| Key | Action |
| --- | --- |
| `<F5>` | Compile and run the current C++ file |
| `<Tab>` | Accept completion, move through pairs, or insert a tab |
| `<Shift-Tab>` | Previous completion item or tab backward |
| `<Ctrl-Space>` | Show completion |
| `<Ctrl-N>` | Select next completion item |
| `<Ctrl-P>` | Select previous completion item |
| `<Ctrl-E>` | Cancel completion |

## Main customization files

| File | Purpose |
| --- | --- |
| `lua/config/keymaps.lua` | C++ compile-and-run mapping |
| `lua/config/autocmds.lua` | C++ indentation and formatting behavior |
| `lua/plugins/clangd.lua` | clangd and diagnostic configuration |
| `lua/plugins/no-autocomplete.lua` | blink.cmp and completion keymaps |
| `lua/plugins/tabout.lua` | Pair navigation and Tree-sitter integration |
| `lua/plugins/animation.lua` | Cursor trail and smooth scrolling |
| `lua/plugins/all-themes.lua` | Omarchy-compatible theme plugins |
| `lua/plugins/omarchy-theme-hotreload.lua` | Theme reload behavior |
| `lua/plugins/lualine-transparent.lua` | Transparent Lualine theme |
| `plugin/after/transparency.lua` | Transparent highlight groups |
| `lazy-lock.json` | Locked plugin revisions |

## Change history

The configuration started from the LazyVim starter template and was then
customized through these changes:

1. **LazyVim foundation**
   - Added the LazyVim bootstrap, plugin lockfile, base options, keymaps,
     example plugin configuration, and formatting settings.

2. **Animations and completion changes**
   - Added `smear-cursor.nvim` with tuned cursor-trail settings.
   - Added `neoscroll.nvim` with faster smooth scrolling.
   - Added `tabout.nvim` for navigating out of brackets and quotes.
   - Customized completion behavior and removed ghost-text style suggestions.

3. **clangd support**
   - Added a dedicated clangd configuration with clang-tidy, background
     indexing, detailed completion, and diagnostic updates while typing.

4. **C++ and Omarchy synchronization**
   - Added the `<F5>` C++ compile-and-run workflow.
   - Added the Omarchy theme list and theme hot-reload integration.
   - Added transparent highlight handling for editor and plugin UI.
   - Added transparent Lualine sections.
   - Improved blink.cmp and tabout interaction.
   - Added automatic Tree-sitter C++ parser installation.

5. **Current C++ editing improvements**
   - Disabled C++ autoformatting while preserving indentation helpers.
   - Improved `<Tab>` behavior when the cursor is directly before a closing
     delimiter.
   - Changed completion checks to use the current blink.cmp menu state.
   - Disabled completion preselection, automatic insertion, and ghost text.

## Installation

Clone this repository into the Neovim configuration directory:

```bash
git clone https://github.com/Hello-ItsTuaan/nvim-config.git ~/.config/nvim
```

Start Neovim and let LazyVim install the locked plugins. C++ development
requires `clang++`, `clangd`, and a working C++ compiler toolchain.
