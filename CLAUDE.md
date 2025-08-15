# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Neovim Configuration Overview

This is a modular Neovim configuration built with Lua and managed by lazy.nvim. The configuration is organized by functionality with each plugin defined in its own module file.

## Architecture

### Plugin Management
- **Plugin Manager**: lazy.nvim with automatic module imports
- **Structure**: Plugins are organized into functional categories:
  - `lua/core/` - Core editor functionality (file explorer, fuzzy finder, terminal, treesitter)
  - `lua/code/` - Coding features (LSP, completion, formatting, linting, testing)
  - `lua/ui/` - User interface enhancements (themes, statusline, dashboard)
  - `lua/git/` - Git integration (blame, diff, GitHub, lazygit)
  - `lua/editor/` - Editing utilities (navigation, regex, templates)
  - `lua/project/` - Project management (sessions, notes, todos)
  - `lua/tools/` - Additional tools (cheatsheet, converter, monitor)

### Module Pattern
Each plugin module returns a table (or array of tables) following the lazy.nvim spec format:
```lua
return {
  "plugin/name",
  dependencies = { ... },
  opts = { ... },
  config = function(_, opts) ... end,
  keys = { ... },
  event = { ... },
}
```

## Common Development Commands

### Plugin Management
- `:Lazy` - Open lazy.nvim UI for plugin management
- `:Lazy sync` - Update all plugins
- `:Lazy install` - Install missing plugins
- `:Lazy health` - Check plugin health

### Configuration Reload
- `:source %` - Reload current file
- Restart Neovim for full reload of configuration

### Code Formatting & Linting
- `<leader>;f` - Format current buffer (uses conform.nvim)
- Formatters configured: stylua (Lua), prettier (web), black (Python), gofumpt (Go), shfmt (Shell)
- Linters run automatically on save via nvim-lint

### LSP Operations
- `K` - Hover documentation
- `gd` - Go to definition
- `gr` - Find references
- `<leader>aa` - Code action
- `<leader>ls` - Document symbols
- `<leader>lS` - Workspace symbols

### Testing
- `<leader>''` - Run tests in current file
- `<leader>'r` - Run nearest test
- `<leader>'a` - Run all tests
- `<leader>'s` - Toggle test summary
- Test adapters: Python, Go, Ruby (RSpec), Jest, Haskell

### AI Integration
- Avante.nvim configured with OpenAI GPT-4o
- Image pasting support via img-clip.nvim
- Markdown rendering for AI responses

## Key Bindings

- **Leader key**: Space
- **Local leader**: Backslash
- **Window navigation**: `<C-h/j/k/l>`
- **Tab management**: `<leader><tab>` prefix
- **Diagnostics**: `[d`/`]d` for prev/next

## Adding New Plugins

1. Create a new Lua file in the appropriate category directory
2. Return a lazy.nvim plugin spec table
3. The plugin will be automatically loaded via the import in init.lua

Example:
```lua
-- lua/category/new-plugin.lua
return {
  "author/plugin-name",
  event = "VeryLazy",
  opts = {
    -- configuration
  },
}
```

## Configuration Standards

### Code Style
- **Indentation**: 2 spaces (no tabs in Lua files)
- **Line length**: No hard limit, but prefer readable line breaks
- **Quotes**: Double quotes for strings
- **Comments**: Minimal, code should be self-documenting

### Plugin Configuration
- Use `opts` table for static configuration
- Use `config` function for dynamic setup
- Prefer lazy loading with `event`, `cmd`, or `keys`
- Keep related keymaps in the plugin's `keys` table

### File Naming
- Use kebab-case for Lua module files
- Match module name to primary plugin functionality
- Group related plugins in the same file when appropriate

## Testing Your Changes

1. Save the file and run `:source %` for immediate reload
2. For structural changes, restart Neovim
3. Check `:Lazy` UI for any load errors
4. Run `:checkhealth` to verify plugin health

## Important Files

- `init.lua` - Entry point, bootstraps lazy.nvim and loads all modules
- `lua/config/options.lua` - Core Neovim options
- `lua/config/keymap/keymaps.lua` - Global keymaps
- `lua/config/autocmds.lua` - Auto commands
- `lazy-lock.json` - Plugin version lock file (committed to git)

## Current Active Development

- Recently added: AI integration with Avante.nvim (`lua/code/ai.lua`)
- Modified files in git status:
  - `lua/code/handlers/format.lua` - Formatter configuration
  - `lua/ui/lines/status-line.lua` - Status line customization

## Notes

- Test files are located in `test-files/` for various languages
- Skeleton templates in `skeletons/` for new file creation
- Custom snippets in `snippets/` directory
- Spell checking files in `spell/` directory