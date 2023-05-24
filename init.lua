return {
  -- catppuccin,
  -- everforest,
  -- gruvbox,
  -- kanagawa,
  -- kanagawa-dragon,
  -- kanagawa-lotus,
  -- kanagawa-wave,
  -- mini-base16,
  -- nightfox,
  -- oxocarbon,
  -- rose-pine,
  -- tokyonight,
  -- NeoSolarized,
  -- solarized
  colorscheme = "NeoSolarized",
  icons = {
    ActiveLSP = "",
    ActiveTS = " ",
    BufferClose = "",
    DapBreakpoint = "",
    DapBreakpointCondition = "",
    DapBreakpointRejected = "",
    DapLogPoint = "",
    DapStopped = "",
    DefaultFile = "",
    Diagnostic = "",
    DiagnosticError = "",
    DiagnosticHint = "",
    DiagnosticInfo = "",
    DiagnosticWarn = "",
    Ellipsis = "",
    FileModified = "",
    FileReadOnly = "",
    FoldClosed = "",
    FoldOpened = "",
    FolderClosed = "",
    FolderEmpty = "",
    FolderOpen = "",
    Git = "",
    GitAdd = "",
    GitBranch = "",
    GitChange = "",
    GitConflict = "",
    GitDelete = "",
    GitIgnored = "◌",
    GitRenamed = "➜",
    GitStaged = "✓",
    GitUnstaged = "✗",
    GitUntracked = "★",
    LSPLoaded = "",
    LSPLoading1 = "",
    LSPLoading2 = "",
    LSPLoading3 = "",
    MacroRecording = "",
    Paste = "",
    Search = "",
    Selected = "",
    TabClose = "",
  },
  plugins = {
    {
      "rebelot/heirline.nvim",
      opts = function(_, opts)
        opts.winbar = nil
        return opts
      end,
    },
    {
      "rebelot/kanagawa.nvim",
      opts = { theme = "dragon", transparent = true },
    },
    "simrat39/rust-tools.nvim", -- add lsp plugin
    {
      "williamboman/mason-lspconfig.nvim",
      opts = { ensure_installed = { "rust_analyzer" } },
    },
  },
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
    },
  },
  diagnostics = { virtual_text = true, underline = true },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = {
          -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = {
          -- disable format on save for specified filetypes
          -- "python",
        },
        organize_imports_on_format = true,
      },
      disabled = {
        -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
    },
    -- enable servers that you already have installed without mason
    servers = {
      "astro",
      "bashls",
      "csharp_ls",
      "cssls",
      -- "denols",
      "dockerls",
      "emmet_ls",
      "gopls",
      "graphql",
      "html",
      "intelephense",
      "jsonls",
      "tailwindcss",
      "tsserver",
    },
    setup_handlers = {
      -- add custom handler
      tsserver = function(_, opts)
        require("typescript").setup { server = opts }
      end,
      rust_analyzer = function(_, opts)
        require("rust-tools").setup { server = opts }
      end,
      cssls = function(_, opts)
        require("lspconfig").cssls.setup {
          cmd = { "vscode-css-language-server", "--stdio" },
          filetypes = { "css", "scss", "less" },
          settings = {
            css = { lint = { unknownAtRules = "ignore" }, validate = true },
          },
        }
      end,
    },
  },
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = {
          "tohtml",
          "gzip",
          "matchit",
          "zipPlugin",
          "netrwPlugin",
          "tarPlugin",
        },
      },
    },
  },
  options = { opt = { showtabline = 0, laststatus = 2 } },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function() end,
}
