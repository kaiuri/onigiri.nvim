---@return FunctionalVariables
return function()
  if not vim.g.onigiri then
    vim.g.onigiri = { theme = require 'onigiri.presets.mariana' }
  end

  return vim.g.onigiri.theme
end
