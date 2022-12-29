local Theme = require 'onigiri.theme'.Theme
local config = require 'onigiri.config'

local load = function()
  if vim.g.colors_name then
    vim.cmd 'hi clear'
  end

  vim.cmd 'highlight clear'
  vim.cmd 'set t_Co=256'

  vim.g.colors_name = 'onigiri'

  local theme = Theme(config())

  ---@type fun(ns: number, group: string, hl_map: HighlightDefMap): nil
  local nvim_set_hl = vim.api.nvim_set_hl
  for group, attrs in pairs(theme) do
    nvim_set_hl(0, group, attrs)
  end

  require 'onigiri.ts-extended'()
end

return {
  load = load,
  config = config,
  chroma = require 'onigiri.chroma',
  presets = require 'onigiri.presets',
}
