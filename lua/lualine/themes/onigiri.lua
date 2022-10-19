local config = require 'onigiri'.config
local v = config()

local fg = v.Foreground.default
local bg = v.Background.muted

return {
    normal = {
        a = { bg = v.Background.default, fg = v.Foreground.emphasis, gui = 'bold' },
        b = { bg = bg, fg = fg },
        c = { bg = bg, fg = fg },
    },
    insert = {
        a = { bg = v.Colors.Info, fg = v.Background.emphasis, gui = 'bold' },
        b = { bg = bg, fg = fg },
        c = { bg = bg, fg = fg },
    },
    visual = {
        a = { bg = v.Colors.Hint, fg = v.Background.emphasis, gui = 'bold' },
        b = { bg = bg, fg = fg },
        c = { bg = bg, fg = fg },
    },
    replace = {
        a = { bg = v.Colors.Danger, fg = v.Background.emphasis, gui = 'bold' },
        b = { bg = bg, fg = fg },
        c = { bg = bg, fg = fg },
    },
    command = {
        a = { bg = v.Colors.Warn, fg = v.Background.emphasis, gui = 'bold' },
        b = { bg = bg, fg = fg },
        c = { bg = bg, fg = fg },
    },
    terminal = {
        a = { bg = v.Colors.Trace, fg = v.Background.emphasis, gui = 'bold' },
        b = { bg = bg, fg = fg },
        c = { bg = bg, fg = fg },
    },
    inactive = {
        a = { bg = v.Background.muted, fg = v.Foreground.default },
        b = { bg = bg, fg = fg },
        c = { bg = bg, fg = fg },
    },
}
