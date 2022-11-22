--- Sets custom queries from treesitter
---@param config FunctionalVariables
local function load(config)
    local nvim_set_hl = vim.api.nvim_set_hl
    local hl = {}

    hl['@markdown.marker.list'] = { link = 'markdownListMarker' }
    hl['@markdown.marker.break'] = { link = 'markdownRule' }
    hl['@string.delimiter'] = { link = '@string.delimiter' }
    hl['@generic.type'] = { link = '@generic.type' }
    hl['@markdown.marker.h'] = { link = 'markdownH1Delimiter' }
    hl['@storage.class'] = { fg = config.Colors.Error, default = true }

    for k, v in pairs(hl) do
        nvim_set_hl(0, k, v)
    end
end

return { load = load }
