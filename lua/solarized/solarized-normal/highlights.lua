local M = {}
local cmd = vim.cmd
local g = vim.g
local o = vim.o
local fn = vim.fn

if o.bg == 'dark' then
	colors = require('solarized.solarized-normal.solarized-dark').setup()
else
	colors = require('solarized.solarized-normal.solarized-light').setup()
end

cmd('hi clear')

if fn.exists("syntax_on") then
	cmd('syntax reset')
end

g.colors_name = 'solarized'

local settings = {
	solarized_visibility = 'normal',
	solarized_diffmode = 'normal',
	solarized_termtrans = 0,
	solarized_statusline = 'normal',
	solarized_italics = 1
}

for key,val in pairs(settings) do
	if g[key] == nil then
		g[key] = val
	end
end


local setup = function(group, colors)
	if colors.guisp == nil then
		cmd(string.format('hi %s guifg=%s guibg=%s gui=%s', group, colors.guifg, colors.guibg, colors.gui))
	else
		cmd(string.format('hi %s guifg=%s guibg=%s guisp=%s gui=%s', group, colors.guifg, colors.guibg, colors.guisp, colors.gui))
	end
end

function M.load_syntax()

	local italics = function()
		if g.solarized_italics == 1 then
			return 'italic'
		else
			return 'none'
		end
	end

	local termtrans = function(color)
		if g.solarized_termtrans == 1 then
			return 'none'
		else
			return color
		end
	end

	local syntax = {}

	syntax['Normal'] = {guifg=colors.base1,guibg=termtrans(colors.base03),gui='none'}
	syntax['FoldColumn'] = {guifg=colors.base0,guibg=termtrans(colors.base02),gui='none'}
	syntax['Folded'] = {guifg=colors.base0,guibg=termtrans(colors.base02),guisp=colors.base03,gui='bold'}
	syntax['Terminal'] = {guifg=fg,guibg=termtrans(colors.base03),gui='none'}
	syntax['ToolbarButton'] = {guifg=colors.base1,guibg=termtrans(colors.base02),gui='bold'}
	syntax['ToolbarLine'] = {guifg='none',guibg=termtrans(colors.base02),gui='none'}
	syntax['CursorLine'] = {guifg='none',guibg=termtrans(colors.base02),gui='none'}
	syntax['LineNr'] = {guifg=colors.base00,guibg=termtrans(colors.base02),gui='none'}

	if g.solarized_diffmode == 'low' then
		syntax['DiffAdd'] = {guifg=colors.green, guibg='none', guisp=colors.green, gui='none'}
		syntax['DiffChange'] = {guifg=colors.yellow, guibg='none', guisp=colors.yellow, gui='none'}
		syntax['DiffDelete'] = {guifg=colors.red, guibg='none', gui='bold'}
		syntax['DiffText'] = {guifg=colors.blue, guibg='none', guisp=colors.blue, gui='none'}
	elseif g.solarized_diffmode == 'high' then
		syntax['DiffAdd'] = {guifg=colors.green, guibg='none', gui='reverse'}
		syntax['DiffChange'] = {guifg=colors.yellow, guibg='none', gui='reverse'}
		syntax['DiffDelete'] = {guifg=colors.red, guibg='none', gui='reverse'}
		syntax['DiffText'] = {guifg=colors.blue, guibg='none', gui='reverse'}
	else
		syntax['DiffAdd'] = {guifg=colors.green,guibg=colors.base02,guisp=colors.green,gui='none'}
		syntax['DiffChange'] = {guifg=colors.yellow,guibg=colors.base02,guisp=colors.yellow,gui='none'}
		syntax['DiffDelete'] = {guifg=colors.red,guibg=colors.base02,gui='bold'}
		syntax['DiffText'] = {guifg=colors.blue,guibg=colors.base02,guisp=colors.blue,gui='none'}
	end

	if g.solarized_statusline == 'low' then
		syntax['StatusLine'] = {guifg=colors.base01, guibg=colors.base2, gui='reverse'}
		syntax['StatusLineNC'] = {guifg=colors.base01, guibg=colors.base02, gui='reverse'}
		syntax['TabLine'] = {guifg=colors.base01, guibg=colors.base02, gui='reverse'}
		syntax['TabLineFill'] = {guifg=colors.base01, guibg=colors.base02, gui='reverse'}
		syntax['TabLineSel'] = {guifg=colors.base0, guibg=colors.base3, gui='reverse'}
		syntax['VertSplit'] = {guifg=colors.base02, guibg=colors.base01, gui='none'}
	elseif g.solarized_statusline == 'flat' then
		syntax['StatusLine'] = {guifg=colors.base02, guibg=colors.base2, gui='reverse'}
		syntax['StatusLineNC'] = {guifg=colors.base02, guibg=colors.base1, gui='reverse'}
		syntax['TabLineSel'] = {guifg=colors.base2, guibg=colors.base02, gui='none'}
		syntax['TabLine'] = {guifg=colors.base01, guibg=colors.base02, gui='none'}
		syntax['TabLineFill'] = {guifg=colors.base01, guibg=colors.base02, gui='none'}
		syntax['VertSplit'] = {guifg=colors.base01, guibg=colors.base02, gui='none'}
	else
		syntax['StatusLine'] = {guifg=colors.base0,guibg=colors.base02,gui='reverse'}
		syntax['StatusLineNC'] = {guifg=colors.base01,guibg=colors.base02,gui='reverse'}
		syntax['TabLine'] = {guifg=colors.base01,guibg=colors.base02,gui='reverse'}
		syntax['TabLineFill'] = {guifg=colors.base01,guibg=colors.base02,gui='reverse'}
		syntax['TabLineSel'] = {guifg=colors.base0,guibg=colors.base02,gui='reverse'}
		syntax['VertSplit'] = {guifg=colors.base02,guibg=colors.base01,gui='none'}
	end

	if g.solarized_visibility == 'high' then
		syntax['CursorLineNr'] = {guifg=colors.red,guibg=colors.base02,gui='bold'}
		syntax['LineNr'] = {guifg=colors.base00,guibg=termtrans(colors.base02),gui='none'} -- trans
		syntax['MatchParen'] = {guifg=colors.base3,guibg=colors.base0,gui='bold'}
		syntax['NonText'] = {guifg=colors.red,guibg='none',gui='bold'}
		syntax['SpecialKey'] = {guifg=colors.red,guibg='none',gui='reverse'}
		syntax['SpellBad'] = {guifg=colors.magenta,guibg=colors.base3,guisp=colors.violet,gui='undercurl'}
		syntax['SpellCap'] = {guifg=colors.magenta,guibg=colors.base3,guisp=colors.violet,gui='undercurl'}
		syntax['SpellLocal'] = {guifg=colors.yellow,guibg=colors.base3,guisp=colors.orange,gui='undercurl'}
		syntax['SpellRare'] = {guifg=colors.cyan,guibg=colors.base3,guisp=colors.orange,gui='undercurl'}
		syntax['Title'] = {guifg=colors.orange,guibg='none',gui='bold'}
	elseif g.solarized_visibility == 'low' then
		syntax['CursorLineNr'] = {guifg=colors.base1,guibg=colors.base02,gui='bold'}
		syntax['LineNr'] = {guifg=colors.base1,guibg=termtrans(colors.base02),gui='none'}
		syntax['MatchParen'] = {guifg=colors.red,guibg=colors.base2,gui='bold,underline'}
		syntax['NonText'] = {guifg=colors.base2,guibg='none',gui='bold'}
		syntax['SpecialKey'] = {guifg=colors.base2,guibg='none',gui='bold'}
		syntax['SpellBad'] = {guifg=colors.magenta,guibg='none',guisp=colors.violet,gui='undercurl'}
		syntax['SpellCap'] = {guifg=colors.magenta,guibg='none',guisp=colors.violet,gui='undercurl'}
		syntax['SpellLocal'] = {guifg=colors.yellow,guibg='none',guisp=colors.yellow,gui='undercurl'}
		syntax['SpellRare'] = {guifg=colors.cyan,guibg='none',guisp=colors.cyan,gui='undercurl'}
		syntax['Title'] = {guifg=colors.base1,guibg='none',gui='bold'}
	else
		syntax['CursorLineNr'] = {guifg=colors.base0,guibg=colors.base02,gui='bold'}
		syntax['LineNr'] = {guifg=colors.base00,guibg=termtrans(colors.base02),gui='none'}
		syntax['MatchParen'] = {guifg=colors.base3,guibg=colors.base02,gui='bold'}
		syntax['NonText'] = {guifg=colors.base00,guibg='none',gui='bold'}
		syntax['SpecialKey'] = {guifg=colors.base00,guibg=colors.base02,gui='bold'}
		syntax['SpellBad'] = {guifg=colors.violet,guibg='none',guisp=colors.violet,gui='undercurl'}
		syntax['SpellCap'] = {guifg=colors.violet,guibg='none',guisp=colors.violet,gui='undercurl'}
		syntax['SpellLocal'] = {guifg=colors.yellow,guibg='none',guisp=colors.yellow,gui='undercurl'}
		syntax['SpellRare'] = {guifg=colors.cyan,guibg='none',guisp=colors.cyan,gui='undercurl'}
		syntax['Title'] = {guifg=colors.orange,guibg='none',gui='bold'}
	end

	syntax['ColorColumn'] = {guifg='none',guibg=colors.base02,gui='none'}
	syntax['Conceal'] = {guifg=colors.blue,guibg='none',gui='none'}
	syntax['CursorColumn'] = {guifg='none',guibg=colors.base02,gui='none'}
	syntax['Directory'] = {guifg=colors.blue,guibg='none',gui='none'}
	syntax['EndOfBuffer'] = {guifg='none',guibg='none',gui='none',ctermfg='none',ctermbg='none'}
	syntax['ErrorMsg'] = {guifg=colors.red,guibg=colors.base3,gui='reverse'}
	syntax['IncSearch'] = {guifg=colors.orange,guibg='none',gui='standout'}
	syntax['MatchParen'] = {guifg=colors.base3,guibg=colors.base02,gui='bold'}
	syntax['ModeMsg'] = {guifg=colors.blue,guibg='none',gui='none'}
	syntax['MoreMsg'] = {guifg=colors.blue,guibg='none',gui='none'}
	syntax['Pmenu'] = {guifg=colors.base1,guibg=colors.base02,gui='none'}
	syntax['PmenuSbar'] = {guifg='none',guibg=colors.base01,gui='none'}
	syntax['PmenuSel'] = {guifg=base2,guibg=colors.base00,gui='none'}
	syntax['PmenuThumb'] = {guifg='none',guibg=colors.base0,gui='none'}
	syntax['Question'] = {guifg=colors.cyan,guibg='none',gui='bold'}
	syntax['Search'] = {guifg=colors.yellow,guibg='none',gui='reverse'}
	syntax['SignColumn'] = {guifg=colors.base0,guibg='none',gui='none'}
	syntax['Visual'] = {guifg=colors.base01,guibg=colors.base03,gui='reverse'}
	syntax['VisualNOS'] = {guifg='none',guibg=colors.base02,gui='reverse'}
	syntax['WarningMsg'] = {guifg=colors.orange,guibg='none',gui='bold'}
	syntax['WildMenu'] = {guifg=base2,guibg=colors.base02,gui='reverse'}
	syntax['Comment'] = {guifg=colors.base01,guibg='none',gui=italics()}
	syntax['Constant'] = {guifg=colors.cyan,guibg='none',gui='none'}
	syntax['CursorIM'] = {guifg='none',guibg=fg,gui='none'}
	syntax['Error'] = {guifg=colors.red,guibg=colors.base3,gui='bold','reverse'}
	syntax['Identifier'] = {guifg=colors.blue,guibg='none',gui='none'}
	syntax['Ignore'] = {guifg='none',guibg='none',gui='none',ctermfg='none',ctermbg='none'}
	syntax['PreProc'] = {guifg=colors.orange,guibg='none',gui='none'}
	syntax['Special'] = {guifg=colors.orange,guibg='none',gui='none'}
	syntax['Statement'] = {guifg=colors.green,guibg='none',gui='none'}
	syntax['Todo'] = {guifg=colors.magenta,guibg='none',gui='bold'}
	syntax['Type'] = {guifg=colors.yellow,guibg='none',gui='none'}
	syntax['Underlined'] = {guifg=colors.violet,guibg='none',gui='none'}
	syntax['NormalMode'] = {guifg=colors.base0,guibg=colors.base3,gui='reverse'}
	syntax['InsertMode'] = {guifg=colors.cyan,guibg=colors.base3,gui='reverse'}
	syntax['ReplaceMode'] = {guifg=colors.orange,guibg=colors.base3,gui='reverse'}
	syntax['VisualMode'] = {guifg=colors.magenta,guibg=colors.base3,gui='reverse'}
	syntax['CommandMode'] = {guifg=colors.magenta,guibg=colors.base3,gui='reverse'}
	syntax['vimCommentString'] = {guifg=colors.violet,guibg='none',gui='none'}
	syntax['vimCommand'] = {guifg=colors.yellow,guibg='none',gui='none'}
	syntax['vimCmdSep'] = {guifg=colors.blue,guibg='none',gui='bold'}
	syntax['helpExample'] = {guifg=colors.base1,guibg='none',gui='none'}
	syntax['helpOption'] = {guifg=colors.cyan,guibg='none',gui='none'}
	syntax['helpNote'] = {guifg=colors.magenta,guibg='none',gui='none'}
	syntax['helpVim'] = {guifg=colors.magenta,guibg='none',gui='none'}
	syntax['helpHyperTextJump'] = {guifg=colors.blue,guibg='none',gui='none'}
	syntax['helpHyperTextEntry'] = {guifg=colors.green,guibg='none',gui='none'}
	syntax['vimIsCommand'] = {guifg=colors.base00,guibg='none',gui='none'}
	syntax['vimSynMtchOpt'] = {guifg=colors.yellow,guibg='none',gui='none'}
	syntax['vimSynType'] = {guifg=colors.cyan,guibg='none',gui='none'}
	syntax['vimHiLink'] = {guifg=colors.blue,guibg='none',gui='none'}
	syntax['vimHiGroup'] = {guifg=colors.blue,guibg='none',gui='none'}
	syntax['vimGroup'] = {guifg=colors.blue,guibg='none',gui='bold'}
	syntax['gitcommitComment'] = {guifg=colors.base01,guibg='none',gui=italics()}
	syntax['gitcommitUnmerged'] = {guifg=colors.green,guibg='none',gui='bold'}
	syntax['gitcommitOnBranch'] = {guifg=colors.base01,guibg='none',gui='bold'}
	syntax['gitcommitBranch'] = {guifg=colors.magenta,guibg='none',gui='bold'}
	syntax['gitcommitdiscardedtype'] = {guifg=colors.red,guibg='none',gui='none'}
	syntax['gitcommitselectedtype'] = {guifg=colors.green,guibg='none',gui='none'}
	syntax['gitcommitHeader'] = {guifg=colors.base01,guibg='none',gui='none'}
	syntax['gitcommitUntrackedFile'] = {guifg=colors.cyan,guibg='none',gui='bold'}
	syntax['gitcommitDiscardedFile'] = {guifg=colors.red,guibg='none',gui='bold'}
	syntax['gitcommitSelectedFile'] = {guifg=colors.green,guibg='none',gui='bold'}
	syntax['gitcommitUnmergedFile'] = {guifg=colors.yellow,guibg='none',gui='bold'}
	syntax['gitcommitFile'] = {guifg=colors.base0,guibg='none',gui='bold'}
	syntax['htmlTag'] = {guifg=colors.base01,guibg='none',gui='none'}
	syntax['htmlEndTag'] = {guifg=colors.base01,guibg='none',gui='none'}
	syntax['htmlTagN'] = {guifg=colors.base1,guibg='none',gui='bold'}
	syntax['htmlTagName'] = {guifg=colors.blue,guibg='none',gui='bold'}
	syntax['htmlSpecialTagName'] = {guifg=colors.blue,guibg='none',gui=italics()}
	syntax['htmlArg'] = {guifg=colors.base00,guibg='none',gui='none'}
	syntax['javaScript'] = {guifg=colors.yellow,guibg='none',gui='none'}
	syntax['perlHereDoc'] = {guifg=colors.base1,guibg=colors.base03,gui='none'}
	syntax['perlVarPlain'] = {guifg=colors.yellow,guibg=colors.base03,gui='none'}
	syntax['perlStatementFileDesc'] = {guifg=colors.cyan,guibg=colors.base03,gui='none'}
	syntax['texstatement'] = {guifg=colors.cyan,guibg=colors.base03,gui='none'}
	syntax['texmathzonex'] = {guifg=colors.yellow,guibg=colors.base03,gui='none'}
	syntax['texmathmatcher'] = {guifg=colors.yellow,guibg=colors.base03,gui='none'}
	syntax['texreflabel'] = {guifg=colors.yellow,guibg=colors.base03,gui='none'}
	syntax['rubyDefine'] = {guifg=colors.base1,guibg=colors.base03,gui='bold'}
	syntax['rubyBoolean'] = {guifg=colors.magenta,guibg=colors.base03,gui='none'}
	syntax['cPreCondit'] = {guifg=colors.orange,guibg='none',gui='none'}
	syntax['VarId'] = {guifg=colors.blue,guibg='none',gui='none'}
	syntax['ConId'] = {guifg=colors.yellow,guibg='none',gui='none'}
	syntax['hsImport'] = {guifg=colors.magenta,guibg='none',gui='none'}
	syntax['hsString'] = {guifg=colors.base00,guibg='none',gui='none'}
	syntax['hsStructure'] = {guifg=colors.cyan,guibg='none',gui='none'}
	syntax['hs_hlFunctionName'] = {guifg=colors.blue,guibg='none',gui='none'}
	syntax['hsStatement'] = {guifg=colors.cyan,guibg='none',gui='none'}
	syntax['hsImportLabel'] = {guifg=colors.cyan,guibg='none',gui='none'}
	syntax['hs_OpFunctionName'] = {guifg=colors.yellow,guibg='none',gui='none'}
	syntax['hs_DeclareFunction'] = {guifg=colors.orange,guibg='none',gui='none'}
	syntax['hsVarSym'] = {guifg=colors.cyan,guibg='none',gui='none'}
	syntax['hsType'] = {guifg=colors.yellow,guibg='none',gui='none'}
	syntax['hsTypedef'] = {guifg=colors.cyan,guibg='none',gui='none'}
	syntax['hsModuleName'] = {guifg=colors.green,guibg='none',gui='none'}
	syntax['pandocTitleBlock'] = {guifg=colors.blue,guibg='none',gui='none'}
	syntax['pandocTitleBlockTitle'] = {guifg=colors.blue,guibg='none',gui='bold'}
	syntax['pandocTitleComment'] = {guifg=colors.blue,guibg='none',gui='bold'}
	syntax['pandocComment'] = {guifg=colors.base01,guibg='none',gui=italics()}
	syntax['pandocVerbatimBlock'] = {guifg=colors.yellow,guibg='none',gui='none'}
	syntax['pandocBlockQuote'] = {guifg=colors.blue,guibg='none',gui='none'}
	syntax['pandocBlockQuoteLeader1'] = {guifg=colors.blue,guibg='none',gui='none'}
	syntax['pandocBlockQuoteLeader2'] = {guifg=colors.cyan,guibg='none',gui='none'}
	syntax['pandocBlockQuoteLeader3'] = {guifg=colors.yellow,guibg='none',gui='none'}
	syntax['pandocBlockQuoteLeader4'] = {guifg=colors.red,guibg='none',gui='none'}
	syntax['pandocBlockQuoteLeader5'] = {guifg=colors.base0,guibg='none',gui='none'}
	syntax['pandocBlockQuoteLeader6'] = {guifg=colors.base01,guibg='none',gui='none'}
	syntax['pandocListMarker'] = {guifg=colors.magenta,guibg='none',gui='none'}
	syntax['pandocListReference'] = {guifg=colors.magenta,guibg='none',gui='none'}
	syntax['pandocDefinitionBlock'] = {guifg=colors.violet,guibg='none',gui='none'}
	syntax['pandocDefinitionTerm'] = {guifg=colors.violet,guibg='none',gui='standout'}
	syntax['pandocDefinitionIndctr'] = {guifg=colors.violet,guibg='none',gui='bold'}
	syntax['pandocEmphasisDefinition'] = {guifg=colors.violet,guibg='none',gui=italics()}
	syntax['pandocEmphasisNestedDefinition'] = {guifg=colors.violet,guibg='none',gui='bold'}
	syntax['pandocStrongEmphasisDefinition'] = {guifg=colors.violet,guibg='none',gui='bold'}
	syntax['pandocStrongEmphasisNestedDefinition'] = {guifg=colors.violet,guibg='none',gui='bold'}
	syntax['pandocStrongEmphasisEmphasisDefinition'] = {guifg=colors.violet,guibg='none',gui='bold'}
	syntax['pandocStrikeoutDefinition'] = {guifg=colors.violet,guibg='none',gui='reverse'}
	syntax['pandocVerbatimInlineDefinition'] = {guifg=colors.violet,guibg='none',gui='none'}
	syntax['pandocSuperscriptDefinition'] = {guifg=colors.violet,guibg='none',gui='none'}
	syntax['pandocSubscriptDefinition'] = {guifg=colors.violet,guibg='none',gui='none'}
	syntax['pandocTable'] = {guifg=colors.blue,guibg='none',gui='none'}
	syntax['pandocTableStructure'] = {guifg=colors.blue,guibg='none',gui='none'}
	syntax['pandocTableZebraLight'] = {guifg=colors.blue,guibg=colors.base03,gui='none'}
	syntax['pandocTableZebraDark'] = {guifg=colors.blue,guibg=colors.base02,gui='none'}
	syntax['pandocEmphasisTable'] = {guifg=colors.blue,guibg='none',gui=italics()}
	syntax['pandocEmphasisNestedTable'] = {guifg=colors.blue,guibg='none',gui='bold'}
	syntax['pandocStrongEmphasisTable'] = {guifg=colors.blue,guibg='none',gui='bold'}
	syntax['pandocStrongEmphasisNestedTable'] = {guifg=colors.blue,guibg='none',gui='bold'}
	syntax['pandocStrongEmphasisEmphasisTable'] = {guifg=colors.blue,guibg='none',gui='bold'}
	syntax['pandocStrikeoutTable'] = {guifg=colors.blue,guibg='none',gui='reverse'}
	syntax['pandocVerbatimInlineTable'] = {guifg=colors.blue,guibg='none',gui='none'}
	syntax['pandocSuperscriptTable'] = {guifg=colors.blue,guibg='none',gui='none'}
	syntax['pandocSubscriptTable'] = {guifg=colors.blue,guibg='none',gui='none'}
	syntax['pandocHeading'] = {guifg=colors.orange,guibg='none',gui='bold'}
	syntax['pandocHeadingMarker'] = {guifg=colors.orange,guibg='none',gui='bold'}
	syntax['pandocEmphasisHeading'] = {guifg=colors.orange,guibg='none',gui='bold'}
	syntax['pandocEmphasisNestedHeading'] = {guifg=colors.orange,guibg='none',gui='bold'}
	syntax['pandocStrongEmphasisHeading'] = {guifg=colors.orange,guibg='none',gui='bold'}
	syntax['pandocStrongEmphasisNestedHeading'] = {guifg=colors.orange,guibg='none',gui='bold'}
	syntax['pandocStrongEmphasisEmphasisHeading'] = {guifg=colors.orange,guibg='none',gui='bold'}
	syntax['pandocStrikeoutHeading'] = {guifg=colors.orange,guibg='none',gui='reverse'}
	syntax['pandocVerbatimInlineHeading'] = {guifg=colors.orange,guibg='none',gui='bold'}
	syntax['pandocSuperscriptHeading'] = {guifg=colors.orange,guibg='none',gui='bold'}
	syntax['pandocSubscriptHeading'] = {guifg=colors.orange,guibg='none',gui='bold'}
	syntax['pandocLinkDelim'] = {guifg=colors.base01,guibg='none',gui='none'}
	syntax['pandocLinkLabel'] = {guifg=colors.blue,guibg='none',gui='none'}
	syntax['pandocLinkText'] = {guifg=colors.blue,guibg='none',gui='none'}
	syntax['pandocLinkURL'] = {guifg=colors.base00,guibg='none',gui='none'}
	syntax['pandocLinkTitle'] = {guifg=colors.base00,guibg='none',gui='none'}
	syntax['pandocLinkTitleDelim'] = {guifg=colors.base01,guibg='none',guisp=colors.base00,gui='none'}
	syntax['pandocLinkDefinition'] = {guifg=colors.cyan,guibg='none',guisp=colors.base00,gui='none'}
	syntax['pandocLinkDefinitionID'] = {guifg=colors.blue,guibg='none',gui='bold'}
	syntax['pandocImageCaption'] = {guifg=colors.violet,guibg='none',gui='bold'}
	syntax['pandocFootnoteLink'] = {guifg=colors.green,guibg='none',gui='none'}
	syntax['pandocFootnoteDefLink'] = {guifg=colors.green,guibg='none',gui='bold'}
	syntax['pandocFootnoteInline'] = {guifg=colors.green,guibg='none',gui='bold'}
	syntax['pandocFootnote'] = {guifg=colors.green,guibg='none',gui='none'}
	syntax['pandocCitationDelim'] = {guifg=colors.magenta,guibg='none',gui='none'}
	syntax['pandocCitation'] = {guifg=colors.magenta,guibg='none',gui='none'}
	syntax['pandocCitationID'] = {guifg=colors.magenta,guibg='none',gui='none'}
	syntax['pandocCitationRef'] = {guifg=colors.magenta,guibg='none',gui='none'}
	syntax['pandocStyleDelim'] = {guifg=colors.base01,guibg='none',gui='none'}
	syntax['pandocEmphasis'] = {guifg=colors.base0,guibg='none',gui=italics()}
	syntax['pandocEmphasisNested'] = {guifg=colors.base0,guibg='none',gui='bold'}
	syntax['pandocStrongEmphasis'] = {guifg=colors.base0,guibg='none',gui='bold'}
	syntax['pandocStrongEmphasisNested'] = {guifg=colors.base0,guibg='none',gui='bold'}
	syntax['pandocStrongEmphasisEmphasis'] = {guifg=colors.base0,guibg='none',gui='bold'}
	syntax['pandocStrikeout'] = {guifg=colors.base01,guibg='none',gui='reverse'}
	syntax['pandocVerbatimInline'] = {guifg=colors.yellow,guibg='none',gui='none'}
	syntax['pandocSuperscript'] = {guifg=colors.violet,guibg='none',gui='none'}
	syntax['pandocSubscript'] = {guifg=colors.violet,guibg='none',gui='none'}
	syntax['pandocRule'] = {guifg=colors.blue,guibg='none',gui='bold'}
	syntax['pandocRuleLine'] = {guifg=colors.blue,guibg='none',gui='bold'}
	syntax['pandocEscapePair'] = {guifg=colors.red,guibg='none',gui='bold'}
	syntax['pandocCitationRef'] = {guifg=colors.magenta,guibg='none',gui='none'}
	syntax['pandocNonBreakingSpace'] = {guifg=colors.red,guibg='none',gui='reverse'}
	syntax['pandocMetadataDelim'] = {guifg=colors.base01,guibg='none',gui='none'}
	syntax['pandocMetadata'] = {guifg=colors.blue,guibg='none',gui='none'}
	syntax['pandocMetadataKey'] = {guifg=colors.blue,guibg='none',gui='none'}
	syntax['pandocMetadata'] = {guifg=colors.blue,guibg='none',gui='bold'}

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
	syntax['TSStrong'] = {guifg=colors.base1,guibg=colors.base03,gui='bold'}
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

	syntax['LspDiagnosticsDefaultError'] = {guifg=colors.red,guibg='none',guisp=colors.red,gui='undercurl'}
	syntax['LspDiagnosticsDefaultInformation'] = {guifg=colors.cyan,guibg='none',guisp=colors.cyan,gui='undercurl'}
	syntax['LspDiagnosticsDefaultWarning'] = {guifg=colors.yellow,guibg='none',guisp=colors.yellow,gui='undercurl'}
	syntax['LspDiagnosticsDefaultHint'] = {guifg=colors.green,guibg='none',guisp=colors.green,gui='undercurl'}
	syntax['LspDiagnosticsUnderlineError'] = syntax['LspDiagnosticsDefaultError']
	syntax['LspDiagnosticsUnderlineWarning'] = syntax['LspDiagnosticsDefaultWarning']
	syntax['LspDiagnosticsUnderlineInformation'] = syntax['LspDiagnosticsDefaultInformation']
	syntax['LspDiagnosticsUnderlineHint'] = syntax['LspDiagnosticsDefaultHint']

	-- Lspsaga
	syntax['LspSagaFinderSelection'] = syntax['Search']
	syntax['DiagnosticError'] = syntax['LspDiagnosticsDefaultError'] 
	syntax['DiagnosticWarning'] = syntax['LspDiagnosticsDefaultWarning'] 
	syntax['DiagnosticInformation'] = syntax['LspDiagnosticsDefaultInformation'] 
	syntax['DiagnosticHint'] = syntax['LspDiagnosticsDefaultHint'] 
	syntax['TargetWord'] = syntax['Title']

	for group, colors in pairs(syntax) do
		setup(group, colors)
	end
end

M.load_syntax()
