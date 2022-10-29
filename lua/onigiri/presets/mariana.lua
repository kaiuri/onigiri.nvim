local c = {
    gray   = {
        [1]  = '#000000',
        [2]  = '#2e363e',
        [3]  = '#2e353e', --'#272e35', -- float bg
        [4]  = '#2f373f',
        [5]  = '#303841', -- bg
        [6]  = '#3b454e',
        [7]  = '#46525c',
        [8]  = '#a6acb8',
        [9]  = '#d8dee9', -- '#d5dee6', -- fg
        [10] = '#f7f7f7',
        [11] = '#ffffff',
    },
    green  = '#99c794',
    orange = {
        [1] = '#ee932b',
        [2] = '#f9ae58',
    },
    pink   = '#cc8ec6',
    red    = {
        [1] = '#ec5f66',
        [2] = '#f97b58',
    },
    yellow = '#fac761',
    blue   = {
        [1] = '#5c99d6',
        [2] = '#95B2D6',
    },
    cyan   = '#5fb4b4',
}
---@type FunctionalVariables
local vars = {
    Foreground = {
        surface  = c.gray[7],
        muted    = c.gray[8],
        default  = c.gray[9],
        emphasis = c.gray[10],
    },
    Shade = {
        default  = c.gray[4],
        emphasis = c.gray[2],
    },
    Background = {
        muted    = c.gray[6], -- c.gray[6],
        default  = c.gray[5],
        emphasis = c.gray[3],
    },
    Colors = {
        Trace     = c.pink, -- #cc8ec6
        Accent    = c.blue[2], -- #95b2d6
        Note      = c.blue[1], -- #5c99d6
        Hint      = c.cyan, -- #5fb4b4
        Info      = c.green, -- #99c794
        Important = c.yellow, -- #fac761
        Warn      = c.orange[1], -- #f9ae58
        Caution   = c.orange[2], -- #ee932b
        Danger    = c.red[2], -- #f97b58
        Error     = c.red[1], -- #ec5f66
    }
}
return vars
