# onigiri 🍚

Give it some ingredients and it makes the perfect onig... Oh... colorscheme!

### Screenshots

#### Mariana

<img src="https://user-images.githubusercontent.com/19148108/204261202-bb691e2e-5b77-4c8a-a1f6-e1811b7248b1.png" width="60%">

#### Solarized Dark

<img src="https://user-images.githubusercontent.com/19148108/204261315-6e1c2d32-a50a-4b9b-baed-b2c8886294cd.png" width="60%">

#### Tokyo Night-ish

<img src="https://user-images.githubusercontent.com/19148108/204261493-17b28b1e-8c17-47bc-8aba-e51a8bff9a68.png" width="60%">

#### Gruvbox-ish

<img src="https://user-images.githubusercontent.com/19148108/204261607-be667f73-13e6-41ea-be58-bbc6469853fa.png" width="60%">

#### ImHex

<img src="https://user-images.githubusercontent.com/19148108/204261729-9bf5d6b9-455a-4aaf-9329-06f2d25a1883.png" width="60%">

### I hate boiler plate 🍳

`onigiri` abstracts away most the boiler plate! From `592` to `19`!

### I can't choose! 🎨

`onigiri` provides a preset theme you can make yours

```lua
local mariana = require 'onigiri'.presets['mariana'] -- Sublime's Mariana Theme
```

<details>

```lua
-- {
--   Background = {
--     default  = "#303841",
--     emphasis = "#2e353e",
--     muted    = "#3b454e"
--   },
--   Colors = {
--     Accent    = "#95B2D6",
--     Caution   = "#f9ae58",
--     Danger    = "#f97b58",
--     Error     = "#ec5f66",
--     Hint      = "#5fb4b4",
--     Important = "#fac761",
--     Info      = "#99c794",
--     Note      = "#5c99d6",
--     Trace     = "#cc8ec6",
--     Warn      = "#ee932b"
--   },
--   Foreground = {
--     default  = "#d8dee9",
--     emphasis = "#f7f7f7",
--     muted    = "#a6acb8",
--     surface  = "#46525c"
--   },
--   Shade = {
--     default  = "#2f373f",
--     emphasis = "#2e363e"
--   }
-- }
```

</details>

### I want those cool TextMate highlights 🎭

`onigiri` provides custom queries to **make it look pretty** even **without LSP semantic highlighting**.

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
- `markdown`
- `markdown_inline`
- `python`
- `rust`
- `toml`
- `typescript`
- `vim`
- `yaml`

### 🌚 I need both `dark` and `light` colorschemes 🌝

```lua
---@param color { dark: string, light: string }
local function pick(color)
    return color[vim.o.background]
end
```

<!--
### I like to experiment ⚗️

`onigiri` provides a simple port of [chroma-js](https://www.npmjs.com/package/chroma-js). It needs Neovim with LuaJIT or its [BitOp](https://bitop.luajit.org/) module available, else you'll get an error. Worry not, it's available, unless you compiled Neovim without LuaJIT. Which is hardly ever the case.

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
-->

### Installation 🔌

Requirements:

- `NVIM v0.9.0-dev`

```lua
use { 'kaiuri/onigiri.nvim' } -- Packer 📦
--- then

vim.cmd[[ colo onigiri ]]
```

### Configuration 🔧

Done through global `vim.g.onigiri`. Must be called before `colo onigiri`. Check the Wiki for examples.

```lua
-- Defaults
vim.g.onigiri = {
    theme = {
        Background = {
            default  = '#303841',
            emphasis = '#2e353e',
            muted    = '#46525c',
        },
        Foreground = {
            default  = '#d8dee9',
            emphasis = '#f7f7f7',
            muted    = '#a6acb8',
            surface  = '#46525c',
        },
        Shade = {
            default  = '#2f373f',
            emphasis = '#2e363e',
        },
        Colors = {
            Accent    = '#95B2D6',
            Caution   = '#f9ae58',
            Danger    = '#f97b58',
            Error     = '#ec5f66',
            Hint      = '#5fb4b4',
            Important = '#fac761',
            Info      = '#99c794',
            Note      = '#5c99d6',
            Trace     = '#cc8ec6',
            Warn      = '#ee932b',
        }
    }
}
```

## Contributing ✍️

Anything goes on the issue section. Please use commit messages that follow the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) specification.
