local nvim_set_hl = vim.api.nvim_set_hl
local g = vim.g

local Theme = require 'onigiri.theme'.Theme
local treesitter_extended = require 'onigiri.ts-extended'

local presets = {
    mariana = require 'onigiri.presets.mariana',
}

---@return FunctionalVariables
local function config()
    vim.g.onigiri = (vim.g.onigiri ~= nil
        and vim.g.onigiri.theme ~= {})
        and vim.g.onigiri
        or { theme = presets.mariana }
    return vim.g.onigiri.theme
end

local load = function()
    if g.colors_name then vim.cmd('hi clear') end
    vim.cmd('highlight clear')
    vim.cmd('set t_Co=256')
    g.colors_name = 'onigiri'

    local theme = Theme(config())

    for group, attrs in pairs(theme) do nvim_set_hl(0, group, attrs) end

    treesitter_extended.load()

end

return {
    load    = load,
    config  = config,
    colors  = config(),
    presets = presets,
}
