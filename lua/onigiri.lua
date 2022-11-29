local vim_g = vim.g
local Theme = require 'onigiri.theme'.Theme
local ts_extended = require 'onigiri.ts-extended'

local presets = {
    mariana = require 'onigiri.presets.mariana',
}

---@return FunctionalVariables
local function config()
    if not vim.g.onigiri then
        vim.g.onigiri = {
            theme = presets.mariana
        }
    end

    return vim.g.onigiri.theme
end

local load = function()

    if vim_g.colors_name then vim.cmd('hi clear') end

    vim.cmd('highlight clear')
    vim.cmd('set t_Co=256')

    vim_g.colors_name = 'onigiri'
    local cfg = config()

    local theme = Theme(cfg)

    ---@type fun(ns: number, group: string, hl_map: HighlightDefMap): nil
    local nvim_set_hl = vim.api.nvim_set_hl
    for group, attrs in pairs(theme) do
        nvim_set_hl(0, group, attrs)
    end

    ts_extended.load(cfg)

end

return {
    load = load,
    config = config,
    colors = config(),
    presets = presets,
}
