local M = {}
local cmd = vim.cmd
local g = vim.g
local o = vim.o
local fn = vim.fn
local utils = require('solarized.utils')

if o.bg == 'dark' then
	colors = require('solarized.solarized-flat.solarized-dark').setup()
else
	colors = require('solarized.solarized-flat.solarized-light').setup()
end

cmd('hi clear')

utils.default_settings()

if fn.exists("syntax_on") then
	cmd('syntax reset')
end

g.colors_name = 'solarized-flat'

function M.load_syntax()
	local syntax = {}
	syntax['Normal'] = {fg=colors.base0,bg=utils.termtrans(colors.base03)}
	syntax['CursorLine'] = {fg=colors.none,bg=utils.termtrans(colors.base02)}
	syntax['Terminal'] = syntax['Normal']
	syntax['ToolbarButton'] = {fg=colors.base1,bg=utils.termtrans(colors.base02),style='bold'}
	syntax['ToolbarLine'] = {fg=colors.none,bg=utils.termtrans(colors.base02)}

	if g.solarized_visibility == 'high' then
		syntax['CursorLineNr'] = {fg=colors.orange,bg=colors.none,style='bold'}
		syntax['NonText'] = {fg=colors.orange,bg=colors.none,style='bold'}
		syntax['SpecialKey'] = {fg=colors.orange,bg=colors.none,style='reverse'}
		syntax['SpellBad'] = {fg=colors.violet,bg=colors.base2,guisp=colors.red,style='reverse,underline'}
		syntax['SpellCap'] = {fg=colors.violet,bg=colors.base2,guisp=colors.red,style='reverse,underline'}
		syntax['SpellLocal'] = {fg=colors.yellow,bg=colors.base2,guisp=colors.red,style='reverse,underline'}
		syntax['SpellRare'] = {fg=colors.cyan,bg=colors.base2,guisp=colors.red,style='reverse,underline'}
		syntax['Title'] = {fg=colors.yellow,bg=colors.none,style='bold',cterm='bold'}
	elseif g.solarized_visibility == 'low' then
		syntax['CursorLineNr'] = {fg=colors.base01,bg=colors.none,style='bold'}
		syntax['NonText'] = {fg=colors.base02,bg=colors.none,style='bold'}
		syntax['SpecialKey'] = {fg=colors.base02,bg=colors.none,style='reverse'}
		syntax['SpellBad'] = {fg=colors.violet,bg=colors.none,guisp=colors.violet,style='underline'}
		syntax['SpellCap'] = {fg=colors.violet,bg=colors.none,guisp=colors.violet,style='underline'}
		syntax['SpellLocal'] = {fg=colors.yellow,bg=colors.none,guisp=colors.yellow,style='underline'}
		syntax['SpellRare'] = {fg=colors.cyan,bg=colors.none,guisp=colors.cyan,style='underline'}
		syntax['Title'] = {fg=colors.base01,bg=colors.none,style='bold',cterm='bold'}
	else
		syntax['CursorLineNr'] = {fg=colors.base0,bg=colors.none,style='bold'}
		syntax['NonText'] = {fg=colors.base00,bg=colors.none,style='bold'}
		syntax['SpecialKey'] = {fg=colors.base00,bg=colors.base02,style='bold'}
		syntax['SpellBad'] = {fg=colors.violet,bg=colors.none,guisp=colors.violet,style='underline'}
		syntax['SpellCap'] = {fg=colors.violet,bg=colors.none,guisp=colors.violet,style='underline'}
		syntax['SpellLocal'] = {fg=colors.yellow,bg=colors.none,guisp=colors.yellow,style='underline'}
		syntax['SpellRare'] = {fg=colors.cyan,bg=colors.none,guisp=colors.cyan,style='underline'}
		syntax['Title'] = {fg=colors.orange,bg=colors.none,style='bold',cterm='bold'}
	end

	if g.solarized_diffmode == 'high' then
		syntax['DiffAdd'] = {fg=colors.green,bg=colors.none,style='reverse'}
		syntax['DiffChange'] = {fg=colors.yellow,bg=colors.none,style='reverse'}
		syntax['DiffDelete'] = {fg=colors.red,bg=colors.none,style='reverse'}
		syntax['DiffText'] = {fg=colors.blue,bg=colors.none,style='reverse'}
	elseif g.solarized_diffmode == 'low' then
		syntax['DiffAdd'] = {fg=colors.green,bg=colors.none,guisp=colors.green}
		syntax['DiffChange'] = {fg=colors.yellow,bg=colors.none,guisp=colors.yellow}
		syntax['DiffDelete'] = {fg=colors.red,bg=colors.none,style='bold'}
		syntax['DiffText'] = {fg=colors.blue,bg=colors.none,guisp=colors.blue}
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
	syntax['Conceal'] = {fg=colors.blue,bg=colors.none}
	syntax['CursorColumn'] = {fg=colors.none,bg=colors.base02}
	syntax['Directory'] = {fg=colors.blue,bg=colors.none}
	syntax['EndOfBuffer'] = {fg=colors.none,bg=colors.none,ctermfg=colors.none,ctermbg=colors.none}
	syntax['ErrorMsg'] = {fg=colors.red,bg=colors.base3,style='reverse'}
	syntax['FoldColumn'] = {fg=colors.base0,bg=colors.none}
	syntax['Folded'] = {fg=colors.base0,bg=colors.none,guisp=colors.base03,style='bold'}
	syntax['IncSearch'] = {fg=colors.orange,bg=colors.none,style='standout'}
	syntax['LineNr'] = {fg=colors.base01,bg=colors.none}
	syntax['MatchParen'] = {fg=colors.base3,bg=colors.base02,style='bold'}
	syntax['ModeMsg'] = {fg=colors.blue,bg=colors.none}
	syntax['MoreMsg'] = {fg=colors.blue,bg=colors.none}
	syntax['Pmenu'] = {fg=colors.base0,bg=colors.base02}
	syntax['PmenuSbar'] = {fg=colors.none,bg=colors.base02}
	syntax['PmenuSel'] = {fg=colors.base2,bg=colors.base01}
	syntax['PmenuThumb'] = {fg=colors.none,bg=colors.base01}
	syntax['Question'] = {fg=colors.cyan,bg=colors.none,style='bold'}
	syntax['Search'] = {fg=colors.yellow,bg=colors.none,style='reverse'}
	syntax['SignColumn'] = {fg=colors.base0,bg=colors.none}
	syntax['TabLine'] = {fg=colors.base01,bg=colors.base02}
	syntax['TabLineFill'] = {fg=colors.base01,bg=colors.base02}
	syntax['VertSplit'] = {fg=colors.base01,bg=colors.base02}
	syntax['Visual'] = {fg=colors.base01,bg=colors.base03,style='reverse'}
	syntax['VisualNOS'] = {fg=colors.none,bg=colors.base02,style='reverse'}
	syntax['WarningMsg'] = {fg=colors.orange,bg=colors.none,style='bold'}
	syntax['WildMenu'] = {fg=colors.base00,bg=colors.base2,style='reverse'}
	syntax['Comment'] = {fg=colors.base01,bg=colors.none,style=utils.italics()}
	syntax['Constant'] = {fg=colors.cyan,bg=colors.none}
	syntax['CursorIM'] = {fg=colors.none,bg=colors.base0}
	syntax['Error'] = {fg=colors.red,bg=colors.base3,style='bold,reverse'}
	syntax['Identifier'] = {fg=colors.blue,bg=colors.none}
	syntax['Ignore'] = {fg=colors.none,bg=colors.none,ctermfg=colors.none,ctermbg=colors.none}
	syntax['PreProc'] = {fg=colors.orange,bg=colors.none}
	syntax['Special'] = {fg=colors.orange,bg=colors.none}
	syntax['Statement'] = {fg=colors.green,bg=colors.none}
	syntax['Todo'] = {fg=colors.magenta,bg=colors.none,style='bold'}
	syntax['Type'] = {fg=colors.yellow,bg=colors.none}
	syntax['Underlined'] = {fg=colors.violet,bg=colors.none}
	syntax['InsertMode'] = {fg=colors.base02,bg=colors.cyan,style='bold,reverse'}
	syntax['ReplaceMode'] = {fg=colors.base02,bg=colors.orange,style='bold,reverse'}
	syntax['VisualMode'] = {fg=colors.base02,bg=colors.magenta,style='bold,reverse'}
	syntax['CommandMode'] = {fg=colors.base02,bg=colors.magenta,style='bold,reverse'}
	syntax['vimCommentString'] = {fg=colors.violet,bg=colors.none}
	syntax['vimCommand'] = {fg=colors.yellow,bg=colors.none}
	syntax['vimCmdSep'] = {fg=colors.blue,bg=colors.none,style='bold'}
	syntax['helpExample'] = {fg=colors.base1,bg=colors.none}
	syntax['helpOption'] = {fg=colors.cyan,bg=colors.none}
	syntax['helpNote'] = {fg=colors.magenta,bg=colors.none}
	syntax['helpVim'] = {fg=colors.magenta,bg=colors.none}
	syntax['helpHyperTextJump'] = {fg=colors.blue,bg=colors.none}
	syntax['helpHyperTextEntry'] = {fg=colors.green,bg=colors.none}
	syntax['vimIsCommand'] = {fg=colors.base00,bg=colors.none}
	syntax['vimSynMtchOpt'] = {fg=colors.yellow,bg=colors.none}
	syntax['vimSynType'] = {fg=colors.cyan,bg=colors.none}
	syntax['vimHiLink'] = {fg=colors.blue,bg=colors.none}
	syntax['vimHiGroup'] = {fg=colors.blue,bg=colors.none}
	syntax['vimGroup'] = {fg=colors.blue,bg=colors.none,style='bold'}
	syntax['gitcommitComment'] = {fg=colors.base01,bg=colors.none,style=utils.italics()}
	syntax['gitcommitUnmerged'] = {fg=colors.green,bg=colors.none,style='bold'}
	syntax['gitcommitOnBranch'] = {fg=colors.base01,bg=colors.none,style='bold'}
	syntax['gitcommitBranch'] = {fg=colors.magenta,bg=colors.none,style='bold'}
	syntax['gitcommitUnmerged'] = {fg=colors.green,bg=colors.none,style='bold'}
	syntax['gitcommitOnBranch'] = {fg=colors.base01,bg=colors.none,style='bold'}
	syntax['gitcommitBranch'] = {fg=colors.magenta,bg=colors.none,style='bold'}
	syntax['gitcommitdiscardedtype'] = {fg=colors.red,bg=colors.none}
	syntax['gitcommitselectedtype'] = {fg=colors.green,bg=colors.none}
	syntax['gitcommitHeader'] = {fg=colors.base01,bg=colors.none}
	syntax['gitcommitUntrackedFile'] = {fg=colors.cyan,bg=colors.none,style='bold'}
	syntax['gitcommitDiscardedFile'] = {fg=colors.red,bg=colors.none,style='bold'}
	syntax['gitcommitSelectedFile'] = {fg=colors.green,bg=colors.none,style='bold'}
	syntax['gitcommitUnmergedFile'] = {fg=colors.yellow,bg=colors.none,style='bold'}
	syntax['gitcommitFile'] = {fg=colors.base0,bg=colors.none,style='bold'}
	syntax['htmlTag'] = {fg=colors.base01,bg=colors.none}
	syntax['htmlEndTag'] = {fg=colors.base01,bg=colors.none}
	syntax['htmlTagN'] = {fg=colors.base1,bg=colors.none,style='bold'}
	syntax['htmlTagName'] = {fg=colors.blue,bg=colors.none,style='bold'}
	syntax['htmlSpecialTagName'] = {fg=colors.blue,bg=colors.none,style=utils.italics()}
	syntax['htmlArg'] = {fg=colors.base00,bg=colors.none}
	syntax['javaScript'] = {fg=colors.yellow,bg=colors.none}
	syntax['perlHereDoc'] = {fg=colors.base1,bg=colors.base03}
	syntax['perlVarPlain'] = {fg=colors.yellow,bg=colors.base03}
	syntax['perlStatementFileDesc'] = {fg=colors.cyan,bg=colors.base03}
	syntax['texstatement'] = {fg=colors.cyan,bg=colors.base03}
	syntax['texmathzonex'] = {fg=colors.yellow,bg=colors.base03}
	syntax['texmathmatcher'] = {fg=colors.yellow,bg=colors.base03}
	syntax['texreflabel'] = {fg=colors.yellow,bg=colors.base03}
	syntax['rubyDefine'] = {fg=colors.base1,bg=colors.base03,style='bold'}
	syntax['rubyBoolean'] = {fg=colors.magenta,bg=colors.base03}
	syntax['cPreCondit'] = {fg=colors.orange,bg=colors.none}
	syntax['VarId'] = {fg=colors.blue,bg=colors.none}
	syntax['ConId'] = {fg=colors.yellow,bg=colors.none}
	syntax['hsImport'] = {fg=colors.magenta,bg=colors.none}
	syntax['hsString'] = {fg=colors.base00,bg=colors.none}
	syntax['hsStructure'] = {fg=colors.cyan,bg=colors.none}
	syntax['hs_hlFunctionName'] = {fg=colors.blue,bg=colors.none}
	syntax['hsStatement'] = {fg=colors.cyan,bg=colors.none}
	syntax['hsImportLabel'] = {fg=colors.cyan,bg=colors.none}
	syntax['hs_OpFunctionName'] = {fg=colors.yellow,bg=colors.none}
	syntax['hs_DeclareFunction'] = {fg=colors.orange,bg=colors.none}
	syntax['hsVarSym'] = {fg=colors.cyan,bg=colors.none}
	syntax['hsType'] = {fg=colors.yellow,bg=colors.none}
	syntax['hsTypedef'] = {fg=colors.cyan,bg=colors.none}
	syntax['hsModuleName'] = {fg=colors.green,bg=colors.none}
	syntax['hsNiceOperator'] = {fg=colors.cyan,bg=colors.none}
	syntax['hsniceoperator'] = {fg=colors.cyan,bg=colors.none}
	syntax['pandocTitleBlock'] = {fg=colors.blue,bg=colors.none}
	syntax['pandocTitleBlockTitle'] = {fg=colors.blue,bg=colors.none,style='bold'}
	syntax['pandocTitleComment'] = {fg=colors.blue,bg=colors.none,style='bold'}
	syntax['pandocComment'] = {fg=colors.base01,bg=colors.none,style=utils.italics()}
	syntax['pandocVerbatimBlock'] = {fg=colors.yellow,bg=colors.none}
	syntax['pandocBlockQuote'] = {fg=colors.blue,bg=colors.none}
	syntax['pandocBlockQuoteLeader1'] = {fg=colors.blue,bg=colors.none}
	syntax['pandocBlockQuoteLeader2'] = {fg=colors.cyan,bg=colors.none}
	syntax['pandocBlockQuoteLeader3'] = {fg=colors.yellow,bg=colors.none}
	syntax['pandocBlockQuoteLeader4'] = {fg=colors.red,bg=colors.none}
	syntax['pandocBlockQuoteLeader5'] = {fg=colors.base0,bg=colors.none}
	syntax['pandocBlockQuoteLeader6'] = {fg=colors.base01,bg=colors.none}
	syntax['pandocListMarker'] = {fg=colors.magenta,bg=colors.none}
	syntax['pandocListReference'] = {fg=colors.magenta,bg=colors.none}
	syntax['pandocDefinitionBlock'] = {fg=colors.violet,bg=colors.none}
	syntax['pandocDefinitionTerm'] = {fg=colors.violet,bg=colors.none,style='standout'}
	syntax['pandocDefinitionIndctr'] = {fg=colors.violet,bg=colors.none,style='bold'}
	syntax['pandocEmphasisDefinition'] = {fg=colors.violet,bg=colors.none,style=utils.italics()}
	syntax['pandocEmphasisNestedDefinition'] = {fg=colors.violet,bg=colors.none,style='bold'}
	syntax['pandocStrongEmphasisDefinition'] = {fg=colors.violet,bg=colors.none,style='bold'}
	syntax['pandocStrongEmphasisNestedDefinition'] = {fg=colors.violet,bg=colors.none,style='bold'}
	syntax['pandocStrongEmphasisEmphasisDefinition'] = {fg=colors.violet,bg=colors.none,style='bold'}
	syntax['pandocStrikeoutDefinition'] = {fg=colors.violet,bg=colors.none,style='reverse'}
	syntax['pandocVerbatimInlineDefinition'] = {fg=colors.violet,bg=colors.none}
	syntax['pandocSuperscriptDefinition'] = {fg=colors.violet,bg=colors.none}
	syntax['pandocSubscriptDefinition'] = {fg=colors.violet,bg=colors.none}
	syntax['pandocTable'] = {fg=colors.blue,bg=colors.none}
	syntax['pandocTableStructure'] = {fg=colors.blue,bg=colors.none}
	syntax['pandocTableZebraLight'] = {fg=colors.blue,bg=colors.base03}
	syntax['pandocTableZebraDark'] = {fg=colors.blue,bg=colors.base02}
	syntax['pandocEmphasisTable'] = {fg=colors.blue,bg=colors.none,style=utils.italics()}
	syntax['pandocEmphasisNestedTable'] = {fg=colors.blue,bg=colors.none,style='bold'}
	syntax['pandocStrongEmphasisTable'] = {fg=colors.blue,bg=colors.none,style='bold'}
	syntax['pandocStrongEmphasisNestedTable'] = {fg=colors.blue,bg=colors.none,style='bold'}
	syntax['pandocStrongEmphasisEmphasisTable'] = {fg=colors.blue,bg=colors.none,style='bold'}
	syntax['pandocStrikeoutTable'] = {fg=colors.blue,bg=colors.none,style='reverse'}
	syntax['pandocVerbatimInlineTable'] = {fg=colors.blue,bg=colors.none}
	syntax['pandocSuperscriptTable'] = {fg=colors.blue,bg=colors.none}
	syntax['pandocSubscriptTable'] = {fg=colors.blue,bg=colors.none}
	syntax['pandocHeading'] = {fg=colors.orange,bg=colors.none,style='bold'}
	syntax['pandocHeadingMarker'] = {fg=colors.orange,bg=colors.none,style='bold'}
	syntax['pandocEmphasisHeading'] = {fg=colors.orange,bg=colors.none,style='bold'}
	syntax['pandocEmphasisNestedHeading'] = {fg=colors.orange,bg=colors.none,style='bold'}
	syntax['pandocStrongEmphasisHeading'] = {fg=colors.orange,bg=colors.none,style='bold'}
	syntax['pandocStrongEmphasisNestedHeading'] = {fg=colors.orange,bg=colors.none,style='bold'}
	syntax['pandocStrongEmphasisEmphasisHeading'] = {fg=colors.orange,bg=colors.none,style='bold'}
	syntax['pandocStrikeoutHeading'] = {fg=colors.orange,bg=colors.none,style='reverse'}
	syntax['pandocVerbatimInlineHeading'] = {fg=colors.orange,bg=colors.none,style='bold'}
	syntax['pandocSuperscriptHeading'] = {fg=colors.orange,bg=colors.none,style='bold'}
	syntax['pandocSubscriptHeading'] = {fg=colors.orange,bg=colors.none,style='bold'}
	syntax['pandocLinkDelim'] = {fg=colors.base01,bg=colors.none}
	syntax['pandocLinkLabel'] = {fg=colors.blue,bg=colors.none}
	syntax['pandocLinkText'] = {fg=colors.blue,bg=colors.none}
	syntax['pandocLinkURL'] = {fg=colors.base00,bg=colors.none}
	syntax['pandocLinkTitle'] = {fg=colors.base00,bg=colors.none}
	syntax['pandocLinkTitleDelim'] = {fg=colors.base01,bg=colors.none,guisp=colors.base00}
	syntax['pandocLinkDefinition'] = {fg=colors.cyan,bg=colors.none,guisp=colors.base00}
	syntax['pandocLinkDefinitionID'] = {fg=colors.blue,bg=colors.none,style='bold'}
	syntax['pandocImageCaption'] = {fg=colors.violet,bg=colors.none,style='bold'}
	syntax['pandocFootnoteLink'] = {fg=colors.green,bg=colors.none}
	syntax['pandocFootnoteDefLink'] = {fg=colors.green,bg=colors.none,style='bold'}
	syntax['pandocFootnoteInline'] = {fg=colors.green,bg=colors.none,style='bold'}
	syntax['pandocFootnote'] = {fg=colors.green,bg=colors.none}
	syntax['pandocCitationDelim'] = {fg=colors.magenta,bg=colors.none}
	syntax['pandocCitation'] = {fg=colors.magenta,bg=colors.none}
	syntax['pandocCitationID'] = {fg=colors.magenta,bg=colors.none}
	syntax['pandocCitationRef'] = {fg=colors.magenta,bg=colors.none}
	syntax['pandocStyleDelim'] = {fg=colors.base01,bg=colors.none}
	syntax['pandocEmphasis'] = {fg=colors.base0,bg=colors.none,style=utils.italics()}
	syntax['pandocEmphasisNested'] = {fg=colors.base0,bg=colors.none,style='bold'}
	syntax['pandocStrongEmphasis'] = {fg=colors.base0,bg=colors.none,style='bold'}
	syntax['pandocStrongEmphasisNested'] = {fg=colors.base0,bg=colors.none,style='bold'}
	syntax['pandocStrongEmphasisEmphasis'] = {fg=colors.base0,bg=colors.none,style='bold'}
	syntax['pandocStrikeout'] = {fg=colors.base01,bg=colors.none,style='reverse'}
	syntax['pandocVerbatimInline'] = {fg=colors.yellow,bg=colors.none}
	syntax['pandocSuperscript'] = {fg=colors.violet,bg=colors.none}
	syntax['pandocSubscript'] = {fg=colors.violet,bg=colors.none}
	syntax['pandocRule'] = {fg=colors.blue,bg=colors.none,style='bold'}
	syntax['pandocRuleLine'] = {fg=colors.blue,bg=colors.none,style='bold'}
	syntax['pandocEscapePair'] = {fg=colors.red,bg=colors.none,style='bold'}
	syntax['pandocCitationRef'] = {fg=colors.magenta,bg=colors.none}
	syntax['pandocNonBreakingSpace'] = {fg=colors.red,bg=colors.none,style='reverse'}
	syntax['pandocMetadataDelim'] = {fg=colors.base01,bg=colors.none}
	syntax['pandocMetadata'] = {fg=colors.blue,bg=colors.none}
	syntax['pandocMetadataKey'] = {fg=colors.blue,bg=colors.none}
	syntax['pandocMetadata'] = {fg=colors.blue,bg=colors.none,style='bold'}

	syntax['Boolean'] = syntax['Constant']
	syntax['Character'] = syntax['Constant']
	syntax['Conditional'] = syntax['Statement']
	syntax['Debug'] = syntax['Special']
	syntax['Define'] = syntax['PreProc']
	syntax['Delimiter'] = syntax['Special']
	syntax['Exception'] = syntax['Statement']
	syntax['Float'] = syntax['Constant']
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
	syntax['rubySymbol'] = syntax['Type']
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
	syntax['TSError'] = syntax['Error']
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
	syntax['TSVariable'] = syntax['Identifier']
	syntax['TSVariableBuiltin'] = syntax['Identifier']
	syntax['TSTag'] = syntax['Special']
	syntax['TSTagDelimiter'] = syntax['Delimiter']
	syntax['TSTitle'] = syntax['Title']
	syntax['TSType'] = syntax['Type']
	syntax['TSTypeBuiltin'] = syntax['Type']
	-- syntax['TSEmphasis'] = syntax['']

	syntax['LspDiagnosticsDefaultError'] = {fg=colors.red,bg=colors.none,guisp=colors.red,style='underline'}
	syntax['LspDiagnosticsDefaultInformation'] = {fg=colors.cyan,bg=colors.none,guisp=colors.cyan,style='underline'}
	syntax['LspDiagnosticsDefaultWarning'] = {fg=colors.yellow,bg=colors.none,guisp=colors.yellow,style='underline'}
	syntax['LspDiagnosticsDefaultHint'] = {fg=colors.green,bg=colors.none,guisp=colors.green,style='underline'}
	syntax['LspDiagnosticsUnderlineError'] = syntax['LspDiagnosticsDefaultError']
	syntax['LspDiagnosticsUnderlineWarning'] = syntax['LspDiagnosticsDefaultWarning']
	syntax['LspDiagnosticsUnderlineInformation'] = syntax['LspDiagnosticsDefaultInformation']
	syntax['LspDiagnosticsUnderlineHint'] = syntax['LspDiagnosticsDefaultHint']

	syntax['LspSagaFinderSelection'] = syntax['Search']
	syntax['DiagnosticError'] = syntax['LspDiagnosticsDefaultError'] 
	syntax['DiagnosticWarning'] = syntax['LspDiagnosticsDefaultWarning'] 
	syntax['DiagnosticInformation'] = syntax['LspDiagnosticsDefaultInformation'] 
	syntax['DiagnosticHint'] = syntax['LspDiagnosticsDefaultHint'] 
	syntax['TargetWord'] = syntax['Title']

	for group, colors in pairs(syntax) do
		utils.highlighter(group, colors)
	end
end

M.load_syntax()
