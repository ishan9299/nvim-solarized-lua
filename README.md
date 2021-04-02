# Solarized Neovim

Solarized in lua for neovim.

## Dark Theme

![Screenshot from 2021-04-01 15-11-51](https://user-images.githubusercontent.com/47824004/113275791-c9346480-92fc-11eb-8878-2504eda2a5c9.png)


## Light Theme

![Screenshot from 2021-04-01 15-10-21](https://user-images.githubusercontent.com/47824004/113275723-b4f06780-92fc-11eb-97e6-23dce847e0a7.png)

## Installation

### VIM Packages
```
git submodule add --name nvim-solarized-lua https://github.com/ishan9299/nvim-solarized-lua
pack/packages/start/solarized
```

### Plug
```
Plug 'ishan9299/nvim-solarized-lua'
```

## Options
- italics
Enable italics for comments (default: enabled)
```lua
vim.g.solarized_italics = 1
```

- visibility
SpecialChars (like trailing whitespace and tabs) visibility
  + low
  + normal (default)
  + high
```lua
vim.g.solarized_diffmode = 'normal'
```

- diffmode
  + low
  + normal (default)
  + high
```
vim.g.solarized_diffmode = 'normal'
```

- termtrans
If you want to keep the tranperency in your terminal (default: disabled)
```
-- To enable transperancy
if vim.fn.has('gui_running') == 0 then
    vim.g.solarized_termtrans = 0
else
    vim.g.solarized_termtrans = 1
end
```

## Variants
- solarized
- solarized-high
- solarized-flat
- solarized-low

## TODO

- ~~The light colorscheme~~
- Features from vim-solarized8 ( pretty much all of it is here there are still some stuff to do especially the
  statusline. )
- 0.5 features
   + LSP
   + ~~TS~~
   + ~~Telescope~~
   + lualine ( for solarized-flat, solarized-high, solarized-low )
