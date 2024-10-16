return {
    "nvim-telescope/telescope.nvim",

    dependencies = { 'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build =
            'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
        }, },
    module = 'telescope',

    config = function()
        -- import telescope plugin safely
        local telescope = require("telescope")
        local builtin = require('telescope.builtin')

        local select_one_or_multi = function(prompt_bufnr)
            local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
            local multi = picker:get_multi_selection()
            if not vim.tbl_isempty(multi) then
                require('telescope.actions').close(prompt_bufnr)
                for _, j in pairs(multi) do
                    if j.path ~= nil then
                        vim.cmd(string.format('%s %s', 'edit', j.path))
                    end
                end
            else
                require('telescope.actions').select_default(prompt_bufnr)
            end
        end

        telescope.setup {
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
                file_browser = {
                    -- theme = "ivy",
                    -- -- disables netrw and use telescope-file-browser in its place
                    -- hijack_netrw = true,
                    -- mappings = {
                    --     ["i"] = {
                    --         -- your custom insert mode mappings
                    --     },
                    --     ["n"] = {
                    --         -- your custom normal mode mappings
                    --     },
                    -- },
                },
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                }
            },
            defaults = {
                prompt_prefix = "   ",
                selection_caret = "  ",
                entry_prefix = "  ",
                initial_mode = "insert",
                selection_strategy = "reset",
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                },
                winblend = 0,
                border = {},
                borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                color_devicons = true,
                buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
                mappings = {
                    n = { ["q"] = require("telescope.actions").close },
                    i = { ['<CR>'] = select_one_or_multi },
                },
            },
            -- To get fzf loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            telescope.load_extension('fzf') }
    end,
}
