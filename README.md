# Solarized Neovim

This aims to be a complete port [vim-solarized8](https://github.com/lifepillar/vim-solarized8) with support for lua
plugins, LSP and Treesitter for neovim 0.5.

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
- **italics**
Enable italics for comments (default: enabled)

```lua
vim.g.solarized_italics = 1
```

- **visibility**
SpecialChars (like trailing whitespace and tabs) visibility
  + low
  + normal (default)
  + high

```lua
vim.g.solarized_visibility = 'normal'
```

- **diffmode**
  + low
  + normal (default)
  + high
 
```lua
vim.g.solarized_diffmode = 'normal'
```

- **termtrans**
If you want to keep the tranperency in your terminal (default: disabled)

```lua
-- To enable transperancy
if vim.fn.has('gui_running') == 0 then
    vim.g.solarized_termtrans = 0
else
    vim.g.solarized_termtrans = 1
end
```

- **statusline**
  + low
  + flat
  + normal (default)  

 ```lua
 vim.g.solarized_statusline = 'normal'
 ```
  **NOTE** :-
  - If you set statusline option's `normal` and `flat` are the same when using the solarized-flat colorscheme.
  - This option doesn't affect the lua line plugin it has it's own solarized theme.

## Variants

- **solarized**

The normal solarized scheme.  
`vim.cmd('colorscheme solarized')`

- **solarized-high**

This one has a higher contrast ratio.  
`vim.cmd('colorscheme solarized-high')`

- **solarized-flat**

This is the flat variant.  
`vim.cmd('colorscheme solarized-flat')`

- **solarized-low**

This is the low contrast option.  
`vim.cmd('colorscheme solarized-low')`

## TODO

- ~~The light colorscheme~~
- Plugins :-  
   [x] LSP  
   [x] Treesitter  
   [x] Telescope  
   [x] FZF  
   [x] lualine  
   [ ] lspsaga (highlights are present not tested feedback needed)  

# NOTE
- Thanks for lifepillar's vim-solarized8 for providing most of the highlights and color codes for this scheme.
