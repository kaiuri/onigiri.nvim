# (WIP) onigiri

## Description

Not a colorscheme, your colorscheme. This plugin removes the boiler plate needed to create the colorscheme you always wanted!
Set the provided variables and get a well-balanced colorscheme.

### I hate boiler plate!

`onigiri` abstracts away all the boiler plate! Set some variables and be done with it.

### I can't choose a color!

```lua
local presets = require 'onigiri'.presets[<preset_colors>]
```

- Default is `mariana` - Sublime's Mariana. Check the wiki for more examples - feel free to post yours BTW

![](https://user-images.githubusercontent.com/19148108/194763253-1ed1f307-db31-4648-9978-8a3d6fb61bf9.jpg)

### I want those cool TextMate highlights!

`onigiri` already provides custom queries - work in progress - with extra highlights for the following languages:

- `bash`
- `clojure`
- `commonlisp`
- `fennel`
- `go`
- `help`
- `javascript`
- `json`
- `lua`
- `make`
- `markdown_inline`
- `markdown`
- `python`
- `rust`
- `toml`
- `typescript`
- `yaml`

### I need both `dark` and `light` colorschemes!

```lua
---@param color { dark: string, light: string }
local function pick(color)
    return color[vim.o.background]
end
```

### I like to experiment 🧙!!!

`onigiri.nvim` provides a simple port of [chroma-js](https://www.npmjs.com/package/chroma-js). It needs Neovim with LuaJIT or its [BitOp](https://bitop.luajit.org/) module available, else you'll get an error. Worry not, it's available, unless you compiled Neovim without LuaJIT. Which is hardly ever the case.

```lua
local chroma = require 'onigiri'.chroma
---@method hex()              # returns hex string from chroma object,
---@method analogous()        # returns its analogous color
---@method darken(amount)     # [0,1]
---@method desaturate(amount) # [0,1]
---@method lighten(amount)    # [0,1]
---@method rotate(amount)     # [0,360]
---@method saturate(amount)   # [0,1]
local my_color = chroma('#123123') -- Color object
print(my_color:hex())              -- '#123123'
print(my_color:complement():hex()) -- '#311220'
-- etc, ad nauseam, bla, bla, bla ...
```

## Usage

### Requirements

`NVIM v0.9.0-dev`, but for the moment `NVIM v0.8.0` is still supported.

### Installation

With your favorite plugin manager

```lua
use { 'kaiuri/onigiri.nvim' } -- Packer
vim.g.onigiri = {
    theme = {} --- add your configurations here
}
--- then
vim.cmd[[ colo onigiri ]]
```

### Configuration

This plugin supplies a global option `vim.g.onigiri` with one key, at the moment. Must be called before `colo onigiri`.

```lua
--- defaults.
vim.g.onigiri = {
  theme = require 'onigiri'.presets['mariana'],
    --'onigiri'.presets['mariana'] = {
    --     Background = {
    --         default  = "#303841",
    --         emphasis = "#2e353e",
    --         muted    = "#46525c",
    --     },
    --       Foreground = {
    --         default  = "#d8dee9",
    --         emphasis = "#f7f7f7",
    --         muted    = "#a6acb8",
    --         surface  = "#46525c",
    --     },
    --     Shade = {
    --         default  = "#2f373f",
    --         emphasis = "#2e363e",
    --     },
    --     Colors = {
    --         Accent    = "#95B2D6",
    --         Caution   = "#f9ae58",
    --         Danger    = "#f97b58",
    --         Error     = "#ec5f66",
    --         Hint      = "#5fb4b4",
    --         Important = "#fac761",
    --         Info      = "#99c794",
    --         Note      = "#5c99d6",
    --         Trace     = "#cc8ec6",
    --         Warn      = "#ee932b",
    --     }
    --}
}
```

#### Tips

Sharkdp's [pastel](https://github.com/sharkdp/pastel) CLI tool offers a great way to choose your colors.

## Contributing

Anything goes on the issue section. Please use commit messages that follow the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) specification.
