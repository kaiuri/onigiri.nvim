local ok, bit = pcall(require, 'bit')
if not ok then -- If bit library is missing, do not load module
    vim.notify('missing BitOp library - https://bitop.luajit.org', vim.log.levels.ERROR)
    return {}
end

local band = bit.band
local rshift = bit.rshift
local lshift = bit.lshift
local bor = bit.bor

--- RGB block
---@private
local RGB = {}
---Normalize any hex color format to 0xRRGGBB
---@param hex_str string
---@return number
RGB.hex_tonumber = function(hex_str)
    assert(hex_str:sub(1, 1) == '#', 'hex_str must be prepended with #')
    hex_str = hex_str:sub(2, -1) -- remove prepended '#'
    if #hex_str == 3 then --duplicate each char
        hex_str = hex_str:gsub('(%x)', '%1%1')
    end
    return tonumber(hex_str, 16)
end

RGB.from_hex = function(hex)
    if type(hex) == 'string' then
        hex = RGB.hex_tonumber(hex)
    end
    local r = band(rshift(hex, 16), 0xFF)
    local g = band(rshift(hex, 8), 0xFF)
    local b = band(hex, 0xFF)
    return { r, g, b }
end

---@param rgb number[] # {r, g, b}
---@return string # 0xffffff, etc
RGB.to_hex = function(rgb)
    local u = bor(lshift(rgb[1], 16), lshift(rgb[2], 8), rgb[3])
    return string.format('#%06x', u)
end

--- HSL block
---@private
local HSL = {}

---@param rgb number[] # {r, g, b}
---@return number[] # {h, s, l}
HSL.from_rgb = function(rgb) -- standard rgb to hsl
    local r = rgb[1] / 255
    local g = rgb[2] / 255
    local b = rgb[3] / 255
    local max = math.max(r, g, b)
    local min = math.min(r, g, b)
    local h, s, l = 0, 0, (max + min) / 2
    if max == min then
        h, s = 0, 0
    else
        local d = max - min
        s = l > 0.5 and d / (2 - max - min) or d / (max + min)
        if max == r then
            h = (g - b) / d + (g < b and 6 or 0)
        elseif max == g then
            h = (b - r) / d + 2
        elseif max == b then
            h = (r - g) / d + 4
        end
        h = h / 6
    end
    return { h, s, l }
end

---@param p number
---@param q number
---@param t number
---@return number
local function hue2rgb(p, q, t)
    if t < 0 then t = t + 1 end
    if t > 1 then t = t - 1 end
    if t < 1 / 6 then return p + (q - p) * 6 * t end
    if t < 1 / 2 then return q end
    if t < 2 / 3 then return p + (q - p) * (2 / 3 - t) * 6 end
    return p
end

---@param hsl number[] # {h, s, l}
---@return number[] # {r, g, b}
HSL.to_rgb = function(hsl)
    local h = hsl[1]
    local s = hsl[2]
    local l = hsl[3]
    local r, g, b
    if s == 0 then
        r, g, b = l, l, l
    else
        local q = l < 0.5 and l * (1 + s) or l + s - l * s
        local p = 2 * l - q
        r = hue2rgb(p, q, h + 1 / 3)
        g = hue2rgb(p, q, h)
        b = hue2rgb(p, q, h - 1 / 3)
    end
    return { r * 255, g * 255, b * 255 }
end


---@param hsl number[] # {h, s, l}
---@return string # #ffffff, etc
HSL.to_hex = function(hsl)
    local rgb = HSL.to_rgb(hsl)
    return RGB.to_hex(rgb)
end

---@param hex string
---@return number[] # {h, s, l}
HSL.from_hex = function(hex)
    local rgb = RGB.from_hex(hex)
    return HSL.from_rgb(rgb)
end

---@class Color
---@field hsl number[]

---@type Color
local Chroma = {}
Chroma.__index = Chroma

function Chroma.new(hex)
    local self = setmetatable({}, Chroma)
    local rgb = RGB.from_hex(hex)
    self.hsl = HSL.from_rgb(rgb)
    return self
end

---Color:to_hex
---@return string
function Chroma:hex()
    return HSL.to_hex(self.hsl)
end

--- Color method darken
---@param amount number
---@return Color
function Chroma:darken(amount)
    local hsl = self.hsl
    hsl[2] = hsl[2] - amount
    return Chroma.new(HSL.to_hex(hsl))
end

--- Color method lighten
---@param amount number
---@return Color
function Chroma:lighten(amount)
    local hsl = self.hsl
    hsl[2] = hsl[2] + amount
    return Chroma.new(HSL.to_hex(hsl))
end

--- Color method saturate
---@param amount number
---@return Color
function Chroma:saturate(amount)
    local hsl = self.hsl
    hsl[2] = hsl[2] + amount
    return Chroma.new(HSL.to_hex(hsl))
end

--- Color method desaturate
---@param amount number
---@return Color
function Chroma:desaturate(amount)
    local hsl = self.hsl
    hsl[2] = hsl[2] - amount
    return Chroma.new(HSL.to_hex(hsl))
end

function Chroma:rotate(amount)
    local hsl = self.hsl
    hsl[1] = hsl[1] + amount
    return Chroma.new(HSL.to_hex(hsl))
end

function Chroma:complement()
    local hsl = self.hsl
    hsl[1] = hsl[1] + 0.5
    return Chroma.new(HSL.to_hex(hsl))
end

function Chroma:analogous()
    local hsl = self.hsl
    local h = hsl[1]
    return {
        Chroma.new(HSL.to_hex(hsl)),
        Chroma.new(HSL.to_hex { h + 0.083, hsl[2], hsl[3] }),
        Chroma.new(HSL.to_hex { h - 0.083, hsl[2], hsl[3] }),
    }
end


return Chroma.new
