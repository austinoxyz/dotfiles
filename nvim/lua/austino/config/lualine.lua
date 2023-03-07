 -- lua/austino/config/lualine.lua

local colors = {
    black        = '#282828',
    white        = '#ebdbb2',
    red          = '#fb4934',
    green        = '#b8bb26',
    blue         = '#83a598',
    yellow       = '#fe8019',
    purple       = '#8c04f4',
    gray         = '#a89984',
    darkgray     = '#282828',
    lightgray    = '#504945',
    inactivegray = '#7c6f64',
}

local gruvbox_ish = {
    normal = {
        a = {bg = colors.gray, fg = colors.black, gui = 'bold'},
        b = {bg = colors.lightgray, fg = colors.white},
        c = {bg = colors.darkgray, fg = colors.darkgray},
        z = {bg = colors.lightgray, fg = colors.white},
    },
    insert = {
        a = {bg = colors.red, fg = colors.black, gui = 'bold'},
        b = {bg = colors.lightgray, fg = colors.white},
        c = {bg = colors.darkgray, fg = colors.darkgray},
        z = {bg = colors.lightgray, fg = colors.white},
    },
    visual = {
        a = {bg = colors.yellow, fg = colors.black, gui = 'bold'},
        b = {bg = colors.lightgray, fg = colors.white},
        c = {bg = colors.darkgray, fg = colors.darkgray},
        z = {bg = colors.lightgray, fg = colors.white},
    },
    replace = {
        a = {bg = colors.blue, fg = colors.black, gui = 'bold'},
        b = {bg = colors.lightgray, fg = colors.white},
        c = {bg = colors.darkgray, fg = colors.darkgray},
        z = {bg = colors.lightgray, fg = colors.white},
    },
    command = {
        a = {bg = colors.purple, fg = colors.black, gui = 'bold'},
        b = {bg = colors.lightgray, fg = colors.white},
        c = {bg = colors.darkgray, fg = colors.darkgray},
        z = {bg = colors.lightgray, fg = colors.white},
    },
    inactive = {
        a = {bg = colors.darkgray, fg = colors.gray, gui = 'bold'},
        b = {bg = colors.darkgray, fg = colors.gray},
        c = {bg = colors.darkgray, fg = colors.darkgray},
        z = {bg = colors.lightgray, fg = colors.white},
    }
}

require('lualine').setup {
    options = {
        theme = gruvbox_ish,
        always_divide_middle = false,
        globalstatus = true,
    },
    sections = {
        lualine_a = {
            { 'mode', separator = { left = '    ', right = '' }, padding = 2},
        },
        lualine_b = { 
            { 'branch', separator = { left = '', right = '' }, }, 
            { 
                'filename', 
                show_modified_status = true,
                separator = { left = '', right = '' }, 
                symbols = {
                    modified = ' ●',      -- Text to show when the buffer is modified
                    alternate_file = '#', -- Text to show to identify the alternate file
                    directory =  '',     -- Text to show when the buffer is a directory
                },
            }, 
        },
        lualine_c = { 
            { separator = { left = '', right = '' }, },
        },
        lualine_x = {},
        lualine_y = { },
        lualine_z = {
            { 'filetype', separator = { left = '', right = '' }, },
            { 'encoding', separator = { left = '', right = '' }, },
            { 'progress', separator = { left = '', right = '' }, right_padding = 0, left_padding = 2},
            { 'location', separator = { left = '', right = '    ' }, padding = 0 },
        },
--        lualine_y = { 
--            { 'filetype', separator = { left = '', right = '' } },
--            'encoding', 
--        },
--        lualine_z = {
--            { 'progress', separator = { left = '', right = '' }, right_padding = 0, left_padding = 2},
--            { 'location', separator = { left = '', right = '' }, padding = 0 },
--        },
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
