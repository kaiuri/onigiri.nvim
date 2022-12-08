-- TODO: Add colored printing
-- Imports
local concat = table.concat
local insert = table.insert
-- Neovim imports
local contains = vim.tbl_contains
local keys = vim.tbl_keys

local function valid_hex(str)
  if not str then return false end
  return #str >= 4 and #str <= 7 and str:match("^#%x+$")
end

---@class DefaultTheme
local DEFAULT_THEME = {
  ---@class Background
  Background = {
    default  = "#303841",
    emphasis = "#2e353e",
    muted    = "#3b454e",
  },
  ---@class Colors
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
  ---@class Foreground
  Foreground = {
    default  = "#d8dee9",
    emphasis = "#f7f7f7",
    muted    = "#a6acb8",
    surface  = "#46525c",
  },
  ---@class Shade
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

---@generic FVar
---@param name `FVar`
---@return FVar
local function FVarBuilder(name)
  local __index = vim.tbl_extend(
    'force',
    DEFAULT_THEME[name],
    vim.g.onigiri['theme'][name])

  local __call = function(_, fcolor)
    assert(contains(keys(__index), fcolor), ("Invalid key entry: '%s'"):format(fcolor))
    return __index[fcolor]
  end
  local FVar = setmetatable({}, {
    __index = __index,
    __newindex = function(_, k, v)
      assert(valid_hex(v), ("Invalid hex color: '%s'"):format(v))
      assert(contains(keys(__index), k), ("Invalid key entry: '%s'"):format(k))
      __index[k] = v
    end,
    __call = __call,
    __tostring = function()
      local ret = {}
      for k, v in pairs(__index) do
        local entry = concat({ name, ".", k, " = ", v }, "")
        insert(ret, entry)
      end
      return concat(ret, "\n")
    end
  })
  return FVar
end

-- ---@param self Theme
-- ---@param group_name string
-- ---@param color string
-- ---@param options HighlightingOptions
-- function Theme:getHighlight(group_name, color, options)
--   local highlight = {}
--   for _, option in ipairs(options) do
--     highlight[option] = self[name][option]
--   end
--   return highlight
-- end

---@return Theme
local function ThemeBuilder()
  local __index = {
    Foreground = FVarBuilder("Foreground"),
    Background = FVarBuilder("Background"),
    Shade = FVarBuilder("Shade"),
    Colors = FVarBuilder("Colors"),
  }
  local Theme = setmetatable({}, {
    __index = __index,
    __call = function(_, group_name, fcolor)
      return __index[group_name](fcolor)
    end,
    __tostring = function()
      local ret = {}
      for _, v in pairs(__index) do
        insert(ret, tostring(v))
      end
      return concat(ret, "\n")
    end
  })

  return Theme
end

local theme = ThemeBuilder()
print(theme)
-- print(theme.Foreground)

return ThemeBuilder()
