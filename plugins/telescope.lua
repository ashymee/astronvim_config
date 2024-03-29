return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      enabled = vim.fn.executable "make" == 1,
      build = "make",
    },
  },
  cmd = "Telescope",
  opts = function()
    local actions = require "telescope.actions"
    local get_icon = require("astronvim.utils").get_icon
    return {
      defaults = {
        file_ignore_patterns = {
          ".env",
          -- ".astro/",
          ".git/",
          ".next/",
          ".vercel/",
          "dist/",
          "node_modules/",
          "__notes/",
          "**/pnpm-lock.yaml",
          "**/*.png",
          "**/*.jpg",
          "**/*.jpeg",
          "**/*.ttf",
          "**/*.otf",
        },
        git_worktrees = vim.g.git_worktrees,
        prompt_prefix = get_icon("Selected", 1),
        selection_caret = get_icon("Selected", 1),
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.6 },
          vertical = { mirror = false },
          width = 0.95,
          height = 0.95,
          preview_cutoff = 120,
        },
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
          n = { q = actions.close },
        },
      },
    }
  end,
  config = require "plugins.configs.telescope",
}
