-- TODO: Add colored printing
-- Imports
-- Neovim imports
local contains = vim.tbl_contains
local keys = vim.tbl_keys
---@type fun(chunks: {text: string, hl_group: string}[], history?: boolean, opts: nil[])
local nvim_echo = vim.api.nvim_echo

---@enum DEFAULT_THEME
local DEFAULT_THEME = {
  ---@enum Background
  Background = {
    default  = "#303841",
    emphasis = "#2e353e",
    muted    = "#3b454e",
  },
  ---@enum Colors
  Colors = {
    Accent    = "#95b2d6",
    Caution   = "#f9ae58",
    Danger    = "#f97b58",
    Error     = "#ec5f66",
    Hint      = "#5fb4b4",
    Important = "#fac761",
    Info      = "#99c794",
    Note      = "#5c99d6",
    Trace     = "#cc8ec6",
    Warn      = "#ee932b",
  },
  ---@enum Foreground
  Foreground = {
    default  = "#d8dee9",
    emphasis = "#f7f7f7",
    muted    = "#a6acb8",
    surface  = "#46525c",
  },
  ---@enum Shade
  Shade = {
    default  = "#2f373f",
    emphasis = "#2e363e",
  },
}

---@class Theme
---@field Foreground Foreground
---@field Background Background
---@field Shade      Shade
---@field Colors     Colors
---@field new        fun(theme?: Theme): Theme

local function valid_hex(str)
  if not str then return false end
  return #str >= 4 and #str <= 7 and str:match("^#%x+$")
end

---@generic T
---@param name `T`
---@return T
local function FVar(name)
  local group = DEFAULT_THEME[name]
  local self  = setmetatable({}, {
    __index = group,
    __newindex = function(_, k, v)
      assert(valid_hex(v), ("Invalid hex color: '%s'"):format(v))
      assert(contains(keys(group), k), ("Invalid key entry: '%s'"):format(k))
      group[k] = v
    end,
  })

  return self
end

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

---@type Theme
local theme = Theme.new()
vim.pretty_print(theme)

theme.Foreground.default = 'jflajf'

vim.pretty_print(theme.Foreground.default)
vim.pretty_print(theme)
