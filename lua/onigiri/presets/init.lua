local __presets = {
  'mariana',
  'gruvbox',
  'kaolin',
  'solarized',
  'moonlight',
}
local presets_mt = {
  __index = function(_, key)
    return require('onigiri.presets.' .. key)
  end,
  __newindex = function()
    error('Cannot add new presets')
  end,
  __tostring = function()
    return table.concat(__presets, '\n')
  end,
}

local presets = setmetatable(__presets, presets_mt)

return presets
