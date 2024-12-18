return {
  {
    'crispgm/nvim-tabline',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      show_icon = true,         -- show file extension icon
      modify_indicator = '[+]', -- modify indicator
      no_name = 'No name',      -- no name buffer name
      brackets = { '', '' },    -- file name brackets surrounding

    },
  },
  { 'echasnovski/mini.cursorword', opts = {} },

  -- inconsistent
  -- {
  --   "zbirenbaum/neodim",
  --   event = "LspAttach",
  --   opts = {
  --     alpha = 0.75,
  --     blend_color = "#000000",
  --     hide = { underline = true, virtual_text = false, signs = true },
  --   }
  -- },
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    ft = { "javascriptreact", "typescriptreact" }
  },
  {
    'linrongbin16/lsp-progress.nvim',
    config = function()
      require("lsp-progress").setup({
        client_format = function(client_name, spinner, series_messages)
          if #series_messages == 0 then
            return nil
          end
          return {
            name = client_name,
            body = spinner .. " " .. table.concat(series_messages, ", "),
          }
        end,
        format = function(client_messages)
          --- @param name string
          --- @param msg string?
          --- @return string
          local function stringify(name, msg)
            return msg and string.format("%s %s", name, msg) or name
          end

          local sign = "" -- nf-fa-gear \uf013
          local lsp_clients = vim.lsp.get_active_clients()
          local messages_map = {}
          for _, climsg in ipairs(client_messages) do
            messages_map[climsg.name] = climsg.body
          end

          if #lsp_clients > 0 then
            table.sort(lsp_clients, function(a, b)
              return a.name < b.name
            end)
            local builder = {}
            for _, cli in ipairs(lsp_clients) do
              if
                  type(cli) == "table"
                  and type(cli.name) == "string"
                  and string.len(cli.name) > 0
              then
                if messages_map[cli.name] then
                  table.insert(
                    builder,
                    stringify(cli.name,
                      messages_map[cli.name])
                  )
                else
                  table.insert(builder, stringify(cli.name))
                end
              end
            end
            if #builder > 0 then
              return sign .. " " .. table.concat(builder, ", ")
            end
          end
          return ""
        end,
      })
    end
  },
  {
    'sindrets/diffview.nvim',
    opts = {
      win_config = {
        position = "bottom",
        -- width = 35,
        -- win_opts = {},
      },
    },
    cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewToggleFiles", "DiffviewFocusFiles" }
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
        sections = {

          lualine_a = { 'branch' },
          lualine_b = { { 'filename', new_file = true, path = 1, shorting_target = 40 } },
          lualine_c = { 'diagnostics' },
          lualine_x = { function() return require('lsp-progress').progress() end, 'diff', 'filetype' },
          lualine_y = { function() return "{.}%3{codeium#GetStatusString()}" end, 'progress' },
          lualine_z = { 'location' }
        },
      }
      vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        group = "lualine_augroup",
        pattern = "LspProgressStatusUpdated",
        callback = require("lualine").refresh,
      })
    end
  },
  {
    'stevearc/oil.nvim',
    cmd = "Oil",
    opts = {},
  },
  { "nvim-pack/nvim-spectre",      cmd = "Spectre" },
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
  -- {
  --   'numToStr/Comment.nvim',
  --   event = { "BufReadPre", "BufNewFile" },
  --   config = function()
  --     require('Comment').setup {
  --       toggler = { line = '<leader>/', },
  --       opleader = { line = '<leader>/', }
  --     }
  --   end
  -- },
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
      -- create autocmd when buffenter
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          require("ibl").setup {
            scope = {
              enabled = true,
              highlight = { "IblScope" },
              show_start = false
            },
          }
        end,
      })
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
