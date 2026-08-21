-- Matches ~/.config/kitty/kitty-themes/themes/Grape.conf
if vim.g.colors_name then
  vim.cmd("highlight clear")
end
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "grape"

local c = {
  bg = "#161423",
  fg = "#9e9ea0",
  cursor = "#a188f7",
  sel_bg = "#483d70",
  sel_fg = "#161423",
  black = "#2d283e",
  br_black = "#58506a",
  red = "#ec2160",
  br_red = "#f0719a",
  green = "#1fa91b",
  br_green = "#52a95d",
  yellow = "#8ddc1f",
  br_yellow = "#b2dc87",
  blue = "#487cf4",
  br_blue = "#a9bbeb",
  magenta = "#8c35c8",
  br_magenta = "#ac81c1",
  cyan = "#3added",
  br_cyan = "#9ce3ea",
  white = "#9e9ea0",
  br_white = "#a188f7",
  line = "#1e1b30",
  none = "NONE",
}

vim.g.terminal_color_0 = c.black
vim.g.terminal_color_1 = c.red
vim.g.terminal_color_2 = c.green
vim.g.terminal_color_3 = c.yellow
vim.g.terminal_color_4 = c.blue
vim.g.terminal_color_5 = c.magenta
vim.g.terminal_color_6 = c.cyan
vim.g.terminal_color_7 = c.white
vim.g.terminal_color_8 = c.br_black
vim.g.terminal_color_9 = c.br_red
vim.g.terminal_color_10 = c.br_green
vim.g.terminal_color_11 = c.br_yellow
vim.g.terminal_color_12 = c.br_blue
vim.g.terminal_color_13 = c.br_magenta
vim.g.terminal_color_14 = c.br_cyan
vim.g.terminal_color_15 = c.br_white

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local function link(from, to)
  vim.api.nvim_set_hl(0, from, { link = to })
end

-- UI
hl("Normal", { fg = c.fg, bg = c.bg })
hl("NormalNC", { fg = c.fg, bg = c.bg })
hl("NormalFloat", { fg = c.fg, bg = c.black })
hl("FloatBorder", { fg = c.br_black, bg = c.black })
hl("FloatTitle", { fg = c.cursor, bg = c.black, bold = true })
hl("Cursor", { fg = c.bg, bg = c.cursor })
hl("lCursor", { fg = c.bg, bg = c.cursor })
hl("TermCursor", { fg = c.bg, bg = c.cursor })
hl("CursorLine", { bg = c.line })
hl("CursorColumn", { bg = c.line })
hl("CursorLineNr", { fg = c.cursor, bg = c.line, bold = true })
hl("LineNr", { fg = c.br_black })
hl("SignColumn", { fg = c.br_black, bg = c.bg })
hl("FoldColumn", { fg = c.br_black, bg = c.bg })
hl("Folded", { fg = c.br_magenta, bg = c.black })
hl("ColorColumn", { bg = c.black })
hl("Conceal", { fg = c.br_black })
hl("EndOfBuffer", { fg = c.bg })
hl("NonText", { fg = c.black })
hl("SpecialKey", { fg = c.black })
hl("Whitespace", { fg = c.black })
hl("Visual", { fg = c.sel_fg, bg = c.sel_bg })
hl("VisualNOS", { fg = c.sel_fg, bg = c.sel_bg })
hl("Search", { fg = c.bg, bg = c.br_yellow })
hl("IncSearch", { fg = c.bg, bg = c.cursor })
hl("CurSearch", { fg = c.bg, bg = c.cursor })
hl("Substitute", { fg = c.bg, bg = c.red })
hl("MatchParen", { fg = c.cursor, bold = true, underline = true })
hl("WinSeparator", { fg = c.black })
link("VertSplit", "WinSeparator")
hl("StatusLine", { fg = c.fg, bg = c.black })
hl("StatusLineNC", { fg = c.br_black, bg = c.black })
hl("TabLine", { fg = c.br_black, bg = c.black })
hl("TabLineFill", { fg = c.br_black, bg = c.bg })
hl("TabLineSel", { fg = c.cursor, bg = c.sel_bg, bold = true })
hl("WinBar", { fg = c.fg, bg = c.bg })
hl("WinBarNC", { fg = c.br_black, bg = c.bg })
hl("Title", { fg = c.cursor, bold = true })
hl("Directory", { fg = c.blue })
hl("Question", { fg = c.cyan })
hl("MoreMsg", { fg = c.br_green })
hl("ModeMsg", { fg = c.fg, bold = true })
hl("ErrorMsg", { fg = c.red, bold = true })
hl("WarningMsg", { fg = c.yellow, bold = true })
hl("WildMenu", { fg = c.bg, bg = c.cursor })
hl("QuickFixLine", { bg = c.sel_bg })
hl("Pmenu", { fg = c.fg, bg = c.black })
hl("PmenuSel", { fg = c.fg, bg = c.sel_bg })
hl("PmenuSbar", { bg = c.black })
hl("PmenuThumb", { bg = c.br_black })
hl("PmenuExtra", { fg = c.br_black, bg = c.black })
hl("PmenuKind", { fg = c.magenta, bg = c.black })
hl("PmenuKindSel", { fg = c.cursor, bg = c.sel_bg })

