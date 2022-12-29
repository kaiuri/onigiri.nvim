--- Sets custom queries from treesitter
local function load()
  local nvim_set_hl = vim.api.nvim_set_hl
  local hl = {}

  hl['@markdown.marker.list'] = { link = 'markdownListMarker' }
  hl['@markdown.marker.break'] = { link = 'markdownRule' }
  hl['@string.delimiter'] = { link = '@string.delimiter' }
  hl['@generic.type'] = { link = '@generic.type' }
  hl['@markdown.marker.h'] = { link = 'markdownH1Delimiter' }

  for k, v in pairs(hl) do
    nvim_set_hl(0, k, v)
  end
end

return load
