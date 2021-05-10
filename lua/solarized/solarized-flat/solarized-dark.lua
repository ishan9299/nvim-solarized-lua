local M = {}

function M.setup()
	local highlight = {
		none = {'none', 'none'},
		base02 = {'#073642',15},
		red = {'#dc322f',193},
		green = {'#859900',133},
		yellow = {'#b58900',171},
		blue = {'#268bd2',56},
		magenta = {'#d33682',188},
		cyan = {'#2aa198',61},
		base2 = {'#eee8d5',238},
		base03 = {'#002b36',7},
		back = {'#002b36',7},
		orange = {'#cb4b16',182},
		base01 = {'#586e75',92},
		base00 = {'#657b83',105},
		base0 = {'#839496',134},
		violet = {'#6c71c4',111},
		base1 = {'#93a1a1',150},
		base3 = {'#fdf6e3',253}
	}
	return highlight
end

return M