hl("SpellBad", { sp = c.red, undercurl = true })
hl("SpellCap", { sp = c.blue, undercurl = true })
hl("SpellLocal", { sp = c.cyan, undercurl = true })
hl("SpellRare", { sp = c.magenta, undercurl = true })

-- Syntax
hl("Comment", { fg = c.br_black, italic = true })
hl("SpecialComment", { fg = c.br_magenta, italic = true })
hl("Todo", { fg = c.br_red, bold = true })
hl("Constant", { fg = c.yellow })
hl("String", { fg = c.br_green })
hl("Character", { fg = c.br_green })
hl("Number", { fg = c.yellow })
hl("Boolean", { fg = c.br_red })
hl("Float", { fg = c.yellow })
hl("Identifier", { fg = c.fg })
hl("Function", { fg = c.blue })
hl("Statement", { fg = c.magenta })
hl("Conditional", { fg = c.magenta })
hl("Repeat", { fg = c.magenta })
hl("Label", { fg = c.br_magenta })
hl("Operator", { fg = c.cursor })
hl("Keyword", { fg = c.magenta })
hl("Exception", { fg = c.red })
hl("PreProc", { fg = c.br_magenta })
hl("Include", { fg = c.magenta })
hl("Define", { fg = c.magenta })
hl("Macro", { fg = c.br_red })
hl("PreCondit", { fg = c.br_magenta })
hl("Type", { fg = c.cyan })
hl("StorageClass", { fg = c.cyan })
hl("Structure", { fg = c.cyan })
hl("Typedef", { fg = c.br_cyan })
hl("Special", { fg = c.cursor })
hl("SpecialChar", { fg = c.br_red })
hl("Tag", { fg = c.red })
hl("Delimiter", { fg = c.br_blue })
hl("Debug", { fg = c.red })
hl("Underlined", { fg = c.br_blue, underline = true })
hl("Ignore", { fg = c.br_black })
hl("Error", { fg = c.red, bold = true })

-- Diff
hl("DiffAdd", { fg = c.br_green, bg = c.black })
hl("DiffChange", { fg = c.br_blue, bg = c.black })
hl("DiffDelete", { fg = c.red, bg = c.black })
hl("DiffText", { fg = c.yellow, bg = c.sel_bg })
hl("Added", { fg = c.br_green })
hl("Changed", { fg = c.blue })
hl("Removed", { fg = c.red })

-- Diagnostics
hl("DiagnosticError", { fg = c.red })
hl("DiagnosticWarn", { fg = c.yellow })
hl("DiagnosticInfo", { fg = c.blue })
hl("DiagnosticHint", { fg = c.cyan })
hl("DiagnosticOk", { fg = c.br_green })
hl("DiagnosticUnderlineError", { sp = c.red, undercurl = true })
hl("DiagnosticUnderlineWarn", { sp = c.yellow, undercurl = true })
hl("DiagnosticUnderlineInfo", { sp = c.blue, undercurl = true })
hl("DiagnosticUnderlineHint", { sp = c.cyan, undercurl = true })
hl("DiagnosticUnderlineOk", { sp = c.br_green, undercurl = true })
hl("DiagnosticVirtualTextError", { fg = c.red, bg = c.black })
hl("DiagnosticVirtualTextWarn", { fg = c.yellow, bg = c.black })
hl("DiagnosticVirtualTextInfo", { fg = c.blue, bg = c.black })
hl("DiagnosticVirtualTextHint", { fg = c.cyan, bg = c.black })
link("DiagnosticFloatingError", "DiagnosticError")
link("DiagnosticFloatingWarn", "DiagnosticWarn")
link("DiagnosticFloatingInfo", "DiagnosticInfo")
link("DiagnosticFloatingHint", "DiagnosticHint")
link("DiagnosticSignError", "DiagnosticError")
link("DiagnosticSignWarn", "DiagnosticWarn")
link("DiagnosticSignInfo", "DiagnosticInfo")
link("DiagnosticSignHint", "DiagnosticHint")
hl("DiagnosticDeprecated", { sp = c.br_black, strikethrough = true })
hl("DiagnosticUnnecessary", { fg = c.br_black })

