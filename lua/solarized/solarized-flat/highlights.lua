local M = {}
local cmd = vim.cmd
local g = vim.g
local o = vim.o
local fn = vim.fn
local utils = require('solarized.utils')
local colors

cmd('hi clear')

utils.default_settings()

if fn.exists("syntax_on") then
	cmd('syntax reset')
end

g.colors_name = 'solarized-flat'

function M.load_syntax(colors)
	local syntax = {}
	syntax['Normal'] = {fg=colors.base0,bg=utils.termtrans(colors.base03)}
	syntax['CursorLine'] = {fg=colors.none,bg=utils.termtrans(colors.base02)}
	syntax['Terminal'] = syntax['Normal']
	syntax['ToolbarButton'] = {fg=colors.base1,bg=utils.termtrans(colors.base02),style='bold'}
	syntax['ToolbarLine'] = {fg=colors.none,bg=utils.termtrans(colors.base02)}

	if g.solarized_visibility == 'high' then
		syntax['CursorLineNr'] = {fg=colors.orange,style='bold'}
		syntax['NonText'] = {fg=colors.orange,style='bold'}
		syntax['SpecialKey'] = {fg=colors.orange,style='reverse'}
		syntax['SpellBad'] = {fg=colors.violet,bg=colors.base2,guisp=colors.red,style='reverse,underline'}
		syntax['SpellCap'] = {fg=colors.violet,bg=colors.base2,guisp=colors.red,style='reverse,underline'}
		syntax['SpellLocal'] = {fg=colors.yellow,bg=colors.base2,guisp=colors.red,style='reverse,underline'}
		syntax['SpellRare'] = {fg=colors.cyan,bg=colors.base2,guisp=colors.red,style='reverse,underline'}
		syntax['Title'] = {fg=colors.yellow,style='bold',cterm='bold'}
	elseif g.solarized_visibility == 'low' then
		syntax['CursorLineNr'] = {fg=colors.base01,style='bold'}
		syntax['NonText'] = {fg=colors.base02,style='bold'}
		syntax['SpecialKey'] = {fg=colors.base02,style='reverse'}
		syntax['SpellBad'] = {fg=colors.violet,guisp=colors.violet,style='underline'}
		syntax['SpellCap'] = {fg=colors.violet,guisp=colors.violet,style='underline'}
		syntax['SpellLocal'] = {fg=colors.yellow,guisp=colors.yellow,style='underline'}
		syntax['SpellRare'] = {fg=colors.cyan,guisp=colors.cyan,style='underline'}
		syntax['Title'] = {fg=colors.base01,style='bold',cterm='bold'}
	else
		syntax['CursorLineNr'] = {fg=colors.base0,style='bold'}
		syntax['NonText'] = {fg=colors.base00,style='bold'}
		syntax['SpecialKey'] = {fg=colors.base00,bg=colors.base02,style='bold'}
		syntax['SpellBad'] = {fg=colors.violet,guisp=colors.violet,style='underline'}
		syntax['SpellCap'] = {fg=colors.violet,guisp=colors.violet,style='underline'}
		syntax['SpellLocal'] = {fg=colors.yellow,guisp=colors.yellow,style='underline'}
		syntax['SpellRare'] = {fg=colors.cyan,guisp=colors.cyan,style='underline'}
		syntax['Title'] = {fg=colors.orange,style='bold',cterm='bold'}
	end

	if g.solarized_diffmode == 'high' then
		syntax['DiffAdd'] = {fg=colors.green,style='reverse'}
		syntax['DiffChange'] = {fg=colors.yellow,style='reverse'}
		syntax['DiffDelete'] = {fg=colors.red,style='reverse'}
		syntax['DiffText'] = {fg=colors.blue,style='reverse'}
	elseif g.solarized_diffmode == 'low' then
		syntax['DiffAdd'] = {fg=colors.green,guisp=colors.green}
		syntax['DiffChange'] = {fg=colors.yellow,guisp=colors.yellow}
		syntax['DiffDelete'] = {fg=colors.red,style='bold'}
		syntax['DiffText'] = {fg=colors.blue,guisp=colors.blue}
	else
		syntax['DiffAdd'] = {fg=colors.green,bg=colors.base02,guisp=colors.green}
		syntax['DiffChange'] = {fg=colors.yellow,bg=colors.base02,guisp=colors.yellow}
		syntax['DiffDelete'] = {fg=colors.red,bg=colors.base02,style='bold'}
		syntax['DiffText'] = {fg=colors.blue,bg=colors.base02,guisp=colors.blue}
	end

	if g.solarized_statusline == 'low' then
		syntax['StatusLine'] = {fg=colors.base02,bg=colors.base1,style='bold,reverse'}
		syntax['StatusLineNC'] = {fg=colors.base02,bg=colors.base01,style='reverse'}
		syntax['TabLineSel'] = {fg=colors.base1,bg=colors.base02}
		syntax['NormalMode'] = {fg=colors.base02,bg=colors.base1,style='bold,reverse'}
	elseif g.solarized_statusline == 'flat' then
		syntax['StatusLine'] = {fg=colors.base02,bg=colors.base2,style='reverse'}
		syntax['StatusLineNC'] = {fg=colors.base02,bg=colors.base1,style='reverse'}
		syntax['TabLineSel'] = {fg=colors.base2,bg=colors.base02}
		syntax['NormalMode'] = {fg=colors.base02,bg=colors.base2,style='reverse'}
	else
		syntax['StatusLine'] = {fg=colors.base02,bg=colors.base2,style='reverse'}
		syntax['StatusLineNC'] = {fg=colors.base02,bg=colors.base1,style='reverse'}
		syntax['TabLineSel'] = {fg=colors.base2,bg=colors.base02}
		syntax['NormalMode'] = {fg=colors.base02,bg=colors.base2,style='reverse'}
	end

	syntax['ColorColumn'] = {fg=colors.none,bg=colors.base02}
	syntax['Conceal'] = {fg=colors.blue}
	syntax['CursorColumn'] = {fg=colors.none,bg=colors.base02}
	syntax['Directory'] = {fg=colors.blue}
	syntax['EndOfBuffer'] = {fg=colors.none,ctermfg=colors.none,ctermbg=colors.none}
	syntax['ErrorMsg'] = {fg=colors.red,bg=colors.err_bg,style='reverse'}
	syntax['FoldColumn'] = {fg=colors.base0}
	syntax['Folded'] = {fg=colors.base0,guisp=colors.base03,style='bold'}
	syntax['IncSearch'] = {fg=colors.orange,style='standout'}
	syntax['LineNr'] = {fg=colors.base01}
	syntax['MatchParen'] = {fg=colors.base3,bg=colors.base02,style='bold'}
	syntax['ModeMsg'] = {fg=colors.blue}
	syntax['MoreMsg'] = {fg=colors.blue}
	syntax['Pmenu'] = {fg=colors.base0,bg=colors.base02}
	syntax['PmenuSbar'] = {fg=colors.none,bg=colors.base02}
	syntax['PmenuSel'] = {fg=colors.base2,bg=colors.base01}
	syntax['PmenuThumb'] = {fg=colors.none,bg=colors.base01}
	syntax['Question'] = {fg=colors.cyan,style='bold'}
	syntax['Search'] = {fg=colors.yellow,style='reverse'}
	syntax['SignColumn'] = {fg=colors.base0}
	syntax['TabLine'] = {fg=colors.base01,bg=colors.base02}
	syntax['TabLineFill'] = {fg=colors.base01,bg=colors.base02}
	syntax['VertSplit'] = {fg=colors.base01}
	syntax['Visual'] = {fg=colors.base01,bg=colors.base03,style='reverse'}
	syntax['VisualNOS'] = {fg=colors.none,bg=colors.base02,style='reverse'}
	syntax['WarningMsg'] = {fg=colors.orange,style='bold'}
	syntax['WildMenu'] = {fg=colors.base00,bg=colors.base2,style='reverse'}
	syntax['Comment'] = {fg=colors.base01,style=utils.italics()}
	syntax['Constant'] = {fg=colors.cyan}
	syntax['CursorIM'] = {fg=colors.none,bg=colors.base0}
	syntax['Error'] = {fg=colors.red,bg=colors.err_bg,style='bold,reverse'}
	syntax['Identifier'] = {fg=colors.blue}
	syntax['Ignore'] = {fg=colors.none,ctermfg=colors.none,ctermbg=colors.none}
	syntax['PreProc'] = {fg=colors.orange}
	syntax['Special'] = {fg=colors.orange}
	syntax['Statement'] = {fg=colors.green}
	syntax['Todo'] = {fg=colors.magenta,style='bold'}
	syntax['Type'] = {fg=colors.yellow}
	syntax['Underlined'] = {fg=colors.violet}
	syntax['InsertMode'] = {fg=colors.base02,bg=colors.cyan,style='bold,reverse'}
	syntax['ReplaceMode'] = {fg=colors.base02,bg=colors.orange,style='bold,reverse'}
	syntax['VisualMode'] = {fg=colors.base02,bg=colors.magenta,style='bold,reverse'}
	syntax['CommandMode'] = {fg=colors.base02,bg=colors.magenta,style='bold,reverse'}
	syntax['vimCommentString'] = {fg=colors.violet}
	syntax['vimCommand'] = {fg=colors.yellow}
	syntax['vimCmdSep'] = {fg=colors.blue,style='bold'}
	syntax['helpExample'] = {fg=colors.base1}
	syntax['helpOption'] = {fg=colors.cyan}
	syntax['helpNote'] = {fg=colors.magenta}
	syntax['helpVim'] = {fg=colors.magenta}
	syntax['helpHyperTextJump'] = {fg=colors.blue}
	syntax['helpHyperTextEntry'] = {fg=colors.green}
	syntax['vimIsCommand'] = {fg=colors.base00}
	syntax['vimSynMtchOpt'] = {fg=colors.yellow}
	syntax['vimSynType'] = {fg=colors.cyan}
	syntax['vimHiLink'] = {fg=colors.blue}
	syntax['vimHiGroup'] = {fg=colors.blue}
	syntax['vimGroup'] = {fg=colors.blue,style='bold'}
	syntax['gitcommitComment'] = {fg=colors.base01,style=utils.italics()}
	syntax['gitcommitUnmerged'] = {fg=colors.green,style='bold'}
	syntax['gitcommitOnBranch'] = {fg=colors.base01,style='bold'}
	syntax['gitcommitBranch'] = {fg=colors.magenta,style='bold'}
	syntax['gitcommitUnmerged'] = {fg=colors.green,style='bold'}
	syntax['gitcommitOnBranch'] = {fg=colors.base01,style='bold'}
	syntax['gitcommitBranch'] = {fg=colors.magenta,style='bold'}
	syntax['gitcommitdiscardedtype'] = {fg=colors.red}
	syntax['gitcommitselectedtype'] = {fg=colors.green}
	syntax['gitcommitHeader'] = {fg=colors.base01}
	syntax['gitcommitUntrackedFile'] = {fg=colors.cyan,style='bold'}
	syntax['gitcommitDiscardedFile'] = {fg=colors.red,style='bold'}
	syntax['gitcommitSelectedFile'] = {fg=colors.green,style='bold'}
	syntax['gitcommitUnmergedFile'] = {fg=colors.yellow,style='bold'}
	syntax['gitcommitFile'] = {fg=colors.base0,style='bold'}
	syntax['htmlTag'] = {fg=colors.base01}
	syntax['htmlEndTag'] = {fg=colors.base01}
	syntax['htmlTagN'] = {fg=colors.base1,style='bold'}
	syntax['htmlTagName'] = {fg=colors.blue,style='bold'}
	syntax['htmlSpecialTagName'] = {fg=colors.blue,style=utils.italics()}
	syntax['htmlArg'] = {fg=colors.base00}
	syntax['javaScript'] = {fg=colors.yellow}
	syntax['perlHereDoc'] = {fg=colors.base1}
	syntax['perlVarPlain'] = {fg=colors.yellow}
	syntax['perlStatementFileDesc'] = {fg=colors.cyan}
	syntax['texstatement'] = {fg=colors.cyan}
	syntax['texmathzonex'] = {fg=colors.yellow}
	syntax['texmathmatcher'] = {fg=colors.yellow}
	syntax['texreflabel'] = {fg=colors.yellow}
	syntax['rubyDefine'] = {fg=colors.base1,style='bold'}
	syntax['rubyBoolean'] = {fg=colors.magenta}
	syntax['cPreCondit'] = {fg=colors.orange}
	syntax['VarId'] = {fg=colors.blue}
	syntax['ConId'] = {fg=colors.yellow}
	syntax['hsImport'] = {fg=colors.magenta}
	syntax['hsString'] = {fg=colors.base00}
	syntax['hsStructure'] = {fg=colors.cyan}
	syntax['hs_hlFunctionName'] = {fg=colors.blue}
	syntax['hsStatement'] = {fg=colors.cyan}
	syntax['hsImportLabel'] = {fg=colors.cyan}
	syntax['hs_OpFunctionName'] = {fg=colors.yellow}
	syntax['hs_DeclareFunction'] = {fg=colors.orange}
	syntax['hsVarSym'] = {fg=colors.cyan}
	syntax['hsType'] = {fg=colors.yellow}
	syntax['hsTypedef'] = {fg=colors.cyan}
	syntax['hsModuleName'] = {fg=colors.green}
	syntax['hsNiceOperator'] = {fg=colors.cyan}
	syntax['hsniceoperator'] = {fg=colors.cyan}
	syntax['pandocTitleBlock'] = {fg=colors.blue}
	syntax['pandocTitleBlockTitle'] = {fg=colors.blue,style='bold'}
	syntax['pandocTitleComment'] = {fg=colors.blue,style='bold'}
	syntax['pandocComment'] = {fg=colors.base01,style=utils.italics()}
	syntax['pandocVerbatimBlock'] = {fg=colors.yellow}
	syntax['pandocBlockQuote'] = {fg=colors.blue}
	syntax['pandocBlockQuoteLeader1'] = {fg=colors.blue}
	syntax['pandocBlockQuoteLeader2'] = {fg=colors.cyan}
	syntax['pandocBlockQuoteLeader3'] = {fg=colors.yellow}
	syntax['pandocBlockQuoteLeader4'] = {fg=colors.red}
	syntax['pandocBlockQuoteLeader5'] = {fg=colors.base0}
	syntax['pandocBlockQuoteLeader6'] = {fg=colors.base01}
	syntax['pandocListMarker'] = {fg=colors.magenta}
	syntax['pandocListReference'] = {fg=colors.magenta}
	syntax['pandocDefinitionBlock'] = {fg=colors.violet}
	syntax['pandocDefinitionTerm'] = {fg=colors.violet,style='standout'}
	syntax['pandocDefinitionIndctr'] = {fg=colors.violet,style='bold'}
	syntax['pandocEmphasisDefinition'] = {fg=colors.violet,style=utils.italics()}
	syntax['pandocEmphasisNestedDefinition'] = {fg=colors.violet,style='bold'}
	syntax['pandocStrongEmphasisDefinition'] = {fg=colors.violet,style='bold'}
	syntax['pandocStrongEmphasisNestedDefinition'] = {fg=colors.violet,style='bold'}
	syntax['pandocStrongEmphasisEmphasisDefinition'] = {fg=colors.violet,style='bold'}
	syntax['pandocStrikeoutDefinition'] = {fg=colors.violet,style='reverse'}
	syntax['pandocVerbatimInlineDefinition'] = {fg=colors.violet}
	syntax['pandocSuperscriptDefinition'] = {fg=colors.violet}
	syntax['pandocSubscriptDefinition'] = {fg=colors.violet}
	syntax['pandocTable'] = {fg=colors.blue}
	syntax['pandocTableStructure'] = {fg=colors.blue}
	syntax['pandocTableZebraLight'] = {fg=colors.blue,bg=colors.base03}
	syntax['pandocTableZebraDark'] = {fg=colors.blue,bg=colors.base02}
	syntax['pandocEmphasisTable'] = {fg=colors.blue,style=utils.italics()}
	syntax['pandocEmphasisNestedTable'] = {fg=colors.blue,style='bold'}
	syntax['pandocStrongEmphasisTable'] = {fg=colors.blue,style='bold'}
	syntax['pandocStrongEmphasisNestedTable'] = {fg=colors.blue,style='bold'}
	syntax['pandocStrongEmphasisEmphasisTable'] = {fg=colors.blue,style='bold'}
	syntax['pandocStrikeoutTable'] = {fg=colors.blue,style='reverse'}
	syntax['pandocVerbatimInlineTable'] = {fg=colors.blue}
	syntax['pandocSuperscriptTable'] = {fg=colors.blue}
	syntax['pandocSubscriptTable'] = {fg=colors.blue}
	syntax['pandocHeading'] = {fg=colors.orange,style='bold'}
	syntax['pandocHeadingMarker'] = {fg=colors.orange,style='bold'}
	syntax['pandocEmphasisHeading'] = {fg=colors.orange,style='bold'}
	syntax['pandocEmphasisNestedHeading'] = {fg=colors.orange,style='bold'}
	syntax['pandocStrongEmphasisHeading'] = {fg=colors.orange,style='bold'}
	syntax['pandocStrongEmphasisNestedHeading'] = {fg=colors.orange,style='bold'}
	syntax['pandocStrongEmphasisEmphasisHeading'] = {fg=colors.orange,style='bold'}
	syntax['pandocStrikeoutHeading'] = {fg=colors.orange,style='reverse'}
	syntax['pandocVerbatimInlineHeading'] = {fg=colors.orange,style='bold'}
	syntax['pandocSuperscriptHeading'] = {fg=colors.orange,style='bold'}
	syntax['pandocSubscriptHeading'] = {fg=colors.orange,style='bold'}
	syntax['pandocLinkDelim'] = {fg=colors.base01}
	syntax['pandocLinkLabel'] = {fg=colors.blue}
	syntax['pandocLinkText'] = {fg=colors.blue}
	syntax['pandocLinkURL'] = {fg=colors.base00}
	syntax['pandocLinkTitle'] = {fg=colors.base00}
	syntax['pandocLinkTitleDelim'] = {fg=colors.base01,guisp=colors.base00}
	syntax['pandocLinkDefinition'] = {fg=colors.cyan,guisp=colors.base00}
	syntax['pandocLinkDefinitionID'] = {fg=colors.blue,style='bold'}
	syntax['pandocImageCaption'] = {fg=colors.violet,style='bold'}
	syntax['pandocFootnoteLink'] = {fg=colors.green}
	syntax['pandocFootnoteDefLink'] = {fg=colors.green,style='bold'}
	syntax['pandocFootnoteInline'] = {fg=colors.green,style='bold'}
	syntax['pandocFootnote'] = {fg=colors.green}
	syntax['pandocCitationDelim'] = {fg=colors.magenta}
	syntax['pandocCitation'] = {fg=colors.magenta}
	syntax['pandocCitationID'] = {fg=colors.magenta}
	syntax['pandocCitationRef'] = {fg=colors.magenta}
	syntax['pandocStyleDelim'] = {fg=colors.base01}
	syntax['pandocEmphasis'] = {fg=colors.base0,style=utils.italics()}
	syntax['pandocEmphasisNested'] = {fg=colors.base0,style='bold'}
	syntax['pandocStrongEmphasis'] = {fg=colors.base0,style='bold'}
	syntax['pandocStrongEmphasisNested'] = {fg=colors.base0,style='bold'}
	syntax['pandocStrongEmphasisEmphasis'] = {fg=colors.base0,style='bold'}
	syntax['pandocStrikeout'] = {fg=colors.base01,style='reverse'}
	syntax['pandocVerbatimInline'] = {fg=colors.yellow}
	syntax['pandocSuperscript'] = {fg=colors.violet}
	syntax['pandocSubscript'] = {fg=colors.violet}
	syntax['pandocRule'] = {fg=colors.blue,style='bold'}
	syntax['pandocRuleLine'] = {fg=colors.blue,style='bold'}
	syntax['pandocEscapePair'] = {fg=colors.red,style='bold'}
	syntax['pandocCitationRef'] = {fg=colors.magenta}
	syntax['pandocNonBreakingSpace'] = {fg=colors.red,style='reverse'}
	syntax['pandocMetadataDelim'] = {fg=colors.base01}
	syntax['pandocMetadata'] = {fg=colors.blue}
	syntax['pandocMetadataKey'] = {fg=colors.blue}
	syntax['pandocMetadata'] = {fg=colors.blue,style='bold'}

	-- link
	syntax['Boolean'] = syntax['Constant']
	syntax['Character'] = syntax['Constant']
	syntax['Conditional'] = syntax['Statement']
	syntax['Debug'] = syntax['Special']
	syntax['Define'] = syntax['PreProc']
	syntax['Delimiter'] = syntax['Special']
	syntax['Exception'] = syntax['Statement']
	syntax['Float'] = syntax['Constant']
	syntax['FloatBorder'] = syntax['VertSplit']
	syntax['Function'] = syntax['Identifier']
	syntax['Include'] = syntax['PreProc']
	syntax['Keyword'] = syntax['Statement']
	syntax['Label'] = syntax['Statement']
	syntax['Macro'] = syntax['PreProc']
	syntax['Number'] = syntax['Constant']
	syntax['Operator'] = syntax['Statement']
	syntax['PreCondit'] = syntax['PreProc']
	syntax['QuickFixLine'] = syntax['Search']
	syntax['Repeat'] = syntax['Statement']
	syntax['SpecialChar'] = syntax['Special']
	syntax['SpecialComment'] = syntax['Special']
	syntax['StatusLineTerm'] = syntax['StatusLine']
	syntax['StatusLineTermNC'] = syntax['StatusLineNC']
	syntax['StorageClass'] = syntax['Type']
	syntax['String'] = syntax['Constant']
	syntax['Structure'] = syntax['Type']
	syntax['Tag'] = syntax['Special']
	syntax['Typedef'] = syntax['Type']
	syntax['lCursor'] = syntax['Cursor']

	syntax['vimVar'] = syntax['Identifier']
	syntax['vimFunc'] = syntax['Function']
	syntax['vimUserFunc'] = syntax['Function']
	syntax['helpSpecial'] = syntax['Special']
	syntax['vimSet'] = syntax['Normal']
	syntax['vimSetEqual'] = syntax['Normal']
	syntax['diffAdded'] = syntax['Statement']
	syntax['diffLine'] = syntax['Identifier']
	syntax['gitcommitUntracked'] = syntax['gitcommitComment']
	syntax['gitcommitDiscarded'] = syntax['gitcommitComment']
	syntax['gitcommitSelected'] = syntax['gitcommitComment']
	syntax['gitcommitNoBranch'] = syntax['gitcommitBranch']
	syntax['gitcommitDiscardedArrow'] = syntax['gitcommitDiscardedFile']
	syntax['gitcommitSelectedArrow'] = syntax['gitcommitSelectedFile']
	syntax['gitcommitUnmergedArrow'] = syntax['gitcommitUnmergedFile']
	syntax['jsFuncCall'] = syntax['Function']
	syntax['rubySymbol'] = syntax['String']
	syntax['hsImportParams'] = syntax['Delimiter']
	syntax['hsDelimTypeExport'] = syntax['Delimiter']
	syntax['hsModuleStartLabel'] = syntax['hsStructure']
	syntax['hsModuleWhereLabel'] = syntax['hsModuleStartLabel']
	syntax['pandocVerbatimBlockDeep'] = syntax['pandocVerbatimBlock']
	syntax['pandocCodeBlock'] = syntax['pandocVerbatimBlock']
	syntax['pandocCodeBlockDelim'] = syntax['pandocVerbatimBlock']
	syntax['pandocTableStructureTop'] = syntax['pandocTableStructre']
	syntax['pandocTableStructureEnd'] = syntax['pandocTableStructre']
	syntax['pandocEscapedCharacter'] = syntax['pandocEscapePair']
	syntax['pandocLineBreak'] = syntax['pandocEscapePair']
	syntax['pandocMetadataTitle'] = syntax['pandocMetadata']

	-- TreeSitter
	-- syntax['TSAnnotation'] = syntax['']
	syntax['TSBoolean'] = syntax['Constant']
	syntax['TSCharacter'] = syntax['Constant']
	syntax['TSComment'] = syntax['Comment']
	syntax['TSConditional'] = syntax['Conditional']
	syntax['TSConstant'] = syntax['Constant']
	syntax['TSConstBuiltin'] = syntax['Constant']
	syntax['TSConstMacro'] = syntax['Constant']
	syntax['TSError'] = {fg=colors.red}
	syntax['TSException'] = syntax['Exception']
	syntax['TSField'] = syntax['Identifier']
	syntax['TSFloat'] = syntax['Float']
	syntax['TSFunction'] = syntax['Function']
	syntax['TSFuncBuiltin'] = syntax['Function']
	syntax['TSFuncMacro'] = syntax['Function']
	syntax['TSInclude'] = syntax['Include']
	syntax['TSKeyword'] = syntax['Keyword']
	syntax['TSLabel'] = syntax['Label']
	syntax['TSMethod'] = syntax['Function']
	syntax['TSNamespace'] = syntax['Identifier']
	syntax['TSNumber'] = syntax['Constant']
	syntax['TSOperator'] = syntax['Operator']
	syntax['TSParameterReference'] = syntax['Identifier']
	syntax['TSProperty'] = syntax['TSField']
	syntax['TSPunctDelimiter'] = syntax['Delimiter']
	syntax['TSPunctBracket'] = syntax['Delimiter']
	syntax['TSPunctSpecial'] = syntax['Special']
	syntax['TSRepeat'] = syntax['Repeat']
	syntax['TSString'] = syntax['Constant']
	syntax['TSStringRegex'] = syntax['Constant']
	syntax['TSStringEscape'] = syntax['Constant']
	syntax['TSStrong'] = {fg=colors.base1,bg=colors.base03,style='bold',cterm='none'}
	syntax['TSConstructor'] = syntax['Function']
	syntax['TSKeywordFunction'] = syntax['Identifier']
	syntax['TSLiteral'] = syntax['Normal']
	syntax['TSParameter'] = syntax['Identifier']
	syntax['TSVariable'] = {fg=colors.base0}
	syntax['TSVariableBuiltin'] = syntax['Identifier']
	syntax['TSTag'] = syntax['Special']
	syntax['TSTagDelimiter'] = syntax['Delimiter']
	syntax['TSTitle'] = syntax['Title']
	syntax['TSType'] = syntax['Type']
	syntax['TSTypeBuiltin'] = syntax['Type']
	-- syntax['TSEmphasis'] = syntax['']

	syntax['DiagnosticError'] = {fg=colors.red,guisp=colors.red,style='none'}
	syntax['DiagnosticWarning'] = {fg=colors.yellow,guisp=colors.yellow,style='none'}
	syntax['DiagnosticInformation'] = {fg=colors.cyan,guisp=colors.cyan,style='none'}
	syntax['DiagnosticHint'] = {fg=colors.green,guisp=colors.green,style='none'}
	syntax['DiagnosticUnderlineError'] = {fg=colors.none,guisp=colors.red,style='underline'}
	syntax['DiagnosticUnderlineWarning'] = {fg=colors.none,guisp=colors.yellow,style='underline'}
	syntax['DiagnosticUnderlineInformation'] = {fg=colors.none,guisp=colors.cyan,style='underline'}
	syntax['DiagnosticUnderlineHint'] = {fg=colors.none,guisp=colors.green,style='underline'}

	syntax['LspReferenceRead'] = {fg=colors.none,style='underline'}
	syntax['LspReferenceText'] = syntax['LspReferenceRead']
	syntax['LspReferenceWrite'] = {fg=colors.none,style='underline,bold'}

	syntax['LspSagaFinderSelection'] = syntax['Search']
	syntax['TargetWord'] = syntax['Title']

	syntax['GitSignsAdd'] = syntax['DiffAdd']
	syntax['GitSignsChange'] = syntax['DiffChange']
	syntax['GitSignsDelete'] = syntax['DiffDelete']

	syntax['VGitSignAdd'] = syntax['DiffAdd']
	syntax['VgitSignChange'] = syntax['DiffChange']
	syntax['VGitSignRemove'] = syntax['DiffDelete']

	-- nvim-cmp syntax support
	syntax['CmpDocumentation' ] = {fg=colors.base1, bg=colors.base02 }
	syntax['CmpDocumentationBorder' ] = {fg=colors.base1, bg=colors.base02 }

	syntax['CmpItemAbbr' ] = {fg=colors.base0, bg=colors.none }
	syntax['CmpItemAbbrDeprecated' ] = {fg=colors.base0, bg=colors.none }
	syntax['CmpItemAbbrMatch' ] = {fg=colors.base1, bg=colors.none }
	syntax['CmpItemAbbrMatchFuzzy' ] = {fg=colors.base1, bg=colors.none }

	syntax['CmpItemKindDefault' ] = {fg=colors.base0, bg=colors.none }
	syntax['CmpItemMenu' ] = {fg=colors.base0, bg=colors.none }
	syntax['CmpItemKindKeyword' ] = {fg=colors.yellow, bg=colors.none }
	syntax['CmpItemKindVariable' ] = {fg=colors.green, bg=colors.none }
	syntax['CmpItemKindConstant' ] = {fg=colors.base0, bg=colors.none }
	syntax['CmpItemKindReference' ] = {fg=colors.base0, bg=colors.none }
	syntax['CmpItemKindValue' ] = {fg=colors.base0, bg=colors.none }
	syntax['CmpItemKindFunction' ] = {fg=colors.blue, bg=colors.none }
	syntax['CmpItemKindMethod' ] = {fg=colors.blue, bg=colors.none }
	syntax['CmpItemKindConstructor' ] = {fg=colors.blue, bg=colors.none }
	syntax['CmpItemKindClass' ] = {fg=colors.red, bg=colors.none }
	syntax['CmpItemKindInterface' ] = {fg=colors.base0, bg=colors.none }
	syntax['CmpItemKindStruct' ] = {fg=colors.base0, bg=colors.none }
	syntax['CmpItemKindEvent' ] = {fg=colors.base0, bg=colors.none }
	syntax['CmpItemKindEnum' ] = {fg=colors.base0, bg=colors.none }
	syntax['CmpItemKindUnit' ] = {fg=colors.base0, bg=colors.none }
	syntax['CmpItemKindModule' ] = {fg=colors.base0, bg=colors.none }
	syntax['CmpItemKindProperty' ] = {fg=colors.base0, bg=colors.none }
	syntax['CmpItemKindField' ] = {fg=colors.base0, bg=colors.none }
	syntax['CmpItemKindTypeParameter' ] = {fg=colors.base0, bg=colors.none }
	syntax['CmpItemKindEnumMember' ] = {fg=colors.base0, bg=colors.none }
	syntax['CmpItemKindOperator' ] = {fg=colors.base0, bg=colors.none }
	syntax['CmpItemKindSnippet' ] = {fg=colors.orange, bg=colors.none }

	for group, highlights in pairs(syntax) do
		utils.highlighter(group, highlights)
	end
end

function M.terminal_colors(colors)
	g.terminal_color_0 = colors.base02[1] -- '#073642'
	g.terminal_color_1 = colors.red[1] -- '#dc322f'
	g.terminal_color_2 = colors.green[1] -- '#859900'
	g.terminal_color_3 = colors.yellow[1] -- '#b58900'
	g.terminal_color_4 = colors.blue[1] -- '#268bd2'
	g.terminal_color_5 = colors.magenta[1] -- '#d33682'
	g.terminal_color_6 = colors.cyan[1] -- '#2aa198'
	g.terminal_color_7 = colors.base2[1] -- '#eee8d5'
	g.terminal_color_8 = colors.base03[1] -- '#002b36'
	g.terminal_color_9 = colors.orange[1] -- '#cb4b16'
	g.terminal_color_10 = colors.base01[1] -- '#586e75'
	g.terminal_color_11 = colors.base00[1] -- '#657b83'
	g.terminal_color_12 = colors.base0[1] -- '#839496'
	g.terminal_color_13 = colors.violet[1] -- '#6c71c4'
	g.terminal_color_14 = colors.base1[1] -- '#93a1a1'
	g.terminal_color_15 = colors.base3[1] -- '#fdf6e3'
end

return M
