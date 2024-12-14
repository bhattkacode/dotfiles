return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'branch' },
        lualine_b = { { 'filename', new_file = true, path = 1 } },
        lualine_c = { 'diagnostics' },
        lualine_x = { 'diff', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
    }
  },
  {
    'stevearc/oil.nvim',
    cmd = "Oil",
    opts = {},
  },
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
  },
  { "nvim-pack/nvim-spectre",                 cmd = "Spectre" },
  {
    "uga-rosa/ccc.nvim",
    config = function()
      local ccc = require("ccc")
      ccc.setup { highlighter = { auto_enable = true, lsp = true } }
    end,
  },
  { "nvim-treesitter/nvim-treesitter-context" },
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      document_color = { enabled = false },
      conceal = { symbol = "…" }
    },
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html", "jsx", "tsx" }
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html", "jsx", "tsx" },
    opts = {}
  },

  { "folke/zen-mode.nvim",                    opts = { plugins = { options = { ruler = true, }, tmux = { enabled = true } } }, cmd = "ZenMode" },
  "mg979/vim-visual-multi",
  { 'nvim-telescope/telescope-ui-select.nvim' },
  { 'wakatime/vim-wakatime',                  lazy = false },
  {
    "dhruvasagar/vim-table-mode",
    keys = { "<leader>tt", },
    config = function()
      vim.keymap.set("n", "<leader>tt", "<cmd>Tableize/|<cr>")
    end,
  },
  -- { "jmbuhr/otter.nvim",      ft = "markdown" },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = { "nvim-lua/plenary.nvim", },
    opts = {
      workspaces = { { name = "notes", path = "~/notes", }, },
      disable_frontmatter = true,
      -- daily_notes = {
      --     folder = "journal/daily",
      --     template = "daily.md",
      -- },
      templates = {
        subdir = "templates",
      },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = { modes = { search = { enabled = false }, char = { enabled = false } } },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      -- {
      --   "S",
      --   mode = { "n", "x", "o" },
      --   function() require("flash").treesitter() end,
      --   desc =
      --   "Flash Treesitter"
      -- },
      {
        "r",
        mode = "o",
        function() require("flash").remote() end,
        desc =
        "Remote Flash"
      },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
        "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "Toggle Flash Search"
      },
    },

  },
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
      vim.keymap.set('i', '<Tab>', function() return vim.fn['codeium#Accept']() end,
        { expr = true, silent = true })
      -- vim.keymap.set('i', '<F34>', function() return vim.fn['codeium#CycleCompletions'](1) end,
      --     { expr = true, silent = true })
      -- vim.keymap.set('i', '<F33>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
      --     { expr = true, silent = true })
      vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end,
        { expr = true, silent = true })
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "NeoTree",
    keys = {
      { "<leader>tn", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },
  {
    'numToStr/Comment.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('Comment').setup {
        toggler = { line = '<leader>/', },
        opleader = { line = '<leader>/', }
      }
    end
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },

  {
    'theprimeagen/harpoon',
    branch = "harpoon2",
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()
      vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
      vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
      vim.keymap.set("n", "<leader>h", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<leader>j", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<leader>k", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<leader>l", function() harpoon:list():select(4) end)
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require("ibl").setup {
        scope = { enabled = false, highlight = { "WarningMsg" }, show_start = false, show_end = false },
      }
    end,
  },
  { "mbbill/undotree" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000, },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {},

  },
  { 'kylechui/nvim-surround', event = "VeryLazy", opts = { keymaps = { visual = "Y" }, }, },
  {
    "aserowy/tmux.nvim",
    opts = {
      copy_sync = {
        enable = false
      },
    }
  }
}
