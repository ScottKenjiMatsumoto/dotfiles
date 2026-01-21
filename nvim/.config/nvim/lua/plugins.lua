return {
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "42fc28ba918343ebfd5565147a42a26580579482", -- v0.10.0
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          "c", "lua", "vim", "vimdoc", "query",
          "elixir", "heex", "javascript", "html",
          "terraform", "hcl", "dart", "hjson"
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },

  -- ✅ Minimal Mermaid highlighting for .mmd/.mermaid
  { "mracos/mermaid.vim" }, -- lightweight Vim syntax plugin

  {
    "nvim-tree/nvim-tree.lua",
    commit = "321bc61580fd066b76861c32de3319c3a6d089e7", -- v1.14.0
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      commit = "b8221e42cf7287c4dcde81f232f58d7b947c210d",
    },
    config = function()
      local my_on_attach = require("nvim-tree-attach").my_on_attach

      require("nvim-tree").setup {
        on_attach = my_on_attach,
        -- other options...
      }
    end,
  },
  -- flutter
  -- {
  --   'akinsho/flutter-tools.nvim',
  --   lazy = false,
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'stevearc/dressing.nvim',
  --   },
  --   config = function()
  --     require("flutter-tools").setup {
  --       lsp = {
  --         cmd = {"dart", "language-server", "--protocol=lsp"},
  --         -- explicitly set SDK path (if needed)
  --         -- TODO: set sdk_path = "<dart sdk path>"
  --       }
  --     }
  --   end
  -- },
  {
    'numToStr/Comment.nvim',
    lazy = false,
  },
  {
    "iamcco/markdown-preview.nvim",
    commit = "a923f5fc5ba36a3b17e289dc35dc17f66d0548ee", -- v0.0.10
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    -- build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "selimacerbas/mermaid-playground.nvim",
    dependencies = { "barrett-ruth/live-server.nvim" },
    config = function()
      require("mermaid_playground").setup({
        -- all optional; sane defaults shown
        workspace_dir = nil,                -- defaults to: $XDG_CONFIG_HOME/mermaid-playground
        index_name    = "index.html",
        diagram_name  = "diagram.mmd",
        overwrite_index_on_start = false,   -- don't clobber your customized index.html
        auto_refresh  = true,
        auto_refresh_events = { "InsertLeave", "TextChanged", "TextChangedI", "BufWritePost" },
        debounce_ms   = 450,
        notify_on_refresh = false,
      })
    end,
  }
}