-- Treesitter
link("@variable", "Identifier")
hl("@variable.builtin", { fg = c.br_red })
hl("@variable.parameter", { fg = c.br_blue })
hl("@variable.member", { fg = c.br_cyan })
link("@constant", "Constant")
hl("@constant.builtin", { fg = c.br_red })
link("@constant.macro", "Macro")
hl("@module", { fg = c.cyan })
link("@label", "Label")
link("@string", "String")
hl("@string.escape", { fg = c.yellow })
hl("@string.special", { fg = c.cursor })
hl("@string.regexp", { fg = c.cyan })
link("@character", "Character")
link("@boolean", "Boolean")
link("@number", "Number")
link("@float", "Float")
link("@type", "Type")
hl("@type.builtin", { fg = c.br_cyan })
link("@type.definition", "Typedef")
hl("@attribute", { fg = c.br_magenta })
hl("@property", { fg = c.br_cyan })
link("@function", "Function")
hl("@function.builtin", { fg = c.br_blue })
link("@function.call", "Function")
link("@function.macro", "Macro")
link("@function.method", "Function")
hl("@constructor", { fg = c.cyan })
link("@operator", "Operator")
link("@keyword", "Keyword")
hl("@keyword.function", { fg = c.magenta })
hl("@keyword.return", { fg = c.magenta })
hl("@keyword.operator", { fg = c.cursor })
link("@keyword.import", "Include")
link("@keyword.conditional", "Conditional")
link("@keyword.repeat", "Repeat")
link("@keyword.exception", "Exception")
link("@comment", "Comment")
hl("@comment.todo", { fg = c.br_red, bold = true })
hl("@comment.error", { fg = c.red, bold = true })
hl("@comment.warning", { fg = c.yellow, bold = true })
hl("@comment.note", { fg = c.cyan, bold = true })
link("@punctuation.delimiter", "Delimiter")
hl("@punctuation.bracket", { fg = c.br_blue })
hl("@punctuation.special", { fg = c.cursor })
hl("@tag", { fg = c.red })
hl("@tag.attribute", { fg = c.yellow })
hl("@tag.delimiter", { fg = c.br_black })
hl("@markup.heading", { fg = c.cursor, bold = true })
hl("@markup.strong", { bold = true })
hl("@markup.italic", { italic = true })
hl("@markup.link", { fg = c.blue, underline = true })
hl("@markup.list", { fg = c.magenta })
hl("@markup.raw", { fg = c.br_green })
link("@diff.plus", "Added")
link("@diff.minus", "Removed")
link("@diff.delta", "Changed")

-- LSP semantic tokens
link("@lsp.type.variable", "@variable")
link("@lsp.type.parameter", "@variable.parameter")
link("@lsp.type.property", "@property")
link("@lsp.type.function", "@function")
link("@lsp.type.method", "@function.method")
link("@lsp.type.keyword", "@keyword")
link("@lsp.type.string", "@string")
link("@lsp.type.number", "@number")
link("@lsp.type.boolean", "@boolean")
link("@lsp.type.type", "@type")
link("@lsp.type.class", "@type")
link("@lsp.type.interface", "@type")
link("@lsp.type.enum", "@type")
link("@lsp.type.namespace", "@module")
link("@lsp.type.comment", "@comment")
hl("LspReferenceText", { bg = c.sel_bg })
hl("LspReferenceRead", { bg = c.sel_bg })
hl("LspReferenceWrite", { bg = c.sel_bg, underline = true })
hl("LspInlayHint", { fg = c.br_black, bg = c.black, italic = true })
hl("LspSignatureActiveParameter", { fg = c.cursor, bold = true })

