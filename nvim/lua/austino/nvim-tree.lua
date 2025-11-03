 -- lua/austino/config/nvim-tree.lua

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- key mappings
local function nvimtree_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, 
            noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "<C-e>", api.node.open.tab, opts("OpenTab"))
  vim.keymap.set("n", "<C-o>", api.node.open.vertical, opts("OpenVertical"))
  vim.keymap.set("n", "<C-u>", api.node.open.horizontal, opts("OpenHorizal"))
end

-- empty setup using defaults
require("nvim-tree").setup({
    on_attach = nvimtree_on_attach,
    disable_netrw = true,
    hijack_netrw = true,
    auto_reload_on_write = true,
    hijack_cursor = false,
    sort_by = "name",
    update_cwd = true,
    sync_root_with_cwd = true,
    open_on_tab = false,
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        width = 30,
        side = "left",
        number = false,
        relativenumber = false,
    },
    renderer = {
        highlight_git = true,
        root_folder_modifier = ":t",
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    deleted = "",
                    untracked = "U",
                    ignored = "◌",
                },
                folder = {
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                },
            }
        }
    },
})
