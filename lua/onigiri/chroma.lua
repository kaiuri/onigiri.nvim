---This is a reduced port of the original chroma-js library, which is licensed under BSD-3-Clause.
---Requires luajit or https://bitop.luajit.org/
---Author: Uriel Caiado

local ok, bit = pcall(require, 'bit')

--- If bit library is missing, do not load module
if not ok then
    vim.notify('missing BitOp library - https://bitop.luajit.org', vim.log.levels.ERROR)
    return nil
end

---Conversion between RBG and HEX format
local RGB = {
    ---@param hex number # 0x000000, etc
    ---@return number[]  # {r, g, b}
    hex_to_rgb = function(hex)
        local r = bit.band(bit.rshift(hex, 16), 0xFF)
        local g = bit.band(bit.rshift(hex, 8), 0xFF)
        local b = bit.band(hex, 0xFF)
        return { r, g, b }
    end,

    ---@param rgb number[] # {r, g, b}
    ---@return number # 0xffffff, etc
    rgb_to_hex = function(rgb)
        local r = bit.lshift(rgb[1], 16)
        local g = bit.lshift(rgb[2], 8)
        local b = rgb[3]
        return bit.bor(r, g, b)
    end
}



RGB_test = function()
    local hex = 0xFF0000
    local rgb = RGB.hex_to_rgb(hex)
    return assert(hex == RGB.rgb_to_hex(rgb), 'hex_to_rgb: failed')
        and true
        or false
end

---Conversion between HSL and HEX format
local HSL = {}

--- hex to hsl
---@param hex number
---@return number[]
HSL.hex_to_hsl = function(hex)
    local rgb = RGB.hex_to_rgb(hex)
    local r = rgb[1] / 255
    local g = rgb[2] / 255
    local b = rgb[3] / 255
    local max = math.max(r, g, b)
    local min = math.min(r, g, b)
    local h, s, l = 0, 0, (max + min) / 2
    if max == min then
        h = 0
        s = 0
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
local function hue_to_rgb(p, q, n)
    if n < 0 then n = n + 1 end
    if n > 1 then n = n - 1 end
    if n < 1 / 6 then return p + (q - p) * 6 * n end
    if n < 1 / 2 then return q end
    if n < 2 / 3 then return p + (q - p) * (2 / 3 - n) * 6 end
    return p
end

HSL.hsl_to_hex = function(hsl)
    local h = hsl[1]
    local s = hsl[2]
    local l = hsl[3]
    local r, g, b
    if s == 0 then
        r, g, b = l, l, l
    else
        local q = l < 0.5 and l * (1 + s) or l + s - l * s
        local p = 2 * l - q
        r = hue_to_rgb(p, q, h + 1 / 3)
        g = hue_to_rgb(p, q, h)
        b = hue_to_rgb(p, q, h - 1 / 3)
    end
    return RGB.rgb_to_hex { r * 255, g * 255, b * 255 }
end

HSL_test = function()
    local hex = 0xFF0000
    local hsl = HSL.hex_to_hsl(hex)
    return assert(hex == HSL.hsl_to_hex(hsl), 'hex_to_hsl: failed')
        and true
        or false
end

---Color operations
local OPS = {
    ---@param hex number # 0x000000, etc
    ---@param n   number # [0,1]
    darken = function(hex, n)
        local hsl = HSL.hex_to_hsl(hex)
        hsl[3]    = hsl[3] - n
        return HSL.hsl_to_hex(hsl)
    end,
    ---@param hex number # 0x000000, etc
    ---@param n   number # [0,1]
    lighten = function(hex, n)
        local hsl = HSL.hex_to_hsl(hex)
        hsl[3]    = hsl[3] + n
        return HSL.hsl_to_hex(hsl)
    end,
    ---@param hex number # 0x000000, etc
    ---@param n   number # [0,1]
    saturate = function(hex, n)
        local hsl = HSL.hex_to_hsl(hex)
        hsl[2]    = hsl[2] + n
        return HSL.hsl_to_hex(hsl)
    end,
    ---@param hex number # 0x000000, etc
    ---@param n number    # [0,1]
    desaturate = function(hex, n)
        local hsl = HSL.hex_to_hsl(hex)
        hsl[2]    = hsl[2] - n
        return HSL.hsl_to_hex(hsl)
    end,
    ---@param hex1 number # 0x000000, etc
    ---@param hex2 number # 0x000000, etc
    ---@param n    number # [0,1]
    mix = function(hex1, hex2, n)
        local hsl1 = HSL.hex_to_hsl(hex1)
        local hsl2 = HSL.hex_to_hsl(hex2)
        local h    = hsl1[1] + (hsl2[1] - hsl1[1]) * n
        local s    = hsl1[2] + (hsl2[2] - hsl1[2]) * n
        local l    = hsl1[3] + (hsl2[3] - hsl1[3]) * n
        return HSL.hsl_to_hex { h, s, l }
    end,
    ---@param hex number # 0x000000, etc
    grayscale = function(hex)
        local hsl = HSL.hex_to_hsl(hex)
        hsl[2]    = 0
        return HSL.hsl_to_hex(hsl)
    end,
    ---@param hex number # 0x000000, etc
    complement = function(hex)
        local hsl = HSL.hex_to_hsl(hex)
        hsl[1]    = hsl[1] + 0.5
        return HSL.hsl_to_hex(hsl)
    end,
    ---@param hex number # 0x000000, etc
    ---@param n   number # [0,360]
    rotate = function(hex, n)
        local hsl = HSL.hex_to_hsl(hex)
        hsl[1]    = hsl[1] + n
        return HSL.hsl_to_hex(hsl)
    end,
}

--- TODO: Write an adapter so people can use '#000000'-like format

-- only load module if we pass those tests
return RGB_test()
    and HSL_test()
    and {
        OPS = OPS,
        -- RGB = RGB,
        -- HSL = HSL,
    }
    or nil