-- GitSigns
hl("GitSignsAdd", { fg = c.br_green })
hl("GitSignsChange", { fg = c.blue })
hl("GitSignsDelete", { fg = c.red })
hl("GitSignsUntracked", { fg = c.cyan })
link("GitSignsAddNr", "GitSignsAdd")
link("GitSignsChangeNr", "GitSignsChange")
link("GitSignsDeleteNr", "GitSignsDelete")
hl("GitSignsAddLn", { bg = c.black })
hl("GitSignsChangeLn", { bg = c.black })
hl("GitSignsCurrentLineBlame", { fg = c.br_black, italic = true })

-- Telescope
hl("TelescopeNormal", { fg = c.fg, bg = c.black })
hl("TelescopeBorder", { fg = c.br_black, bg = c.black })
hl("TelescopeTitle", { fg = c.cursor, bold = true })
hl("TelescopeSelection", { fg = c.fg, bg = c.sel_bg })
hl("TelescopeSelectionCaret", { fg = c.cursor, bg = c.sel_bg })
hl("TelescopeMatching", { fg = c.yellow, bold = true })
hl("TelescopePromptPrefix", { fg = c.cursor })
hl("TelescopePromptCounter", { fg = c.br_black })
hl("TelescopeMultiSelection", { fg = c.br_magenta })

-- nvim-tree
hl("NvimTreeNormal", { fg = c.fg, bg = c.bg })
link("NvimTreeEndOfBuffer", "EndOfBuffer")
link("NvimTreeWinSeparator", "WinSeparator")
hl("NvimTreeCursorLine", { bg = c.line })
hl("NvimTreeFolderName", { fg = c.blue })
hl("NvimTreeOpenedFolderName", { fg = c.br_blue, bold = true })
hl("NvimTreeEmptyFolderName", { fg = c.br_black })
hl("NvimTreeRootFolder", { fg = c.cursor, bold = true })
hl("NvimTreeFolderIcon", { fg = c.magenta })
hl("NvimTreeIndentMarker", { fg = c.black })
hl("NvimTreeGitDirty", { fg = c.yellow })
hl("NvimTreeGitNew", { fg = c.br_green })
hl("NvimTreeGitDeleted", { fg = c.red })
hl("NvimTreeGitStaged", { fg = c.green })
hl("NvimTreeGitMerged", { fg = c.magenta })
hl("NvimTreeGitRenamed", { fg = c.cyan })
hl("NvimTreeGitIgnored", { fg = c.br_black })
hl("NvimTreeExecFile", { fg = c.br_green })
hl("NvimTreeSpecialFile", { fg = c.cursor })
hl("NvimTreeSymlink", { fg = c.cyan })
hl("NvimTreeImageFile", { fg = c.br_magenta })

-- nvim-cmp
hl("CmpItemAbbr", { fg = c.fg })
hl("CmpItemAbbrDeprecated", { fg = c.br_black, strikethrough = true })
hl("CmpItemAbbrMatch", { fg = c.cursor, bold = true })
hl("CmpItemAbbrMatchFuzzy", { fg = c.br_blue })
hl("CmpItemMenu", { fg = c.br_black })
hl("CmpItemKind", { fg = c.magenta })
hl("CmpItemKindFunction", { fg = c.blue })
hl("CmpItemKindMethod", { fg = c.blue })
hl("CmpItemKindVariable", { fg = c.fg })
hl("CmpItemKindField", { fg = c.br_cyan })
hl("CmpItemKindProperty", { fg = c.br_cyan })
hl("CmpItemKindClass", { fg = c.cyan })
hl("CmpItemKindInterface", { fg = c.cyan })
hl("CmpItemKindModule", { fg = c.br_magenta })
hl("CmpItemKindKeyword", { fg = c.magenta })
hl("CmpItemKindSnippet", { fg = c.yellow })
hl("CmpItemKindText", { fg = c.white })
hl("CmpItemKindEnum", { fg = c.yellow })
hl("CmpItemKindConstant", { fg = c.yellow })
hl("CmpItemKindConstructor", { fg = c.cyan })
hl("CmpItemKindFile", { fg = c.br_blue })
hl("CmpItemKindFolder", { fg = c.blue })
hl("CmpItemKindColor", { fg = c.br_red })
hl("CmpItemKindReference", { fg = c.br_magenta })
hl("CmpItemKindOperator", { fg = c.cursor })
hl("CmpItemKindTypeParameter", { fg = c.br_blue })
