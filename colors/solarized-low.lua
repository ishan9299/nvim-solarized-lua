local solarized_low = require('solarized.solarized-low.highlights')
local lightColors = {
	none = {'none', 'none'},
	base2   = {'#073642',15},
	red     = {'#dc322f',193},
	green   = {'#859900',133},
	yellow  = {'#b58900',171},
	blue    = {'#268bd2',56},
	magenta = {'#d33682',188},
	cyan    = {'#2aa198',61},
	base02  = {'#eee8d5',238},
	back    = {'#eee8d5',238},
	base3   = {'#002b36',7},
	orange  = {'#cb4b16',182},
	base1   = {'#586e75',92},
	base0   = {'#657b83',105},
	base00  = {'#839496',134},
	violet  = {'#6c71c4',111},
	base01  = {'#93a1a1',150},
	base03  = {'#fdf6e3',253},
	err_bg = {'#fdf6e3',253}
}
local darkColors = {
	none = {'none', 'none'},
	base02  = {'#073642',15},
	back    = {'#073642',15},
	red     = {'#dc322f',193},
	green   = {'#859900',133},
	yellow  = {'#b58900',171},
	blue    = {'#268bd2',56},
	magenta = {'#d33682',188},
	cyan    = {'#2aa198',61},
	base2   = {'#eee8d5',238},
	base03  = {'#002b36',7},
	orange  = {'#cb4b16',182},
	base01  = {'#586e75',92},
	base00  = {'#657b83',105},
	base0   = {'#839496',134},
	violet  = {'#6c71c4',111},
	base1   = {'#93a1a1',150},
	base3   = {'#fdf6e3',253},
	err_bg = {'#fdf6e3',253}
}

if vim.o.bg == 'light' then
	solarized_low.load_syntax(lightColors)
	solarized_low.terminal_colors(lightColors)
end

if vim.o.bg == 'dark' then
	solarized_low.load_syntax(darkColors)
	solarized_low.terminal_colors(darkColors)
end
