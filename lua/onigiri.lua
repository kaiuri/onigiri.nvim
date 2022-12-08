local vim_g = vim.g
-- local Theme = require 'onigiri.theme'.Theme
local ConfigBuilder = require 'onigiri.Config'.ConfigBuilder


-- local ConfigBuilder = require 'onigiri.config'.ConfigBuilder
-- local ts_extended = require 'onigiri.ts-extended'

local presets = {
  mariana = require 'onigiri.presets.mariana',
}

---@return FunctionalVariables
local function config()
  return ConfigBuilder().theme
end

local load = function()

  if vim_g.colors_name then vim.cmd('hi clear') end

  vim.cmd('highlight clear')
  vim.cmd('set t_Co=256')

  vim_g.colors_name = 'onigiri'

  ConfigBuilder().load()

end

return {
  load = load,
  config = config,
  colors = config(),
  presets = presets,
}
