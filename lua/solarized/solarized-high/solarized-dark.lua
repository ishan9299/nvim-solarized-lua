local M = {}

function M.setup()
    local highlight = {
        base02 = '#073642'
        red = '#dc322f'
        green = '#859900'
        yellow = '#b58900'
        blue = '#268bd2'
        magenta = '#d33682'
        cyan = '#2aa198'
        base1 = '#eee8d5'
        base03 = '#002b36'
        back = '#002b36'
        orange = '#cb4b16'
        base01 = '#657b83'
        base00 = '#839496'
        violet = '#6c71c4'
        base0 = '#93a1a1'
        base2 = '#fdf6e3'
        base3 = '#fdf6e3'
    }
    return highlight
end

return M

--[[
%s/\#073642/colors.base02/g | %s/\#dc322f/colors.red/g | %s/\#859900/colors.green/g | %s/\#b58900/colors.yellow/g | %s/\#268bd2/colors.blue/g | %s/\#d33682/colors.magenta/g | %s/\#2aa198/colors.cyan/g | %s/\#eee8d5/colors.base1/g | %s/\#002b36/colors.base03/g | %s/\#cb4b16/colors.orange/g | %s/\#657b83/colors.base01/g | %s/\#839496/colors.base00/g | %s/\#6c71c4/colors.violet/g | %s/\#93a1a1/colors.base0/g | %s/\#fdf6e3/colors.base3/g
]]
