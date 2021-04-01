local M = {}
local cmd = vim.cmd
local g = vim.g
local o = vim.o
local fn = vim.fn

cmd('hi clear')

if o.bg == 'dark' then
    colors = require('solarized.solarized-dark').setup()
else
    colors = require('solarized.solarized-light').setup()
end

if fn.exists("syntax_on") then
    cmd('syntax reset')
end

local setup = function(group, colors)
    cmd(string.format('hi %s guifg=%s guibg=%s gui=%s', group, colors.guifg, colors.guibg, colors.gui))
end

function M.load_syntax()
    local syntax = {
        -- normal
        Normal = {guifg=colors.base1,guibg=colors.base03,gui='none',cterm='none'},
        FoldColumn = {guifg=colors.base0,guibg=colors.base02,gui='none',cterm='none'},
        Folded = {guifg=colors.base0,guibg=colors.base02,guisp=colors.base03,gui='bold',cterm='bold'},
        Terminal = {guifg=fg,guibg=colors.base03,gui='none',cterm='none'},
        ToolbarButton = {guifg=colors.base1,guibg=colors.base02,gui='bold',cterm='bold'},
        ToolbarLine = {guifg='none',guibg=colors.base02,gui='none',cterm='none'},
        DiffAdd = {guifg=colors.green,guibg=colors.base02,guisp=colors.green,gui='none',cterm='none'},
        DiffChange = {guifg=colors.yellow,guibg=colors.base02,guisp=colors.yellow,gui='none',cterm='none'},
        DiffDelete = {guifg=colors.red,guibg=colors.base02,gui='bold',cterm='bold'},
        DiffText = {guifg=colors.blue,guibg=colors.base02,guisp=colors.blue,gui='none',cterm='none'},
        ColorColumn = {guifg='none',guibg=colors.base02,gui='none',cterm='none'},
        Conceal = {guifg=colors.blue,guibg='none',gui='none',cterm='none'},
        CursorColumn = {guifg='none',guibg=colors.base02,gui='none',cterm='none'},
        CursorLine = {guifg='none',guibg=colors.base02,gui='none',cterm='none'},
        Directory = {guifg=colors.blue,guibg='none',gui='none',cterm='none'},
        EndOfBuffer = {guifg='none',guibg='none',gui='none',ctermfg='none',ctermbg='none',cterm='none'},
        ErrorMsg = {guifg=colors.red,guibg=colors.base3,gui='reverse',cterm='reverse'},
        IncSearch = {guifg=colors.orange,guibg='none',gui='standout',cterm='standout'},
        MatchParen = {guifg=colors.base3,guibg=colors.base02,gui='bold',cterm='bold'},
        ModeMsg = {guifg=colors.blue,guibg='none',gui='none',cterm='none'},
        MoreMsg = {guifg=colors.blue,guibg='none',gui='none',cterm='none'},
        Pmenu = {guifg=colors.base1,guibg=colors.base02,gui='none',cterm='none'},
        PmenuSbar = {guifg='none',guibg=colors.base01,gui='none',cterm='none'},
        PmenuSel = {guifg=base2,guibg=colors.base00,gui='none',cterm='none'},
        PmenuThumb = {guifg='none',guibg=colors.base0,gui='none',cterm='none'},
        Question = {guifg=colors.cyan,guibg='none',gui='bold',cterm='bold'},
        Search = {guifg=colors.yellow,guibg='none',gui='reverse',cterm='reverse'},
        SignColumn = {guifg=colors.base0,guibg='none',gui='none',cterm='none'},
        Visual = {guifg=colors.base01,guibg=colors.base03,gui='reverse',cterm='reverse'},
        VisualNOS = {guifg='none',guibg=colors.base02,gui='reverse',cterm='reverse'},
        WarningMsg = {guifg=colors.orange,guibg='none',gui='bold',cterm='bold'},
        WildMenu = {guifg=base2,guibg=colors.base02,gui='reverse',cterm='reverse'},
        Comment = {guifg=colors.base01,guibg='none',gui='italic',cterm='italic'},
        Constant = {guifg=colors.cyan,guibg='none',gui='none',cterm='none'},
        CursorIM = {guifg='none',guibg=fg,gui='none',cterm='none'},
        Error = {guifg=colors.red,guibg=colors.base3,gui='bold','reverse',cterm='bold','reverse'},
        Identifier = {guifg=colors.blue,guibg='none',gui='none',cterm='none'},
        Ignore = {guifg='none',guibg='none',gui='none',ctermfg='none',ctermbg='none',cterm='none'},
        PreProc = {guifg=colors.orange,guibg='none',gui='none',cterm='none'},
        Special = {guifg=colors.orange,guibg='none',gui='none',cterm='none'},
        Statement = {guifg=colors.green,guibg='none',gui='none',cterm='none'},
        Todo = {guifg=colors.magenta,guibg='none',gui='bold',cterm='bold'},
        Type = {guifg=colors.yellow,guibg='none',gui='none',cterm='none'},
        Underlined = {guifg=colors.violet,guibg='none',gui='none',cterm='none'},
        NormalMode = {guifg=colors.base0,guibg=colors.base3,gui='reverse',cterm='reverse'},
        InsertMode = {guifg=colors.cyan,guibg=colors.base3,gui='reverse',cterm='reverse'},
        ReplaceMode = {guifg=colors.orange,guibg=colors.base3,gui='reverse',cterm='reverse'},
        VisualMode = {guifg=colors.magenta,guibg=colors.base3,gui='reverse',cterm='reverse'},
        CommandMode = {guifg=colors.magenta,guibg=colors.base3,gui='reverse',cterm='reverse'},
        vimCommentString = {guifg=colors.violet,guibg='none',gui='none',cterm='none'},
        vimCommand = {guifg=colors.yellow,guibg='none',gui='none',cterm='none'},
        vimCmdSep = {guifg=colors.blue,guibg='none',gui='bold',cterm='bold'},
        helpExample = {guifg=colors.base1,guibg='none',gui='none',cterm='none'},
        helpOption = {guifg=colors.cyan,guibg='none',gui='none',cterm='none'},
        helpNote = {guifg=colors.magenta,guibg='none',gui='none',cterm='none'},
        helpVim = {guifg=colors.magenta,guibg='none',gui='none',cterm='none'},
        helpHyperTextJump = {guifg=colors.blue,guibg='none',gui='none',cterm='none'},
        helpHyperTextEntry = {guifg=colors.green,guibg='none',gui='none',cterm='none'},
        vimIsCommand = {guifg=colors.base00,guibg='none',gui='none',cterm='none'},
        vimSynMtchOpt = {guifg=colors.yellow,guibg='none',gui='none',cterm='none'},
        vimSynType = {guifg=colors.cyan,guibg='none',gui='none',cterm='none'},
        vimHiLink = {guifg=colors.blue,guibg='none',gui='none',cterm='none'},
        vimHiGroup = {guifg=colors.blue,guibg='none',gui='none',cterm='none'},
        vimGroup = {guifg=colors.blue,guibg='none',gui='bold',cterm='bold'},
        gitcommitComment = {guifg=colors.base01,guibg='none',gui='italic',cterm='italic'},
        gitcommitUnmerged = {guifg=colors.green,guibg='none',gui='bold',cterm='bold'},
        gitcommitOnBranch = {guifg=colors.base01,guibg='none',gui='bold',cterm='bold'},
        gitcommitBranch = {guifg=colors.magenta,guibg='none',gui='bold',cterm='bold'},
        gitcommitdiscardedtype = {guifg=colors.red,guibg='none',gui='none',cterm='none'},
        gitcommitselectedtype = {guifg=colors.green,guibg='none',gui='none',cterm='none'},
        gitcommitHeader = {guifg=colors.base01,guibg='none',gui='none',cterm='none'},
        gitcommitUntrackedFile = {guifg=colors.cyan,guibg='none',gui='bold',cterm='bold'},
        gitcommitDiscardedFile = {guifg=colors.red,guibg='none',gui='bold',cterm='bold'},
        gitcommitSelectedFile = {guifg=colors.green,guibg='none',gui='bold',cterm='bold'},
        gitcommitUnmergedFile = {guifg=colors.yellow,guibg='none',gui='bold',cterm='bold'},
        gitcommitFile = {guifg=colors.base0,guibg='none',gui='bold',cterm='bold'},
        htmlTag = {guifg=colors.base01,guibg='none',gui='none',cterm='none'},
        htmlEndTag = {guifg=colors.base01,guibg='none',gui='none',cterm='none'},
        htmlTagN = {guifg=colors.base1,guibg='none',gui='bold',cterm='bold'},
        htmlTagName = {guifg=colors.blue,guibg='none',gui='bold',cterm='bold'},
        htmlSpecialTagName = {guifg=colors.blue,guibg='none',gui='italic',cterm='italic'},
        htmlArg = {guifg=colors.base00,guibg='none',gui='none',cterm='none'},
        javaScript = {guifg=colors.yellow,guibg='none',gui='none',cterm='none'},
        perlHereDoc = {guifg=colors.base1,guibg=colors.base03,gui='none',cterm='none'},
        perlVarPlain = {guifg=colors.yellow,guibg=colors.base03,gui='none',cterm='none'},
        perlStatementFileDesc = {guifg=colors.cyan,guibg=colors.base03,gui='none',cterm='none'},
        texstatement = {guifg=colors.cyan,guibg=colors.base03,gui='none',cterm='none'},
        texmathzonex = {guifg=colors.yellow,guibg=colors.base03,gui='none',cterm='none'},
        texmathmatcher = {guifg=colors.yellow,guibg=colors.base03,gui='none',cterm='none'},
        texreflabel = {guifg=colors.yellow,guibg=colors.base03,gui='none',cterm='none'},
        rubyDefine = {guifg=colors.base1,guibg=colors.base03,gui='bold',cterm='bold'},
        rubyBoolean = {guifg=colors.magenta,guibg=colors.base03,gui='none',cterm='none'},
        cPreCondit = {guifg=colors.orange,guibg='none',gui='none',cterm='none'},
        VarId = {guifg=colors.blue,guibg='none',gui='none',cterm='none'},
        ConId = {guifg=colors.yellow,guibg='none',gui='none',cterm='none'},
        hsImport = {guifg=colors.magenta,guibg='none',gui='none',cterm='none'},
        hsString = {guifg=colors.base00,guibg='none',gui='none',cterm='none'},
        hsStructure = {guifg=colors.cyan,guibg='none',gui='none',cterm='none'},
        hs_hlFunctionName = {guifg=colors.blue,guibg='none',gui='none',cterm='none'},
        hsStatement = {guifg=colors.cyan,guibg='none',gui='none',cterm='none'},
        hsImportLabel = {guifg=colors.cyan,guibg='none',gui='none',cterm='none'},
        hs_OpFunctionName = {guifg=colors.yellow,guibg='none',gui='none',cterm='none'},
        hs_DeclareFunction = {guifg=colors.orange,guibg='none',gui='none',cterm='none'},
        hsVarSym = {guifg=colors.cyan,guibg='none',gui='none',cterm='none'},
        hsType = {guifg=colors.yellow,guibg='none',gui='none',cterm='none'},
        hsTypedef = {guifg=colors.cyan,guibg='none',gui='none',cterm='none'},
        hsModuleName = {guifg=colors.green,guibg='none',gui='none',cterm='none'},
        pandocTitleBlock = {guifg=colors.blue,guibg='none',gui='none',cterm='none'},
        pandocTitleBlockTitle = {guifg=colors.blue,guibg='none',gui='bold',cterm='bold'},
        pandocTitleComment = {guifg=colors.blue,guibg='none',gui='bold',cterm='bold'},
        pandocComment = {guifg=colors.base01,guibg='none',gui='italic',cterm='italic'},
        pandocVerbatimBlock = {guifg=colors.yellow,guibg='none',gui='none',cterm='none'},
        pandocBlockQuote = {guifg=colors.blue,guibg='none',gui='none',cterm='none'},
        pandocBlockQuoteLeader1 = {guifg=colors.blue,guibg='none',gui='none',cterm='none'},
        pandocBlockQuoteLeader2 = {guifg=colors.cyan,guibg='none',gui='none',cterm='none'},
        pandocBlockQuoteLeader3 = {guifg=colors.yellow,guibg='none',gui='none',cterm='none'},
        pandocBlockQuoteLeader4 = {guifg=colors.red,guibg='none',gui='none',cterm='none'},
        pandocBlockQuoteLeader5 = {guifg=colors.base0,guibg='none',gui='none',cterm='none'},
        pandocBlockQuoteLeader6 = {guifg=colors.base01,guibg='none',gui='none',cterm='none'},
        pandocListMarker = {guifg=colors.magenta,guibg='none',gui='none',cterm='none'},
        pandocListReference = {guifg=colors.magenta,guibg='none',gui='none',cterm='none'},
        pandocDefinitionBlock = {guifg=colors.violet,guibg='none',gui='none',cterm='none'},
        pandocDefinitionTerm = {guifg=colors.violet,guibg='none',gui='standout',cterm='standout'},
        pandocDefinitionIndctr = {guifg=colors.violet,guibg='none',gui='bold',cterm='bold'},
        pandocEmphasisDefinition = {guifg=colors.violet,guibg='none',gui='italic',cterm='italic'},
        pandocEmphasisNestedDefinition = {guifg=colors.violet,guibg='none',gui='bold',cterm='bold'},
        pandocStrongEmphasisDefinition = {guifg=colors.violet,guibg='none',gui='bold',cterm='bold'},
        pandocStrongEmphasisNestedDefinition = {guifg=colors.violet,guibg='none',gui='bold',cterm='bold'},
        pandocStrongEmphasisEmphasisDefinition = {guifg=colors.violet,guibg='none',gui='bold',cterm='bold'},
        pandocStrikeoutDefinition = {guifg=colors.violet,guibg='none',gui='reverse',cterm='reverse'},
        pandocVerbatimInlineDefinition = {guifg=colors.violet,guibg='none',gui='none',cterm='none'},
        pandocSuperscriptDefinition = {guifg=colors.violet,guibg='none',gui='none',cterm='none'},
        pandocSubscriptDefinition = {guifg=colors.violet,guibg='none',gui='none',cterm='none'},
        pandocTable = {guifg=colors.blue,guibg='none',gui='none',cterm='none'},
        pandocTableStructure = {guifg=colors.blue,guibg='none',gui='none',cterm='none'},
        pandocTableZebraLight = {guifg=colors.blue,guibg=colors.base03,gui='none',cterm='none'},
        pandocTableZebraDark = {guifg=colors.blue,guibg=colors.base02,gui='none',cterm='none'},
        pandocEmphasisTable = {guifg=colors.blue,guibg='none',gui='italic',cterm='italic'},
        pandocEmphasisNestedTable = {guifg=colors.blue,guibg='none',gui='bold',cterm='bold'},
        pandocStrongEmphasisTable = {guifg=colors.blue,guibg='none',gui='bold',cterm='bold'},
        pandocStrongEmphasisNestedTable = {guifg=colors.blue,guibg='none',gui='bold',cterm='bold'},
        pandocStrongEmphasisEmphasisTable = {guifg=colors.blue,guibg='none',gui='bold',cterm='bold'},
        pandocStrikeoutTable = {guifg=colors.blue,guibg='none',gui='reverse',cterm='reverse'},
        pandocVerbatimInlineTable = {guifg=colors.blue,guibg='none',gui='none',cterm='none'},
        pandocSuperscriptTable = {guifg=colors.blue,guibg='none',gui='none',cterm='none'},
        pandocSubscriptTable = {guifg=colors.blue,guibg='none',gui='none',cterm='none'},
        pandocHeading = {guifg=colors.orange,guibg='none',gui='bold',cterm='bold'},
        pandocHeadingMarker = {guifg=colors.orange,guibg='none',gui='bold',cterm='bold'},
        pandocEmphasisHeading = {guifg=colors.orange,guibg='none',gui='bold',cterm='bold'},
        pandocEmphasisNestedHeading = {guifg=colors.orange,guibg='none',gui='bold',cterm='bold'},
        pandocStrongEmphasisHeading = {guifg=colors.orange,guibg='none',gui='bold',cterm='bold'},
        pandocStrongEmphasisNestedHeading = {guifg=colors.orange,guibg='none',gui='bold',cterm='bold'},
        pandocStrongEmphasisEmphasisHeading = {guifg=colors.orange,guibg='none',gui='bold',cterm='bold'},
        pandocStrikeoutHeading = {guifg=colors.orange,guibg='none',gui='reverse',cterm='reverse'},
        pandocVerbatimInlineHeading = {guifg=colors.orange,guibg='none',gui='bold',cterm='bold'},
        pandocSuperscriptHeading = {guifg=colors.orange,guibg='none',gui='bold',cterm='bold'},
        pandocSubscriptHeading = {guifg=colors.orange,guibg='none',gui='bold',cterm='bold'},
        pandocLinkDelim = {guifg=colors.base01,guibg='none',gui='none',cterm='none'},
        pandocLinkLabel = {guifg=colors.blue,guibg='none',gui='none',cterm='none'},
        pandocLinkText = {guifg=colors.blue,guibg='none',gui='none',cterm='none'},
        pandocLinkURL = {guifg=colors.base00,guibg='none',gui='none',cterm='none'},
        pandocLinkTitle = {guifg=colors.base00,guibg='none',gui='none',cterm='none'},
        pandocLinkTitleDelim = {guifg=colors.base01,guibg='none',guisp=colors.base00,gui='none',cterm='none'},
        pandocLinkDefinition = {guifg=colors.cyan,guibg='none',guisp=colors.base00,gui='none',cterm='none'},
        pandocLinkDefinitionID = {guifg=colors.blue,guibg='none',gui='bold',cterm='bold'},
        pandocImageCaption = {guifg=colors.violet,guibg='none',gui='bold',cterm='bold'},
        pandocFootnoteLink = {guifg=colors.green,guibg='none',gui='none',cterm='none'},
        pandocFootnoteDefLink = {guifg=colors.green,guibg='none',gui='bold',cterm='bold'},
        pandocFootnoteInline = {guifg=colors.green,guibg='none',gui='bold',cterm='bold'},
        pandocFootnote = {guifg=colors.green,guibg='none',gui='none',cterm='none'},
        pandocCitationDelim = {guifg=colors.magenta,guibg='none',gui='none',cterm='none'},
        pandocCitation = {guifg=colors.magenta,guibg='none',gui='none',cterm='none'},
        pandocCitationID = {guifg=colors.magenta,guibg='none',gui='none',cterm='none'},
        pandocCitationRef = {guifg=colors.magenta,guibg='none',gui='none',cterm='none'},
        pandocStyleDelim = {guifg=colors.base01,guibg='none',gui='none',cterm='none'},
        pandocEmphasis = {guifg=colors.base0,guibg='none',gui='italic',cterm='italic'},
        pandocEmphasisNested = {guifg=colors.base0,guibg='none',gui='bold',cterm='bold'},
        pandocStrongEmphasis = {guifg=colors.base0,guibg='none',gui='bold',cterm='bold'},
        pandocStrongEmphasisNested = {guifg=colors.base0,guibg='none',gui='bold',cterm='bold'},
        pandocStrongEmphasisEmphasis = {guifg=colors.base0,guibg='none',gui='bold',cterm='bold'},
        pandocStrikeout = {guifg=colors.base01,guibg='none',gui='reverse',cterm='reverse'},
        pandocVerbatimInline = {guifg=colors.yellow,guibg='none',gui='none',cterm='none'},
        pandocSuperscript = {guifg=colors.violet,guibg='none',gui='none',cterm='none'},
        pandocSubscript = {guifg=colors.violet,guibg='none',gui='none',cterm='none'},
        pandocRule = {guifg=colors.blue,guibg='none',gui='bold',cterm='bold'},
        pandocRuleLine = {guifg=colors.blue,guibg='none',gui='bold',cterm='bold'},
        pandocEscapePair = {guifg=colors.red,guibg='none',gui='bold',cterm='bold'},
        pandocCitationRef = {guifg=colors.magenta,guibg='none',gui='none',cterm='none'},
        pandocNonBreakingSpace = {guifg=colors.red,guibg='none',gui='reverse',cterm='reverse'},
        pandocMetadataDelim = {guifg=colors.base01,guibg='none',gui='none',cterm='none'},
        pandocMetadata = {guifg=colors.blue,guibg='none',gui='none',cterm='none'},
        pandocMetadataKey = {guifg=colors.blue,guibg='none',gui='none',cterm='none'},
        pandocMetadata = {guifg=colors.blue,guibg='none',gui='bold',cterm='bold'},
        ALEError = {guifg=colors.red,guibg='none',guisp=colors.red,gui='undercurl',cterm='undercurl'},
        ALEErrorLine = {guifg='none',guibg='none',gui='none',ctermfg='none',ctermbg='none',cterm='none'},
        ALEInfo = {guifg=colors.cyan,guibg='none',guisp=colors.cyan,gui='undercurl',cterm='undercurl'},
        ALEInfoLine = {guifg='none',guibg='none',gui='none',ctermfg='none',ctermbg='none',cterm='none'},
        ALEWarning = {guifg=colors.yellow,guibg='none',guisp=colors.yellow,gui='undercurl',cterm='undercurl'},
        ALEWarningLine = {guifg='none',guibg='none',gui='none',ctermfg='none',ctermbg='none',cterm='none'},
        StatusLine = {guifg=colors.base0,guibg=colors.base02,gui='reverse',cterm='reverse'},
        StatusLineNC = {guifg=colors.base01,guibg=colors.base02,gui='reverse',cterm='reverse'},
        TabLine = {guifg=colors.base01,guibg=colors.base02,gui='reverse',cterm='reverse'},
        TabLineFill = {guifg=colors.base01,guibg=colors.base02,gui='reverse',cterm='reverse'},
        TabLineSel = {guifg=colors.base0,guibg=colors.base02,gui='reverse',cterm='reverse'},
        VertSplit = {guifg=colors.base02,guibg=colors.base01,gui='none',cterm='none'},
        -- opaque
        CursorLineNr = {guifg=colors.base0,guibg=colors.base02,gui='bold',cterm='bold'},
        LineNr = {guifg=colors.base00,guibg=colors.base02,gui='none',cterm='none'},
        NonText = {guifg=colors.base00,guibg='none',gui='bold',cterm='bold'},
        SpecialKey = {guifg=colors.base00,guibg=colors.base02,gui='bold',cterm='bold'},
        SpellBad = {guifg=colors.violet,guibg='none',guisp=colors.violet,gui='undercurl',cterm='underline'},
        SpellCap = {guifg=colors.violet,guibg='none',guisp=colors.violet,gui='undercurl',cterm='underline'},
        SpellLocal = {guifg=colors.yellow,guibg='none',guisp=colors.yellow,gui='undercurl',cterm='underline'},
        SpellRare = {guifg=colors.cyan,guibg='none',guisp=colors.cyan,gui='undercurl',cterm='underline'},
        Title = {guifg=colors.orange,guibg='none',gui='bold',cterm='bold'},
    }

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

    -- ALE
    syntax['ALEStyleError'] = syntax['ALEError']
    syntax['ALEStyleErrorSign'] = syntax['ALEErrorSign']
    syntax['ALEStyleErrorSignLineNr'] = syntax['ALEErrorSignLineNr']
    syntax['ALEStyleWarning'] = syntax['ALEWarning']
    syntax['ALEStyleWarningSign'] = syntax['ALEWarningSign']
    syntax['ALEStyleWarningSignLineNr'] = syntax['ALEWarningSignLineNr']

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
    syntax['TSStrong'] = {guifg=colors.base1,guibg=colors.base03,gui='bold',cterm='none'}
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

    -- Telescope

    for group, colors in pairs(syntax) do
        setup(group, colors)
    end
end

M.load_syntax()
