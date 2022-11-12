---@meta

---@class FunctionalVariables
---@field Background {default: string, emphasis: string, muted: string},
---@field Foreground {default: string, emphasis: string, muted: string, surface: string},
---@field Shade {default: string, emphasis: string},
---@field Colors {Accent: string, Caution: string, Danger: string, Error: string, Hint: string, Important: string, Info: string, Note: string, Trace: string, Warn: string}

---@class HighlightDefMap
---@field fg? string: color name or "#RRGGBB", see note.
---@field bg? string: color name or "#RRGGBB", see note.
---@field sp? string: color name or "#RRGGBB"
---@field blend? integer: [0, 100]
---@field bold? boolean
---@field standout? boolean
---@field underline? boolean
---@field undercurl? boolean
---@field underdouble? boolean
---@field underdotted? boolean
---@field underdashed? boolean
---@field strikethrough? boolean
---@field italic? boolean
---@field reverse? boolean
---@field nocombine? boolean
---@field link? string: name of another highlight group to link to, see `:hi-link`.
---@field default? boolean: Don't override existing definition `:hi-default`
---@field ctermfg? string: Sets foreground of cterm color `highlight-ctermfg`
---@field ctermbg? string: Sets background of cterm color `highlight-ctermbg`
---@field cterm? string: cterm attribute map, like `highlight-args`. If not set , cterm attributes will match those from the attribute map documented above.
