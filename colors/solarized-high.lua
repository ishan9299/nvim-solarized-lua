local solarized_high = require('solarized.solarized-high.highlights')
local lightColors = {
	none = {'none', 'none'},
	base2   = {'#073642',23},
	red     = {'#dc322f',203},
	green   = {'#859900',142},
	yellow  = {'#b58900',178},
	blue    = {'#268bd2',38},
	magenta = {'#d33682',169},
	cyan    = {'#2aa198',37},
	base02  = {'#eee8d5',230},
	base3   = {'#002b36',23},
	orange  = {'#cb4b16',166},
	base1   = {'#586e75',102},
	base0   = {'#657b83',103},
	base00  = {'#839496',145},
	violet  = {'#6c71c4',104},
	base01  = {'#93a1a1',145},
	base03  = {'#fdf6e3',231},
	back    = {'#fdf6e3',231},
	err_bg = {'#fdf6e3',231}
}
local darkColors = {
	none = {'none', 'none'},
	base02  = {'#073642',23},
	red     = {'#dc322f',203},
	green   = {'#859900',142},
	yellow  = {'#b58900',178},
	blue    = {'#268bd2',38},
	magenta = {'#d33682',169},
	cyan    = {'#2aa198',37},
	base1   = {'#eee8d5',230},
	base03  = {'#002b36',23},
	back    = {'#002b36',23},
	orange  = {'#cb4b16',166},
	base01  = {'#657b83',103},
	base00  = {'#839496',145},
	violet  = {'#6c71c4',104},
	base0   = {'#93a1a1',145},
	base2   = {'#fdf6e3',231},
	base3   = {'#fdf6e3',231},
	err_bg = {'#fdf6e3',231}
}

if vim.o.bg == 'light' then
	solarized_high.load_syntax(lightColors)
	solarized_high.terminal_colors(lightColors)
end

if vim.o.bg == 'dark' then
	solarized_high.load_syntax(darkColors)
	solarized_high.terminal_colors(darkColors)
end

