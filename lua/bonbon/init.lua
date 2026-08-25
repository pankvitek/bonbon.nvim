local colors = require("bonbon.colors")
local config = require("bonbon.config")
local bonbon = {}

local function set_terminal_colors()
	vim.g.terminal_color_0 = colors.bg
	vim.g.terminal_color_1 = colors.markup
	vim.g.terminal_color_2 = colors.string
	vim.g.terminal_color_3 = colors.accent
	vim.g.terminal_color_4 = colors.tag
	vim.g.terminal_color_5 = colors.constant
	vim.g.terminal_color_6 = colors.regexp
	vim.g.terminal_color_7 = colors.fg
	vim.g.terminal_color_8 = colors.fg_idle
	vim.g.terminal_color_9 = colors.error
	vim.g.terminal_color_10 = colors.string
	vim.g.terminal_color_11 = colors.accent
	vim.g.terminal_color_12 = colors.tag
	vim.g.terminal_color_13 = colors.constant
	vim.g.terminal_color_14 = colors.regexp
	vim.g.terminal_color_15 = colors.comment
	vim.g.terminal_color_background = colors.bg
	vim.g.terminal_color_foreground = colors.fg
end

local function set_groups()
	local groups = {
		Normal = { fg = colors.fg, bg = colors.bg },
		NormalFloat = { bg = colors.bg },
		FloatBorder = { fg = colors.text_secondary },
		FloatTitle = { fg = colors.fg },
		Cursor = { fg = colors.cursor, bg = colors.cursor },
		InsertCursor = { bg = colors.cursor_insert },
		CursorColumn = { bg = colors.bg_secondary },
		CursorLine = { bg = colors.bg_secondary },
		CursorLineNr = { fg = colors.text_secondary, bg = colors.bg_secondary },

		LineNr = { fg = colors.text_secondary },

		Directory = { fg = colors.func },
		ErrorMsg = { fg = colors.error },
		WinSeparator = { fg = colors.bg_secondary, bg = colors.bg },
		VertSplit = { link = "WinSeparator" },
		Folded = { fg = colors.fg_idle, bg = colors.panel_bg },
		FoldColumn = { bg = colors.bg },
		SignColumn = { bg = colors.bg },

		MatchParen = { sp = colors.func, underline = true },
		ModeMsg = { fg = colors.string },
		MoreMsg = { fg = colors.string },
		NonText = { fg = colors.text_secondary },
		Pmenu = { fg = colors.fg, bg = colors.selection },
		PmenuSel = { fg = colors.fg, bg = colors.selection, reverse = true },
		Question = { fg = colors.string },
		Search = { fg = colors.fg, bg = colors.selection },
		CurSearch = { fg = colors.bg, bg = colors.selection_hl },
		IncSearch = { fg = colors.bg, bg = colors.selection_hl },
		SpecialKey = { fg = colors.selection },
		SpellCap = { sp = colors.tag, undercurl = true },
		SpellLocal = { sp = colors.keyword, undercurl = true },
		SpellBad = { sp = colors.error, undercurl = true },
		SpellRare = { sp = colors.success, undercurl = true },
		StatusLine = { fg = colors.fg, bg = colors.panel_bg },
		StatusLineNC = { fg = colors.fg_idle, bg = colors.panel_bg },
		WildMenu = { fg = colors.fg, bg = colors.markup },
		TabLine = { fg = colors.comment, bg = colors.panel_shadow },
		TabLineFill = { fg = colors.fg, bg = colors.bg_secondary },
		TabLineSel = { fg = colors.fg, bg = colors.bg },
		Title = { fg = colors.keyword },
		Visual = { bg = colors.selection },
		WarningMsg = { fg = colors.warning },

		Comment = { fg = colors.comment, italic = true },
		Constant = { fg = colors.constant },
		String = { fg = colors.string },
		Identifier = { fg = colors.type },
		Function = { fg = colors.func },
		Statement = { fg = colors.statement, bold = true },
		Operator = { fg = colors.statement },
		Exception = { fg = colors.markup },
		PreProc = { fg = colors.accent },
		Type = { fg = colors.type },
		Structure = { fg = colors.structure },
		Special = { fg = colors.statement },
		Delimiter = { fg = colors.structure },
		Underlined = { sp = colors.tag, underline = true },
		Ignore = { fg = colors.fg },
		Error = { fg = colors.white, bg = colors.error },
		Todo = { fg = colors.markup },
		qfLineNr = { fg = colors.keyword },
		qfError = { fg = colors.error },
		Conceal = { fg = colors.comment },
		CursorLineConceal = { fg = colors.text_secondary, bg = colors.bg_secondary },

		Added = { fg = colors.success },
		Removed = { fg = colors.error },
		Changed = { fg = colors.info },
		DiffAdd = { bg = colors.success_bg },
		DiffAdded = { fg = colors.success },
		DiffDelete = { bg = colors.error_bg },
		DiffRemoved = { fg = colors.error },
		DiffText = { bg = colors.text_secondary },
		DiffChange = { bg = colors.selection },

		-- LSP.
		DiagnosticError = { fg = colors.error },
		DiagnosticWarn = { fg = colors.warning },
		DiagnosticInfo = { fg = colors.info },
		DiagnosticHint = { fg = colors.info },

		DiagnosticUnnecessary = { fg = "" },
		DiagnosticUnderlineError = { fg = colors.comment, sp = colors.error, undercurl = true },
		DiagnosticUnderlineWarn = { fg = colors.comment, sp = colors.warning, undercurl = true },
		DiagnosticUnderlineInfo = { sp = colors.info, undercurl = true },
		DiagnosticUnderlineHint = { sp = colors.info, undercurl = true },

		markdownCode = { fg = colors.special },

		["@property"] = { fg = colors.local_variable },
		["@tag"] = { fg = colors.keyword },
		["@tag.attribute"] = { fg = colors.type },
		["@tag.delimiter"] = { link = "Delimiter" },
		["@type.qualifier"] = { fg = colors.type },
		["@variable"] = { fg = colors.local_variable },
		["@variable.builtin"] = { fg = colors.variable },
		["@variable.member"] = { fg = colors.variable },
		["@variable.parameter"] = { fg = colors.local_variable },
		["@tag.css"] = { fg = colors.default_type },
		["@module"] = { fg = colors.module },
		["@markup.heading"] = { fg = colors.fg },
		["@keyword.storage"] = { fg = colors.statement },
		["@special"] = { fg = colors.default_color },
		["@lsp.type.type"] = { link = "@type" },
		["@lsp.type.class"] = { link = "@type" },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.interface"] = { link = "@type" },
		["@lsp.type.struct"] = { link = "@variable.member" },
		["@lsp.type.parameter"] = { fg = colors.local_variable, underline = true },
		["@lsp.type.number"] = { fg = colors.number },
		["@lsp.type.field"] = { fg = colors.variable },
		["@lsp.type.builtin"] = { fg = colors.default_type },
		["@type.builtin"] = { fg = colors.default_type },
		["@lsp.type.builtin.c_sharp"] = { fg = colors.default_type },
		["@lsp.type.variable"] = { link = "@variable", underline = true },
		["@lsp.type.variable.cs"] = { underline = true },
		["@lsp.type.property"] = { link = "@property" },
		["@lsp.type.enumMember"] = { link = "@constant" },
		["@lsp.type.function"] = { link = "@function" },
		["@lsp.type.method"] = { link = "@function.method" },
		["@lsp.type.macro"] = { fg = colors.constant },
		["@lsp.type.decorator"] = { link = "@function" },
		["@lsp.mod.constant"] = { link = "@constant" },
		["@lsp.type.special"] = { fg = colors.default_type },
		["@function.builtin.lua"] = { fg = colors.func },
		["@lsp.type.builtin.lua"] = { fg = colors.func },
		["@lsp.type.modifier"] = { fg = colors.statement },
		["@keyword.repeat"] = { fg = colors.control, bold = true },
		["@keyword.return"] = { fg = colors.ret, bold = true },
		["@keyword.conditional"] = { fg = colors.control, bold = true },
		["@number"] = { fg = colors.number },
		["@number.float.css"] = { fg = colors.number },
		["@boolean"] = { fg = colors.default_const },
		["@constant.builtin"] = { fg = colors.default_const },
		["@lsp.type.operator"] = { fg = "" },
		["@operator"] = { fg = colors.operator },
		["@punctuation"] = { fg = colors.structure },
		["@lsp.type.punctuation"] = { fg = colors.structure },
		["@lsp.mod.constructorOrDestructor"] = { fg = colors.func },
		["@type.builtin"] = { fg = colors.default_type },
		["@lsp.type.keyword"] = { fg = "" },
		["@lsp.type.namespace"] = { fg = colors.module },
		["@variable.builtin.javascript"] = { fg = colors.local_variable },
		["@lsp.type.property.javascript"] = { fg = colors.variable },
		["@constructor"] = { fg = colors.func },
		["@constructor.lua"] = { fg = colors.fg },
		["@keyword.operator"] = { fg = colors.operator, bold = true },
		["@keyword.import"] = { fg = colors.statement, bold = true },
		["@keyword.exception"] = { fg = colors.control, bold = true },
		["@lsp.type.struct"] = { fg = colors.type },

		TreesitterContext = { bg = colors.selection },

		TelescopePromptBorder = { fg = colors.secondary_text },

		CmpGhostText = { fg = colors.comment },
		CmpItemAbbrMatch = { fg = colors.info },
		CmpItemAbbrMatchFuzzy = { fg = colors.info },
		CmpItemKindText = { fg = colors.string },
		CmpItemKindMethod = { fg = colors.func },
		CmpItemKindFunction = { fg = colors.func },
		CmpItemKindConstructor = { fg = colors.func },
		CmpItemKindField = { fg = colors.local_variable },
		CmpItemKindVariable = { fg = colors.variable },
		CmpItemKindClass = { fg = colors.type },
		CmpItemKindInterface = { fg = colors.type },
		CmpItemKindModule = { fg = colors.module },
		CmpItemKindProperty = { fg = colors.variable },
		CmpItemKindUnit = { fg = colors.number },
		CmpItemKindValue = { fg = colors.number },
		CmpItemKindEnum = { fg = colors.type },
		CmpItemKindKeyword = { fg = colors.statement },
		CmpItemKindSnippet = { fg = colors.success },
		CmpItemKindColor = { fg = colors.special },
		CmpItemKindFile = { fg = colors.special },
		CmpItemKindReference = { fg = colors.special },
		CmpItemKindFolder = { fg = colors.special },
		CmpItemKindEnumMember = { fg = colors.constant },
		CmpItemKindConstant = { fg = colors.constant },
		CmpItemKindStruct = { fg = colors.type },
		CmpItemKindEvent = { fg = colors.type },
		CmpItemKindOperator = { fg = colors.fg },
		CmpItemKindTypeParameter = { fg = colors.local_variable },
		CmpItemMenu = { fg = colors.comment },

		BlinkCmpMenu = { bg = colors.bg },
		BlinkCmpMenuBorder = { bg = colors.fg },
		BlinkCmpMenuSelection = { bg = colors.selection },
		BlinkCmpScrollBarGutter = { bg = colors.bg_secondary },
		BlinkCmpScrollBarThumb = { bg = colors.fg_idle },
		BlinkCmpLabel = { fg = colors.secondary_text },
		BlinkCmpLabelDeprecated = { fg = colors.comment, strikethrough = true },
		BlinkCmpLabelMatch = { fg = colors.info },
		BlinkCmpLabelDescription = { link = "PmenuExtra" },
		BlinkCmpLabelDetail = { link = "PmenuExtra" },
		BlinkCmpKind = { fg = colors.tag },
		BlinkCmpDoc = { link = "NormalFloat" },
		BlinkCmpDocBorder = { link = "FloatBorder" },
		BlinkCmpSignatureHelpBorder = { link = "FloatBorder" },
		BlinkCmpKindText = { fg = colors.string },
		BlinkCmpKindMethod = { fg = colors.func },
		BlinkCmpKindFunction = { fg = colors.func },
		BlinkCmpKindConstructor = { fg = colors.func },
		BlinkCmpKindField = { fg = colors.variable },
		BlinkCmpKindVariable = { fg = colors.variable },
		BlinkCmpKindClass = { fg = colors.type },
		BlinkCmpKindInterface = { fg = colors.type },
		BlinkCmpKindModule = { fg = colors.module },
		BlinkCmpKindProperty = { fg = colors.tag },
		BlinkCmpKindUnit = { fg = colors.constant },
		BlinkCmpKindValue = { fg = colors.constant },
		BlinkCmpKindEnum = { fg = colors.type },
		BlinkCmpKindKeyword = { fg = colors.statement },
		BlinkCmpKindSnippet = { fg = colors.markup },
		BlinkCmpKindColor = { fg = colors.special },
		BlinkCmpKindFile = { fg = colors.special },
		BlinkCmpKindReference = { fg = colors.markup },
		BlinkCmpKindFolder = { fg = colors.special },
		BlinkCmpKindEnumMember = { fg = colors.constant },
		BlinkCmpKindConstant = { fg = colors.constant },
		BlinkCmpKindStruct = { fg = colors.type },
		BlinkCmpKindEvent = { fg = colors.type },
		BlinkCmpKindOperator = { fg = colors.fg },
		BlinkCmpKindTypeParameter = { fg = colors.local_variable },

		CursorWord = { bg = colors.selection },
		CursorWord0 = { bg = colors.selection },
		CursorWord1 = { bg = colors.selection },

		NoiceCmdlinePopup = { fg = colors.fg },
		NoiceVirtualText = { fg = colors.selection_hl },
		NoiceCmdlinePopupIcon = { fg = colors.fg },
		NoiceCmdlinePopupBorder = { fg = colors.fg },
		NoiceLspProgressTitle = { fg = colors.fg },
		NoiceLspProgressClient = { fg = colors.special },
		NoiceCmdlinePrompt = { fg = colors.fg },
		NoiceCmdline = { fg = colors.fg },
		NoiceCmdlineIcon = { fg = colors.fg },
		NoiceCmdlinePopupBorderSearch = { fg = colors.search },
		NoiceCmdlineIconSearch = { fg = colors.search },
		NoiceFormatLevelInfo = { fg = colors.selection_hl },

		NvimTreeGitDirty = { fg = colors.accent },
		NvimTreeGitStaged = { fg = colors.info },
		NvimTreeGitMerge = { fg = colors.error },
		NvimTreeGitNew = { fg = colors.success },
		NvimTreeGitDeleted = { fg = colors.error },

		NvimTreeFolderName = { fg = colors.special },
		NvimTreeFolderIcon = { fg = colors.accent },
		NvimTreeOpenedFolderName = { fg = colors.special },
		NvimTreeRootFolder = { fg = colors.keyword },
		NvimTreeSpecialFile = { fg = colors.fg },
		NvimTreeExecFile = { fg = colors.fg },
		NvimTreeIndentMarker = { fg = colors.text_secondary },

		NvimTreeWindowPicker = { fg = colors.keyword, bg = colors.bg_secondary, bold = true },

		NeoTreeRootName = { fg = colors.fg, bold = true },

		WhichKeyFloat = { bg = colors.bg },

		IndentBlanklineContextChar = { fg = colors.comment },

		NeogitDiffContextHighlight = { bg = colors.bg_secondary },
		NeogitHunkHeader = { fg = colors.tag },
		NeogitHunkHeaderHighlight = { fg = colors.tag, bg = colors.bg_secondary },
		NeogitDiffAddHighlight = { bg = colors.success_bg },
		NeogitDiffDeleteHighlight = { bg = colors.error_bg },

		HopNextKey = { fg = colors.keyword, bold = true, underline = true },
		HopNextKey1 = { fg = colors.type, bold = true, underline = true },
		HopNextKey2 = { fg = colors.tag },
		HopUnmatched = { fg = colors.comment },

		LeapMatch = { fg = colors.regexp, underline = true },
		LeapLabelPrimary = { fg = colors.bg, bg = colors.regexp },
		LeapLabelSecondary = { fg = colors.bg, bg = colors.type },
		LeapLabelSelected = { fg = colors.bg, bg = colors.tag },

		FlashBackdrop = { fg = colors.comment },
		FlashMatch = { fg = colors.bg, bg = colors.warning },
		FlashCurrent = { fg = colors.bg, bg = colors.tag },
		FlashLabel = { fg = colors.white, bg = colors.error, bold = true },
		FlashCursor = { reverse = true },

		LspInlayHint = { fg = colors.lsp_inlay_hint },

		LspSignatureActiveParameter = { italic = true },

		NotifyERROR = { fg = colors.error },
		NotifyWARN = { fg = colors.warning },
		NotifyINFO = { fg = colors.info },
		NotifyDEBUG = { fg = colors.info },
		NotifyTRACE = { fg = colors.info },
		NotifyERRORTitle = { fg = colors.error },
		NotifyWARNTitle = { fg = colors.warning },
		NotifyINFOTitle = { fg = colors.info },
		NotifyDEBUGTitle = { fg = colors.info },
		NotifyTRACETitle = { fg = colors.info },

		NvimDapVirtualText = { fg = colors.regexp },

		DapUIScope = { fg = colors.func },
		DapUIType = { fg = colors.type },
		DapUIDecoration = { fg = colors.tag },
		DapUIThread = { fg = colors.string },
		DapUIStoppedThread = { fg = colors.special },
		DapUISource = { fg = colors.regexp },
		DapUILineNumber = { fg = colors.constant },
		DapUIFloatBorder = { fg = colors.bg_secondary },
		DapUIWatchesEmpty = { fg = colors.warning },
		DapUIWatchesValue = { fg = colors.string },
		DapUIWatchesError = { fg = colors.error },
		DapUIBreakpointsPath = { fg = colors.regexp },
		DapUIBreakpointsInfo = { fg = colors.constant },
		DapUIBreakpointsCurrentLine = { fg = colors.constant, bold = true },

		VM_Extend = { bg = colors.selection },
		VM_Cursor = { bg = colors.selection, sp = colors.fg, underline = true },
		VM_Insert = { sp = colors.fg, underline = true },
		VM_Mono = { fg = colors.bg, bg = colors.comment },

		MiniFilesDirectory = { fg = colors.fg, bold = true },
		MiniFilesBorder = { fg = colors.fg },
		MiniFilesTitleFocused = { fg = colors.bg, bg = colors.fg, bold = true },
		MiniHipatternsFixme = { fg = colors.bg, bg = colors.error, bold = true },
		MiniHipatternsHack = { fg = colors.bg, bg = colors.keyword, bold = true },
		MiniHipatternsTodo = { fg = colors.bg, bg = colors.tag, bold = true },
		MiniHipatternsNote = { fg = colors.bg, bg = colors.regexp, bold = true },
		MiniIconsAzure = { fg = colors.tag },
		MiniIconsBlue = { fg = colors.type },
		MiniIconsCyan = { fg = colors.regexp },
		MiniIconsGreen = { fg = colors.string },
		MiniIconsGrey = { fg = colors.fg },
		MiniIconsOrange = { fg = colors.keyword },
		MiniIconsPurple = { fg = colors.lsp_parameter },
		MiniIconsRed = { fg = colors.error },
		MiniIconsYellow = { fg = colors.special },
		MiniIndentscopeSymbol = { fg = colors.comment },
		MiniIndentscopeSymbolOff = { fg = colors.keyword },
		MiniJump = { sp = colors.keyword, undercurl = true },
		MiniJump2dDim = { fg = colors.comment, nocombine = true },
		MiniJump2dSpot = { fg = colors.keyword, bold = true, underline = true, nocombine = true },
		MiniJump2dSpotAhead = { fg = colors.type, underline = true, nocombine = true },
		MiniJump2dSpotUnique = { fg = colors.tag, bold = true, underline = true, nocombine = true },
		MiniMapNormal = { fg = colors.lsp_inlay_hint, bg = colors.panel_bg },
		MiniStarterItemPrefix = { fg = colors.accent },
		MiniStarterQuery = { fg = colors.info },
		MiniStarterSection = { fg = colors.tag },
		MiniStarterFooter = { link = "Comment" },
		MiniStatuslineDevinfo = { fg = colors.fg, bg = colors.bg_secondary },
		MiniStatuslineFileinfo = { fg = colors.fg, bg = colors.bg_secondary },
		MiniStatuslineFilename = { fg = colors.fg_idle, bg = colors.bg_secondary },
		MiniStatuslineInactive = { fg = colors.fg_idle, bg = colors.bg_secondary },
		MiniStatuslineModeCommand = { fg = colors.bg, bg = colors.type, bold = true },
		MiniStatuslineModeInsert = { fg = colors.bg, bg = colors.string, bold = true },
		MiniStatuslineModeNormal = { fg = colors.bg, bg = colors.info, bold = true },
		MiniStatuslineModeOther = { fg = colors.bg, bg = colors.regexp, bold = true },
		MiniStatuslineModeReplace = { fg = colors.bg, bg = colors.error, bold = true },
		MiniStatuslineModeVisual = { fg = colors.bg, bg = colors.warning, bold = true },
		MiniTablineCurrent = { fg = colors.fg, bg = colors.bg, bold = true },
		MiniTablineFill = { fg = colors.fg, bg = colors.bg_secondary },
		MiniTablineHidden = { fg = colors.comment, bg = colors.panel_shadow },
		MiniTablineModifiedCurrent = { fg = colors.bg, bg = colors.fg, bold = true },
		MiniTablineModifiedHidden = { fg = colors.panel_shadow, bg = colors.comment },
		MiniTablineModifiedVisible = { fg = colors.bg, bg = colors.fg },
		MiniTablineVisible = { fg = colors.fg, bg = colors.bg },
		MiniTestFail = { fg = colors.error, bold = true },
		MiniTestPass = { fg = colors.string, bold = true },
		MiniTrailspace = { bg = colors.error },

		RenderMarkdownH1 = { fg = colors.success },
		RenderMarkdownH2 = { fg = colors.string },
		RenderMarkdownH3 = { fg = colors.accent },
		RenderMarkdownH4 = { fg = colors.keyword },
		RenderMarkdownH5 = { fg = colors.markup },
		RenderMarkdownH6 = { fg = colors.constant },
		RenderMarkdownH1Bg = { bg = colors.bg_secondary, fg = colors.success },
		RenderMarkdownH2Bg = { bg = colors.bg_secondary, fg = colors.string },
		RenderMarkdownH3Bg = { bg = colors.bg_secondary, fg = colors.accent },
		RenderMarkdownH4Bg = { bg = colors.bg_secondary, fg = colors.keyword },
		RenderMarkdownH5Bg = { bg = colors.bg_secondary, fg = colors.markup },
		RenderMarkdownH6Bg = { bg = colors.bg_secondary, fg = colors.constant },
		RenderMarkdownQuote = { fg = colors.accent },
		RenderMarkdownQuote1 = { fg = colors.accent },
		RenderMarkdownQuote2 = { fg = colors.keyword },
		RenderMarkdownQuote3 = { fg = colors.markup },
		RenderMarkdownQuote4 = { fg = colors.constant },
		RenderMarkdownQuote5 = { fg = colors.constant },
		RenderMarkdownQuote6 = { fg = colors.constant },
		RenderMarkdownBullet = { fg = colors.success },
		RenderMarkdownDash = { fg = colors.accent },
		RenderMarkdownSign = { fg = colors.accent },
		RenderMarkdownMath = { fg = colors.accent },
		RenderMarkdownIndent = { fg = colors.accent },
		RenderMarkdownHtmlComment = { fg = colors.comment },
		RenderMarkdownLink = { fg = colors.tag },
		RenderMarkdownWikiLink = { fg = colors.tag },
		RenderMarkdownUnchecked = { fg = colors.markup },
		RenderMarkdownChecked = { fg = colors.success },
		RenderMarkdownTodo = { fg = colors.success },
		RenderMarkdownTableHead = { fg = colors.comment },
		RenderMarkdownTableRow = { fg = colors.comment },
		RenderMarkdownTableFill = { fg = colors.comment },

		htmlTag = { fg = colors.type },
		htmlEndTag = { link = "htmlTag" },
		htmlTagName = { fg = colors.type },
		htmlArg = { fg = colors.func },
		htmlTitle = { bold = true, fg = colors.fg },
		htmlH1 = { link = "htmlTitle" },
		htmlH2 = { link = "htmlTitle" },
		htmlH3 = { link = "htmlTitle" },
		htmlH4 = { link = "htmlTitle" },
		htmlH5 = { link = "htmlTitle" },
		htmlH6 = { link = "htmlTitle" },

		GitSignsCurrentLineBlame = { fg = colors.text_secondary, italic = true },

		SnacksPickerDir = { link = "Comment" },
		SnacksPickerPathHidden = { link = "Comment" },
		SnacksPickerPathIgnored = { link = "Comment" },
		SnacksPickerGitStatusUntracked = { link = "Special" },
	}

	groups = vim.tbl_deep_extend(
		"force",
		groups,
		type(config.overrides) == "function" and config.overrides() or config.overrides
	)

	for group, parameters in pairs(groups) do
		vim.api.nvim_set_hl(0, group, parameters)
	end
end

function bonbon.setup(values)
	setmetatable(config, { __index = vim.tbl_extend("force", config.defaults, values) })
end

function bonbon.colorscheme()
	if vim.version().minor < 8 then
		vim.notify(
			"Neovim 0.8+ is required for bonbon colorscheme",
			vim.log.levels.ERROR,
			{ title = "bonbon colorscheme" }
		)
		return
	end

	vim.api.nvim_command("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.api.nvim_command("syntax reset")
	end

	vim.g.VM_theme_set_by_colorscheme = true
	vim.o.termguicolors = true
	vim.g.colors_name = "bonbon"

	colors.generate()
	if config.terminal then
		set_terminal_colors()
	end
	set_groups()
end

return bonbon
