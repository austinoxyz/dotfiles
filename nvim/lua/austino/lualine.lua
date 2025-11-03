 -- lua/austino/config/lualine.lua

local bkg = vim.api.nvim_eval('synIDattr(hlID("Normal"), "bg")')

local colors = {
    black        = '#282828',
    white        = '#ebdbb2',
    red          = '#fb4934',
    green        = '#b8bb26',
    blue         = '#83a598',
    yellow       = '#fe8019',
    purple       = '#8c04f4',
    lightgray    = '#a89984',
    darkgray     = '#282828',
    gray         = '#504945',
    inactivegray = '#7c6f64',
    background   = bkg,
}

local gruvbox_ish = {
    normal = {
        a = { bg = colors.lightgray, fg = colors.black, gui = 'bold'},
        b = { bg = colors.gray,  fg = colors.white },

        -- foreground must be same color as background here as there is a 
        -- strange output of carets filling the entire component 
        -- when using most other plugins (i.e. ^^^^^^^^^^^^^^^^^^)
        c = { bg = colors.background, fg = bkg},
        z = { bg = colors.gray,  fg = colors.white },
    },
    insert = {
        a = {bg = colors.red, fg = colors.black, gui = 'bold'},
        b = {bg = colors.gray, fg = colors.white},
        c = {bg = colors.background, fg = colors.background},
        z = {bg = colors.gray, fg = colors.white},
    },
    visual = {
        a = {bg = colors.yellow, fg = colors.black, gui = 'bold'},
        b = {bg = colors.gray, fg = colors.white},
        c = {bg = colors.background, fg = colors.background},
        z = {bg = colors.gray, fg = colors.white},
    },
    replace = {
        a = {bg = colors.blue, fg = colors.black, gui = 'bold'},
        b = {bg = colors.gray, fg = colors.white},
        c = {bg = colors.background, fg = colors.background},
        z = {bg = colors.gray, fg = colors.white},
    },
    command = {
        a = {bg = colors.purple, fg = colors.black, gui = 'bold'},
        b = {bg = colors.gray, fg = colors.white},
        c = {bg = colors.background, fg = colors.background},
        z = {bg = colors.gray, fg = colors.white},
    },
    inactive = {
        a = {bg = colors.gray, fg = colors.lightgray, gui = 'bold'},
        b = {bg = colors.lightgray, fg = colors.lightgray},
        c = {bg = colors.background, fg = colors.background},
        z = {bg = colors.gray, fg = colors.white},
    }
}

local goyo_config = {
    options = {
        icons_enabled = false,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbaaar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = vim.go.laststatus == 3,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
}

require('lualine').setup {
    options = {
        theme = gruvbox_ish,
        always_divide_middle = false,
        globalstatus = true,
        icons_enabled = true
    },
    sections = {
        lualine_a = {
            { 
                'mode', 
                separator = { left = '    ', right = '' }, 
                padding = 2
            },
        },
        lualine_b = { 
            { 
                'branch', 
                separator = { left = '', right = '' }, 
            }, 
            { 
                'filename',
                show_modified_status = true,
                separator = { left = '', right = '' },
                symbols = {
                    modified = ' ●',
                    alternate_file = '#',
                    directory = '',
                },
            }, 
        },
        lualine_c = { { separator = { left = '', right = '' }, }, },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
            { 
                'filetype', 
                separator = { left = '', right = '' }, 
            },
            { 
                'encoding', 
                separator = { left = '', right = '' }, 
            },
            { 
                'progress', 
                separator = { left = '', right = '' }, 
                right_padding = 0, 
                left_padding = 2
            },
            { 
                'location', 
                separator = { left = '', right = '    ' }, 
                padding = 0 
            },
        },
    },
    tabline = {},
    extensions = {},
}

-- remove white color on extreme left and right ends
vim.cmd "hi! link StatusLine Normal"
vim.cmd "hi! link StatusLineNC Normal"

require('lualine').refresh({
    scope = 'window',  -- scope of refresh all/tabpage/window
    place = { 'statusline' },  -- lualine segment ro refresh.
})
