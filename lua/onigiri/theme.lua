---Takes in a FunctionalVariables dictionary, outputs a colorscheme table.
local presets = require('onigiri.presets.mariana')
---@param v FunctionalVariables
---@return { [string]: HighlightDefMap }
local function Theme(v)
  v = v or presets

  ---@type {[string]: HighlightDefMap }
  local hl = {}

  hl.Normal = { fg = v.Foreground.default, bg = v.Background.default }
  hl.Visual = { bg = v.Background.muted }
  hl.NormalFloat = { bg = v.Background.emphasis }
  hl.FloatBorder = { fg = v.Foreground.surface, bg = v.Background.default }

  hl.Pmenu = { bg = v.Background.emphasis }
  hl.PmenuSel = { bg = v.Background.muted, fg = v.Foreground.emphasis, bold = false }
  hl.PmenuSbar = { bg = hl.Pmenu.bg, fg = hl.PmenuSel.bg }
  hl.PmenuThumb = { bg = hl.PmenuSel.bg }

  hl.NonText = { fg = v.Foreground.surface }
  hl.Conceal = { fg = v.Foreground.muted }

  hl.CursorLine = { bg = v.Background.muted }
  hl.CursorColumn = { link = 'CursorLine' }
  hl.ColorColumn = { link = 'CursorColumn' }
  hl.SignColumn = { fg = v.Foreground.default, bg = v.Background.default }

  hl.LineNr = { bg = v.Background.muted, fg = v.Foreground.emphasis }
  hl.LineNrAbove = { fg = v.Foreground.muted }
  hl.LineNrBelow = { fg = v.Foreground.muted }
  hl.CursorLineNr = { link = 'LineNr' }

  -- hl.DiffAdd    = { sp = v.Colors.Info, underline = true }
  hl.DiffAdd = { fg = v.Colors.Info }

  -- hl.DiffChange = { sp = v.Colors.Caution, underline = true }
  hl.DiffChange = { fg = v.Colors.Caution }

  -- hl.DiffDelete = { fg = v.Colors.Error }
  hl.DiffDelete = { fg = v.Colors.Error }

  hl.DiffText = { italic = true }

  hl.Directory = { fg = v.Colors.Hint }
  hl.EndOfBuffer = { fg = v.Foreground.surface }

  hl.Error = { fg = v.Colors.Danger, bg = v.Shade.default }
  hl.ErrorMsg = { fg = v.Colors.Error, bg = v.Shade.default }
  hl.Exception = { fg = v.Colors.Trace, bg = v.Shade.default }

  hl.Folded = { fg = v.Foreground.muted, bg = v.Shade.default }
  hl.FoldColumn = { link = 'Comment' }

  hl.ModeMsg = { fg = v.Foreground.default }
  hl.MoreMsg = { fg = v.Foreground.default, bold = true }

  hl.Question = { link = 'MoreMsg' }

  hl.Search = { fg = v.Background.emphasis, bg = v.Colors.Caution }
  hl.IncSearch = { link = 'Search' }
  hl.Substitute = { bg = v.Background.muted }

  hl.SpellBad = { sp = v.Colors.Error, undercurl = true }
  hl.SpellCap = { sp = v.Colors.Caution, undercurl = true }
  hl.SpellLocal = { sp = v.Colors.Hint, undercurl = true }
  hl.SpellRare = { sp = v.Colors.Trace, undercurl = true }

  hl.StatusLine = { fg = v.Foreground.default, bg = v.Background.muted }
  hl.StatusLineNC = { fg = v.Foreground.default, bg = v.Background.emphasis }

  hl.TabLine = { fg = v.Foreground.default, bg = v.Background.muted }
  hl.TabLineFill = { fg = v.Foreground.default, bg = v.Background.muted }
  hl.TabLineSel = { fg = v.Foreground.default, bg = v.Background.default }

  hl.WarningMsg = { link = 'ErrorMsg' }

  hl.WildMenu = { link = 'Pmenu' }

  hl.Winseparator = { fg = v.Foreground.surface }
  hl.VertSplit = { link = 'Winseparator' }

  hl.MatchParen = { bg = v.Shade.default, bold = true }

  hl.DiagnosticError = { fg = v.Colors.Error, bg = 'NONE' }
  hl.DiagnosticSignError = { fg = hl.DiagnosticError.fg, bold = true, bg = 'NONE' }
  hl.DiagnosticUnderlineError = { sp = hl.DiagnosticError.fg, undercurl = true, bg = 'NONE' }
  hl.DiagnosticVirtualTextError = { fg = hl.DiagnosticError.fg, bg = 'NONE' }
  hl.DiagnosticHint = { fg = v.Colors.Hint, bg = 'NONE' }
  hl.DiagnosticSignHint = { fg = hl.DiagnosticHint.fg, bold = true, bg = 'NONE' }
  hl.DiagnosticUnderlineHint = { sp = hl.DiagnosticHint.fg, undercurl = true, bg = 'NONE' }
  hl.DiagnosticVirtualTextHint = { fg = hl.DiagnosticHint.fg, bg = 'NONE' }
  hl.DiagnosticInfo = { fg = v.Colors.Info, bg = 'NONE' }
  hl.DiagnosticSignInfo = { fg = hl.DiagnosticInfo.fg, bold = true, bg = 'NONE' }
  hl.DiagnosticUnderlineInfo = { sp = hl.DiagnosticInfo.fg, undercurl = true, bg = 'NONE' }
  hl.DiagnosticVirtualTextInfo = { fg = hl.DiagnosticInfo.fg, bg = 'NONE' }
  hl.DiagnosticWarn = { fg = v.Colors.Caution, bg = 'NONE' }
  hl.DiagnosticSignWarn = { fg = hl.DiagnosticWarn.fg, bold = true, bg = 'NONE' }
  hl.DiagnosticUnderlineWarn = { sp = hl.DiagnosticWarn.fg, undercurl = true, bg = 'NONE' }
  hl.DiagnosticVirtualTextWarn = { fg = hl.DiagnosticWarn.fg, bg = 'NONE' }


  hl.Boolean = { fg = v.Colors.Error, italic = true, }
  hl.Character = { fg = v.Colors.Info }
  hl.Comment = { fg = v.Foreground.muted }
  hl.SpecialComment = { link = 'Comment' }
  hl.Conditional = { fg = v.Colors.Trace }
  hl.Constant = { fg = v.Foreground.emphasis }
  hl.Define = { fg = v.Colors.Trace, italic = true, }
  hl.Delimiter = { fg = v.Foreground.muted }
  hl.Float = { fg = v.Colors.Important }
  hl.Function = { fg = v.Colors.Hint }
  hl.Identifier = { fg = v.Foreground.default }
  hl.Include = { fg = v.Colors.Error }
  hl.Keyword = { fg = v.Colors.Trace, italic = true }
  hl.Label = { fg = v.Colors.Trace }
  hl.Macro = { fg = v.Colors.Hint }
  hl.Number = { fg = v.Colors.Caution }
  hl.Operator = { fg = v.Colors.Danger }
  hl.PreCondit = { fg = v.Colors.Error }
  hl.PreProc = { fg = v.Colors.Hint }
  hl.Repeat = { fg = v.Colors.Trace }
  hl.Special = { fg = v.Colors.Hint }
  hl.SpecialChar = { fg = v.Colors.Hint }
  hl.SpecialKey = { fg = v.Colors.Hint }
  hl.Statement = { fg = v.Colors.Trace }
  hl.StorageClass = { fg = v.Colors.Error }
  hl.String = { fg = v.Colors.Info }
  hl.Struct = { fg = v.Colors.Error }
  hl.Structure = { fg = v.Colors.Caution }
  hl.Tag = { fg = v.Colors.Error }
  hl.Title = { fg = v.Foreground.default, bold = true }
  hl.Todo = { fg = v.Colors.Note, bold = true }
  hl.Type = { fg = v.Colors.Caution }
  hl.Typedef = { fg = v.Colors.Error }
  hl.Underlined = { underdotted = true }
  hl.Whitespace = { fg = v.Foreground.surface }

  hl['@boolean'] = { link = 'Boolean' }
  hl['@character'] = { fg = v.Colors.Info }
  hl['@character.special'] = { link = 'SpecialChar' }

  hl['@comment'] = { fg = v.Foreground.muted }

  hl['@constant'] = { link = 'Constant' }
  hl['@constant.builtin'] = { fg = v.Colors.Error, italic = true }
  hl['@constant.builtin.python'] = { fg = v.Colors.Note, italic = true }
  hl['@constant.builtin.rust'] = { fg = v.Colors.Note, italic = true }
  hl['@constant.macro'] = { fg = v.Colors.Trace, italic = true }

  hl['@constructor.typescript'] = { fg = v.Colors.Caution }
  hl['@constructor.lua'] = { fg = v.Foreground.emphasis }
  hl['@enum'] = { fg = v.Colors.Caution }

  hl['@field'] = { fg = v.Colors.Accent }
  hl['@field.toml'] = { fg = v.Colors.Error }
  hl['@field.yaml'] = { fg = v.Colors.Hint }

  hl['@function'] = { link = 'Function' }
  hl['@function.css'] = { fg = v.Colors.Note }
  hl['@function.builtin'] = { fg = v.Colors.Note, italic = true }
  hl['@function.call'] = { fg = v.Colors.Note }
  hl['@function.macro'] = { fg = v.Colors.Note }
  hl['@function.macro.commonlisp'] = { fg = v.Colors.Error }

  hl['@preproc'] = { fg = v.Colors.Hint }
  hl['@interface'] = { fg = v.Colors.Caution }

  hl['@conditional'] = { fg = v.Colors.Trace }

  hl['@keyword'] = { fg = v.Colors.Trace, italic = true }
  -- hl['@keyword.jsdoc'] = { fg = v.Colors.Trace }
  -- hl['@keyword.css'] = { fg = v.Colors.Trace }
  -- hl['@keyword.rust'] = { fg = v.Colors.Trace }

  hl['@include'] = { fg = v.Colors.Trace }
  hl['@keyword.function'] = { fg = v.Colors.Trace, italic = true }
  hl['@keyword.operator'] = { fg = v.Colors.Danger }
  hl['@keyword.return'] = { fg = v.Colors.Trace }

  hl['@label'] = { fg = v.Colors.Hint }
  hl['@label.json'] = { fg = v.Colors.Hint }
  hl['@label.toml'] = { fg = v.Colors.Hint }

  hl['@method'] = { fg = v.Colors.Hint }
  hl['@method.call'] = { fg = v.Colors.Note }

  hl['@namespace'] = { fg = v.Colors.Caution }

  hl['@float'] = { link = 'Float' }
  hl['@number'] = { link = 'Number' }
  hl['@number.bash'] = { fg = v.Colors.Caution }

  hl['@operator'] = { link = 'Operator' }
  hl['@parameter'] = { fg = v.Foreground.default }
  hl['@parameter.bash'] = { fg = v.Foreground.default }
  hl['@parameter.reference'] = { fg = v.Foreground.default }

  hl['@property'] = { fg = v.Colors.Accent }
  hl['@property.toml'] = { fg = v.Colors.Hint }

  hl['@punctuation.bracket'] = { fg = v.Foreground.emphasis }
  hl['@punctuation.delimiter'] = { link = 'Delimiter' }
  hl['@punctuation.delimiter.python'] = { fg = v.Foreground.emphasis }
  hl['@punctuation.delimiter.yaml'] = { fg = v.Colors.Note }
  hl['@punctuation.special'] = { fg = v.Colors.Hint }
  hl['@punctuation.special.markdown'] = { fg = v.Colors.Danger, bold = false }

  hl['@repeat'] = { fg = v.Colors.Trace }
  hl['@repeat.python'] = { fg = v.Colors.Error }

  hl['@string'] = { fg = v.Colors.Info }
  hl['@string.escape'] = { link = 'SpecialChar' }
  hl['@string.regex'] = { fg = v.Colors.Hint }
  hl['@string.special'] = { link = 'SpecialChar' }

  hl['@symbol'] = { fg = v.Colors.Hint }

  hl['@tag'] = { link = 'Tag' }
  hl['@tag.rust'] = { fg = v.Colors.Hint }
  hl['@tag.attribute'] = { fg = v.Colors.Trace }
  hl['@tag.delimiter'] = { fg = v.Colors.Hint }
  hl['@tag.delimiter.markdown'] = { fg = v.Colors.Note }
  hl['@tag.delimiter.markdown_inline'] = { fg = v.Colors.Note }

  hl['@text'] = { fg = v.Foreground.default }
  hl['@text.emphasis'] = { italic = true, bold = true }
  hl['@text.literal'] = { fg = v.Colors.Info, italic = true }
  hl['@text.reference'] = { fg = v.Colors.Hint, underdotted = false }
  hl['@text.strong'] = { bold = true }
  hl['@text.title'] = { fg = v.Foreground.default, bold = true }
  hl['@text.underline'] = { underline = true }
  hl['@text.uri'] = { fg = v.Colors.Note, underdotted = true }

  hl['@type'] = { fg = v.Colors.Caution }
  hl['@type.builtin'] = { fg = v.Colors.Note, italic = true }
  hl['@type.qualifier'] = { fg = v.Colors.Error }
  hl['@storageclass'] = { fg = v.Colors.Error }
  hl['@storageclass.lifetime'] = { fg = v.Colors.Hint }

  hl['@variable'] = { fg = v.Foreground.default }
  hl['@variable.builtin'] = { fg = v.Foreground.default, italic = true }
  hl['@variable.builtin.clojure'] = { fg = v.Foreground.default, italic = true }
  hl['@variable.builtin.javascript'] = { fg = v.Foreground.default, italic = true }


  hl.gitCommitSelectedFile = { italic = true }
  hl.gitCommitSummary = { bold = true }
  hl.gitCommitTrailerToken = { fg = v.Colors.Trace, italic = true }
  hl.gitconfigVariable = { link = '@field' }

  hl.healthHelp = { fg = v.Colors.Important }
  hl.healthSuccess = { fg = v.Colors.Info }

  hl.markdownRule = { fg = v.Colors.Error }
  hl.markdownLinkText = { fg = v.Foreground.default }
  hl.markdownUrl = { fg = v.Colors.Note, underline = true }
  hl.markdownLinkDelimiter = { fg = v.Colors.Hint }
  hl.markdownH1Delimiter = { fg = v.Colors.Danger, bold = false }
  hl.markdownH2Delimiter = { fg = v.Colors.Danger, bold = false }
  hl.markdownCode = { bg = v.Background.muted }
  hl.markdownCodeDelimiter = { fg = v.Colors.Note }
  hl.markdownListMarker = { fg = v.Colors.Important }

  hl.htmlTagName = { link = 'Tag' }

  hl.qfFileName = { fg = v.Colors.Hint }
  hl.qfLineNr = { bold = true }

  --- tmux
  hl.tmuxCommands = { fg = v.Colors.Trace }
  hl.tmuxFlags = { fg = v.Colors.Caution }
  hl.tmuxFormatString = { fg = v.Colors.Hint }

  hl.javaScriptReserved = { fg = v.Colors.Error }

  --- Fennel
  hl.FennelStringDelimiter = { fg = v.Colors.Hint }
  hl.FennelParen = { fg = v.Foreground.emphasis }
  hl.FennelSpecialForm = { fg = v.Colors.Trace, italic = true }
  hl.FennelKeyword = { fg = v.Colors.Error }

  --- Help
  hl.helpHyperTextEntry = { link = 'TSURI' }
  hl.helpSectionDelim = { fg = v.Colors.Error, bold = true }
  hl.helpHyperTextJump = { fg = v.Colors.Note, underdotted = true }
  hl.helpHeader = { link = 'Title' }
  hl.helpExample = { fg = v.Colors.Info }
  hl.helpURL = { fg = v.Colors.Note, underline = true }
  hl.helpCommand = { bg = v.Foreground.surface }

  --- rainbow parenthesis
  hl.rainbowcol1 = { fg = v.Foreground.default }
  hl.rainbowcol2 = { fg = v.Colors.Trace }
  hl.rainbowcol3 = { fg = v.Colors.Info }
  hl.rainbowcol4 = { fg = v.Colors.Error }
  hl.rainbowcol5 = { fg = v.Colors.Hint }
  hl.rainbowcol6 = { fg = v.Colors.Important }
  hl.rainbowcol7 = { fg = v.Colors.Warn }

  hl.IndentBlanklineContextChar = { fg = v.Foreground.muted, bg = 'NONE' }
  hl.IndentBlanklineContextStart = { sp = v.Foreground.muted, underdotted = true }
  hl.IndentBlanklineSpaceCharBlankline = { link = 'NonText' }
  hl.IndentBlanklineSpaceChar = { link = 'NonText' }

  hl.CmpItemAbbrDeprecated = { strikethrough = true }
  hl.CmpItemKindStruct = { fg = v.Colors.Caution }
  hl.CmpItemKindFunction = { fg = v.Colors.Note }
  hl.CmpItemKindText = { fg = v.Foreground.default }
  hl.CmpItemKindClass = { fg = v.Colors.Caution }
  hl.CmpItemKindValue = { fg = v.Colors.Danger }
  hl.CmpItemKindEnum = { fg = v.Colors.Caution }
  hl.CmpItemKindInterface = { fg = v.Colors.Caution }
  hl.CmpItemKindMethod = { fg = v.Colors.Hint }
  hl.CmpItemKindUnit = { fg = v.Colors.Error }
  hl.CmpItemKindConstant = { fg = v.Foreground.emphasis }
  hl.CmpItemKindField = { fg = v.Colors.Note }
  hl.CmpItemKindModule = { fg = v.Colors.Caution }
  hl.CmpItemKindKeyword = { fg = v.Colors.Trace }
  hl.CmpItemKindEnumMember = { fg = v.Colors.Accent }
  hl.CmpItemKindProperty = { fg = v.Colors.Note }
  hl.CmpItemKindOperator = { fg = v.Colors.Danger }
  hl.CmpItemKindReference = { fg = v.Foreground.default }
  hl.CmpItemKindSnippet = { fg = v.Foreground.emphasis }
  hl.CmpItemKindTypeParameter = { fg = v.Colors.Caution }
  hl.CmpItemKindVariable = { fg = v.Foreground.default }

  hl.LeapMatch = { fg = v.Background.emphasis, bg = v.Colors.Danger, bold = true }
  hl.LeapLabelPrimary = { fg = v.Background.emphasis, bg = v.Colors.Caution, bold = true }
  hl.LeapLabelSecondary = { fg = v.Background.emphasis, bg = v.Colors.Warn, bold = true }
  hl.LeapLabelSelected = { fg = v.Background.emphasis, bg = v.Colors.Important, bold = true }
  hl.LeapBackdrop = { fg = 'NONE', bg = v.Background.emphasis }

  hl.Sneak = { fg = v.Background.emphasis, bg = v.Colors.Caution, bold = true }
  hl.SneakLabel = { fg = v.Background.emphasis, bg = v.Colors.Caution, bold = true }

  hl.GitSignsDelete = { fg = v.Colors.Error }
  hl.GitSignsChange = { fg = v.Colors.Caution }
  hl.GitSignsAdd = { fg = v.Colors.Info }

  hl.packerHash = { fg = v.Colors.Error }
  hl.packerString = { fg = v.Colors.Info }
  hl.packerStatusSuccess = { fg = v.Colors.Info }

  hl.LspReferenceText = { bg = v.Background.emphasis }
  hl.LspReferenceRead = { bg = v.Background.emphasis }
  hl.LspReferenceWrite = { bg = v.Background.emphasis }

  hl.TelescopeBorder = { fg = v.Foreground.surface }
  hl.TelescopeTitle = { fg = v.Foreground.default, bold = true }
  hl.TelescopePromptCounter = { fg = v.Foreground.default }
  hl.TelescopeMatching = { bg = v.Background.default }
  hl.TelescopeSelectionCaret = { fg = v.Foreground.default }
  hl.TelescopeSelection = { bg = v.Background.muted }

  hl.FloatTitle = { fg = v.Foreground.muted }

  hl.FocusedSymbol = { bg = v.Background.muted }
  hl.TroubleIndent = { bg = v.Background.default }
  hl.TroubleLocation = { bold = true }

  hl.NvimTreeNormal = { fg = v.Foreground.default, bg = v.Shade.default }
  hl.NvimTreeRootFolder = { fg = v.Foreground.default, bg = v.Shade.default }
  hl.NvimTreeIndentMarker = { fg = v.Foreground.muted, bg = v.Shade.default }
  hl.NvimTreeOpenedFolderName = { underdotted = true }
  hl.NvimTreeOpenedFile = { bg = v.Background.muted }
  hl.NvimTreeFolderName = { fg = v.Foreground.default, bg = v.Shade.default }
  hl.NvimTreeEmptyFolderName = { link = 'Comment' }
  hl.NvimTreeFolderIcon = { fg = v.Foreground.muted }
  hl.NvimTreeExecFile = { fg = v.Colors.Info, bold = true, bg = v.Shade.default }
  hl.NvimTreeFileDeleted = { link = 'Comment' }
  hl.NvimTreeFileNew = { fg = v.Background.emphasis, bg = v.Shade.default }
  hl.NvimTreeSpecialFile = { fg = v.Foreground.default, bg = v.Shade.default }
  hl.NvimTreeGitDirty = { fg = v.Colors.Error, bg = v.Shade.default }
  hl.NvimTreeGitStaged = { fg = v.Colors.Info, bg = v.Shade.default }
  hl.NvimTreeGitRenamed = { fg = v.Colors.Caution, bg = v.Shade.default }
  hl.NvimTreeGitDeleted = { fg = v.Colors.Error, bg = v.Shade.default }
  hl.NvimTreeSymlink = { fg = v.Colors.Hint, bg = v.Shade.default }

  hl.NotifyERRORBorder = { fg = hl.DiagnosticError.fg }
  hl.NotifyWARNBorder = { fg = hl.DiagnosticWarn.fg }
  hl.NotifyINFOBorder = { fg = hl.DiagnosticInfo.fg }
  hl.NotifyDEBUGBorder = { fg = v.Colors.Danger }
  hl.NotifyTRACEBorder = { fg = v.Colors.Trace }
  hl.NotifyERRORIcon = { fg = hl.DiagnosticError.fg }
  hl.NotifyWARNIcon = { fg = hl.DiagnosticWarn.fg }
  hl.NotifyINFOIcon = { fg = hl.DiagnosticInfo.fg }
  hl.NotifyDEBUGIcon = { fg = v.Colors.Danger }
  hl.NotifyTRACEIcon = { fg = v.Colors.Trace }
  hl.NotifyERRORTitle = { fg = hl.DiagnosticError.fg, bold = true }
  hl.NotifyWARNTitle = { fg = hl.DiagnosticWarn.fg, bold = true }
  hl.NotifyINFOTitle = { fg = hl.DiagnosticInfo.fg, bold = true }
  hl.NotifyDEBUGTitle = { fg = v.Colors.Danger, bold = true }
  hl.NotifyTRACETitle = { fg = v.Colors.Trace, bold = true }
  hl.NotifyERRORBody = { fg = v.Foreground.default }
  hl.NotifyWARNBody = { fg = v.Foreground.default }
  hl.NotifyINFOBody = { fg = v.Foreground.default }
  hl.NotifyDEBUGBody = { fg = v.Foreground.default }
  hl.NotifyTRACEBody = { fg = v.Foreground.default }

  hl.DevIconGitAttributes = { fg = v.Colors.Hint }
  hl.DevIconGitCommit = { fg = v.Colors.Error }
  hl.DevIconGitConfig = { fg = v.Colors.Hint }
  hl.DevIconGitIgnore = { fg = v.Colors.Error }
  hl.DevIconGitModules = { fg = v.Colors.Hint }
  hl.DevIconDropbox = { fg = v.Colors.Note }
  hl.DevIconToml = { fg = v.Colors.Hint }
  hl.DevIconYaml = { link = 'DevIconToml' }
  hl.DevIconJson = { fg = v.Colors.Caution }
  hl.DevIconYml = { link = 'DevIconToml' }
  hl.DevIconMd = { fg = v.Foreground.emphasis }
  hl.DevIconGo = { fg = v.Colors.Note }
  hl.DevIconTs = { fg = v.Colors.Note }
  hl.DevIconTsx = { fg = v.Colors.Note }
  hl.DevIconDsStore = { fg = v.Foreground.muted }
  hl.DevIconDockerfile = { fg = v.Colors.Note }
  hl.DevIconScheme = { fg = v.Foreground.emphasis }

  --- TODO: Finish associating
  hl.LspClass = { link = '@type' }
  hl.LspEnum = { link = '@type' }
  hl.LspEnumMember = { link = '@field' }
  hl.LspFunction = { fg = v.Colors.Hint }
  hl.LspInterface = { link = '@type' }
  hl.LspKeyword = { fg = v.Colors.Danger }
  hl.LspMacro = { link = 'Macro' }
  hl.LspMethod = { fg = v.Colors.Hint }
  hl.LspNamespace = { link = '@namespace' }
  hl.LspNumber = { link = 'Number' }
  hl.LspParameter = { link = '@parameter' }
  hl.LspProperty = { link = '@property' }
  hl.LspString = { fg = v.Colors.Info }
  hl.LspStruct = { link = '@type' }
  hl.LspType = { link = '@type' }
  hl.LspTypeParameter = { link = '@type' }
  -- hl.LspAbstract = {}
  -- hl.LspAsync = { bold = true }
  -- hl.LspDeclaration = { link = 'TSType' }
  -- hl.LspDefinition  = {}
  -- hl.LspDocumentation = {}
  -- hl.LspModification  = {}
  -- hl.LspModifier   = {}
  -- hl.LspComment = { fg = v.Foreground.muted, bg = v.Shade.default }
  -- hl.LspDefaultLibrary = { link = 'TSNamespace' }
  -- hl.LspDeprecated = { strikethrough = true }
  -- hl.LspEvent   = {}
  -- hl.LspOperator = { link = 'TSOperator' }
  -- hl.LspReadonly = { italic = true }
  -- hl.LspRegexp = { fg = v.Colors.Hint, bg = v.Shade.default }
  -- hl.LspStatic = { italic = true }
  -- hl.LspVariable = { link = '@variable' }

  --- FzfLua
  hl.FzfLuaNormal = { fg = v.Foreground.default, bg = v.Background.default }
  hl.FzfLuaBorder = { fg = v.Foreground.surface, bg = v.Background.default }
  hl.FzfLuaCursor = { fg = v.Foreground.default, bg = v.Background.default }
  hl.FzfLuaSearch = { link = 'Search' }
  hl.FzfLuaTitle = { fg = v.Foreground.default, bold = true }
  hl.FzfLuaCursorLine = { link = 'CursorLine' }
  hl.FzfLuaCursorLineNr = { link = 'CursorLineNr' }

  hl.dosiniLabel = { fg = v.Colors.Hint }
  hl.dosiniHeader = { fg = v.Colors.Error }

  hl.CopilotSuggestion = { bg = v.Shade.emphasis, fg = v.Foreground.muted }
  hl.NoiceCursor = { fg = v.Foreground.default }


  --- coc.nvim
  hl.CocCodeLens = { fg = v.Foreground.muted, bg = v.Shade.default }
  hl.CocDisabled = { fg = v.Foreground.muted, bg = v.Shade.default }

  hl.CocFloatActive = { link = 'PmenuSel' }
  hl.CocFloatDividin = { link = 'Winseparator' }
  hl.CocFloatSbar = { link = 'PmenuSbar' }
  hl.CocFloatThumb = { link = 'PmenuThumb' }
  hl.CocFloating = { link = 'NormalFloat' }
  -- hl.CocFadeOut = { link = 'Comment' }
  hl.CocPumVirtualText = { link = 'Comment' }

  hl.CocHighlightRead  = { underline = true, sp = v.Foreground.muted, bg = v.Background.emphasis }
  hl.CocHighlightText  = { underline = true, sp = v.Foreground.muted, bg = v.Background.emphasis }
  hl.CocHighlightWrite = { underline = true, sp = v.Foreground.muted, bg = v.Background.emphasis }

  hl.CocHintFloat = { link = 'NormalFloat' }
  hl.CocInlayHint = { fg = v.Foreground.muted, bg = v.Shade.default }
  hl.CocHoverRange = { bg = v.Background.emphasis }
  hl.CocInlayHintType = { fg = v.Foreground.muted, bg = v.Shade.default }
  hl.CocInlayHintParameter = { fg = v.Foreground.muted, bg = v.Shade.default }

  -- coc-lists
  hl.CocListLine = { link = 'PmenuSel' }
  hl.CocListPath = { fg = v.Foreground.default }
  hl.CocListMode = { fg = v.Foreground.default }
  hl.CocListsDesc = { fg = v.Foreground.default }

  hl.CocListFgGreen = { fg = v.Colors.Info }
  hl.CocListFgRed = { fg = v.Colors.Error }
  hl.CocListFgBlue = { fg = v.Colors.Note }
  hl.CocListFgCyan = { fg = v.Colors.Hint }
  hl.CocListFgGrey = { fg = v.Foreground.muted }
  hl.CocListFgWhite = { fg = v.Foreground.emphasis }
  hl.CocListFgYellow = { fg = v.Colors.Caution }
  hl.CocListFgMagenta = { fg = v.Colors.Trace }
  hl.CocListBgGreen = { bg = v.Colors.Info }
  hl.CocListBgRed = { bg = v.Colors.Error }
  hl.CocListBgBlue = { bg = v.Colors.Note }
  hl.CocListBgCyan = { bg = v.Colors.Hint }
  hl.CocListBgGrey = { bg = v.Foreground.muted }
  hl.CocListBgWhite = { bg = v.Foreground.emphasis }
  hl.CocListBgYellow = { bg = v.Colors.Caution }
  hl.CocListBgMagenta = { bg = v.Colors.Trace }
  -- hl.CocListBgBlack = { bg = v.Shade.emphasis }

  --- coc-semantic-tokens
  --- token-types

  hl.CocSemType = { fg = v.Colors.Caution }
  hl.CocSemDecorator = { fg = v.Colors.Trace }
  hl.CocSemEnumMember = { fg = v.Colors.Accent }
  hl.CocSemMacro = { fg = v.Colors.Note }
  hl.CocSemMethod = { fg = v.Colors.Hint }
  hl.CocSemNamespace = { fg = v.Colors.Caution }
  hl.CocSemProperty = { fg = v.Colors.Accent }
  hl.CocSemRegexp = { fg = v.Colors.Hint }
  hl.CocSemModifier = { fg = v.Colors.Error }
  hl.CocSemStruct = { fg = v.Colors.Caution }
  hl.CocSemTypeParameter = { fg = v.Colors.Caution }
  hl.CocSemVariable = { fg = v.Foreground.default }
  hl.CocSemFunction = { fg = v.Colors.Note }
  hl.CocSemMacroBang = { fg = v.Colors.Danger }
  hl.CocSemFormatSpecifier = { fg = v.Colors.Hint }
  hl.CocSemBuiltinAttribute = { fg = v.Colors.Trace }
  hl.CocSemColon = { fg = v.Colors.Error }
  hl.CocSemAngle = { fg = v.Colors.Danger }
  hl.CocSemCharacter = { fg = v.Colors.Info }

  --- token-modifiers

  hl.CocSemCallableVariable = { fg = v.Colors.Note }
  hl.CocSemDeclarationFunction = { fg = v.Colors.Hint }
  hl.CocSemDeclarationMethod = { fg = v.Colors.Hint }
  hl.CocSemDeclarationSelfKeyword = { fg = v.Colors.Error }

  hl.CocSemDefaultLibrary = { italic = true }
  -- hl.CocSemDefaultLibraryFunction = { fg = v.Colors.Note, italic = true }
  -- hl.CocSemDefaultLibraryMethod = { fg = v.Colors.Hint, italic = true }
  -- hl.CocSemDefaultLibraryNamespace = { fg = v.Colors.Caution, italic = true }
  -- hl.CocSemDefaultLibraryStruct = { fg = v.Colors.Note, italic = true }
  -- hl.CocSemDefaultLibraryType = { link = '@type.builtin' }
  -- hl.CocSemDefaultLibraryTypeParameter = { fg = v.Colors.Note, italic = true }
  -- hl.CocSemDefaultLibraryVariable = { fg = v.Foreground.default, italic = true }

  hl.CocSemDocumentationKeyword = { fg = v.Colors.Error }
  hl.CocSemDocumentationString = { link = 'CocSemString' }
  hl.CocSemDocumentationType = { link = 'CocSemType' }
  hl.CocSemDocumentationDecorator = { link = 'CocSemDecorator' }
  hl.CocSemDocumentationEnumMember = { link = 'CocSemEnumMember' }
  hl.CocSemDocumentationMacro = { link = 'CocSemMacro' }
  hl.CocSemDocumentationMethod = { link = 'CocSemMethod' }
  hl.CocSemDocumentationNamespace = { link = 'CocSemNamespace' }
  hl.CocSemDocumentationProperty = { link = 'CocSemProperty' }
  hl.CocSemDocumentationRegexp = { link = 'CocSemRegexp' }
  hl.CocSemDocumentationModifier = { link = 'CocSemModifier' }
  hl.CocSemDocumentationStruct = { link = 'CocSemStruct' }
  hl.CocSemDocumentationTypeParameter = { link = 'CocSemTypeParameter' }
  hl.CocSemDocumentationVariable = { link = 'CocSemVariable' }
  hl.CocSemDocumentationFunction = { link = 'CocSemFunction' }
  hl.CocSemDocumentationMacroBang = { link = 'CocSemMacroBang' }

  hl.CocSemReadonlyVariable = { fg = v.Foreground.emphasis }
  hl.CocSemReferenceMethod = { fg = v.Colors.Note }
  hl.CocSemStaticVariable = { fg = v.Foreground.emphasis }

  --- coc-symbols
  hl.CocSymbolEnum = { fg = v.Colors.Caution }
  hl.CocSymbolStruct = { fg = v.Colors.Caution }
  hl.CocSymbolText = { fg = v.Foreground.default }
  hl.CocSymbolField = { fg = v.Colors.Accent }
  hl.CocSymbolProperty = { fg = v.Colors.Accent }
  hl.CocSymbolEnumMember = { fg = v.Colors.Accent }

  hl['@string.delimiter'] = { fg = v.Colors.Note } -- extra highlight

  return hl
end

return { Theme = Theme }
