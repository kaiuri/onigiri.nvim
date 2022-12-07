-- TODO: Add colored printing
-- Imports
-- Neovim imports
local contains = vim.tbl_contains
local keys = vim.tbl_keys
---@type fun(chunks: {text: string, hl_group: string}[], history?: boolean, opts: nil[])
local nvim_echo = vim.api.nvim_echo

local DEFAULT_THEME = {
  ---@enum FBgColor
  Background = {
    default = "#303841",
    emphasis = "#2e353e",
    muted = "#3b454e",
  },
  ---@enum FColor
  Colors = {
    Accent = "#95b2d6",
    Caution = "#f9ae58",
    Danger = "#f97b58",
    Error = "#ec5f66",
    Hint = "#5fb4b4",
    Important = "#fac761",
    Info = "#99c794",
    Note = "#5c99d6",
    Trace = "#cc8ec6",
    Warn = "#ee932b",
  },
  ---@enum FFgColor
  Foreground = {
    default = "#d8dee9",
    emphasis = "#f7f7f7",
    muted = "#a6acb8",
    surface = "#46525c",
  },
  ---@enum FShadeColor
  Shade = {
    default = "#2f373f",
    emphasis = "#2e363e",
  },
}
-- table.sort(DEFAULT_THEME)
---@class FGroup table<K>: {[K]: string}

local function valid_hex(str)
  if not str then return false end
  return #str >= 4 and #str <= 7 and str:match("^#%x+$")
end

---@param name "Foreground"|"Background"|"Shade"|"Colors"
---@return FGroup<`name`>
local function FVar(name)
  local group = DEFAULT_THEME[name]
  local self  = setmetatable({}, {
    __index = group,
    __newindex = function(_, k, v)
      if not valid_hex(v) then
        error("Invalid hex color: " .. v)
      end
      if not contains(keys(group), k) then
        error("Invalid color entry: " .. k)
      end

      group[k] = v
    end,
  })

  return self
end

---@class Theme
---@field Foreground FGroup<FFgColor>
---@field Background FGroup<FBgColor>
---@field Shade      FGroup<FShadeColor>
---@field Colors     FGroup<FColor>
---@field new fun(theme?: Theme): Theme

---@type Theme
local Theme = {}

function Theme.new()
  local theme = {
    Foreground = FVar("Foreground"),
    Background = FVar("Background"),
    Shade = FVar("Shade"),
    Colors = FVar("Colors"),
  }
  local self = setmetatable({}, { __index = theme })


  return self
end

local theme = Theme.new()
vim.pretty_print(theme)

theme.Foreground.default = '#000'

vim.pretty_print(theme.Foreground.default)
vim.pretty_print(theme)
