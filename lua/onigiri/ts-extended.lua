local function load()
    local nvim_set_hl = vim.api.nvim_set_hl
    local hl = {}
    hl['@markdown.marker.list'] = { link = 'markdownListMarker' }
    hl['@markdown.marker.break'] = { link = 'markdownRule' }
    -- hl['@yaml.field'] = { link = 'TSExtYamlField' }
    hl['@string.delimiter'] = { link = 'TSExtStringDelimiter' }
    hl['@generic.type'] = { link = 'TSExtGenericType' }
    hl['@markdown.marker.h'] = { link = 'markdownH1Delimiter' }
    -- hl['@markdown.marker.h2'] = { link = 'markdownH2Delimiter' }
    -- hl['@markdown.marker.h3'] = { link = 'markdownH3Delimiter' }
    -- hl['@markdown.marker.h4'] = { link = 'markdownH4Delimiter' }
    -- hl['@markdown.marker.h5'] = { link = 'markdownH5Delimiter' }
    -- hl['@markdown.marker.h6'] = { link = 'markdownH6Delimiter' }
    -- hl['@markdown.code.delimiter'] = { link = 'markdownCodeDelimiter' }
    -- hl['@markdown.link.delimiter'] = { link = 'markdownLinkDelimiter' }


    for k, v in pairs(hl) do
        nvim_set_hl(0, k, v)
    end
end

return { load = load }
