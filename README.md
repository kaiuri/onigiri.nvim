# onigiri 🍚

Not a colorscheme, your colorscheme. This plugin removes the boiler plate needed to create the colorscheme you always wanted!
Set the provided variables and get a well-balanced colorscheme.

### I hate boiler plate 🍳

`onigiri` abstracts away all the boiler plate! Set some variables and be done with it.

### I can't choose a color 🎨

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

`onigiri` provides custom queries to make it look pretty even without LSP
semantic highlights.

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
- `python`
- `rust`
- `toml`
- `typescript`
- `yaml`

### 🌚 I need both `dark` and `light` colorschemes 🌝

```lua
---@param color { dark: string, light: string }
local function pick(color)
    return color[vim.o.background]
end
```

### I like to experiment ⚗️

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

### Installation 🔌

Requirements:

- `NVIM v0.9.0-dev`

```lua
use { 'kaiuri/onigiri.nvim' } -- Packer 📦
--- then

vim.cmd[[ colo onigiri ]]
```

### Configuration 🔧

This plugin supplies a global option `vim.g.onigiri` with one key, at the moment. Must be called before `colo onigiri`.

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

### Examples 🖼️

<details><summary><h4>Mariana (default)</h4></summary>
<details><summary>Snippet</summary>

```lua
vim.g.onigiri = {
    theme = {
        Background = {
            default  = '#303841',
            emphasis = '#2e353e',
            muted    = '#3b454e'
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
            Warn      = '#ee932b'
        },
        Foreground = {
            default  = '#d8dee9',
            emphasis = '#f7f7f7',
            muted    = '#a6acb8',
            surface  = '#46525c'
        },
        Shade = {
            default  = '#2f373f',
            emphasis = '#2e363e'
        }
    }
}
```

</details>

<img src="https://user-images.githubusercontent.com/19148108/194763253-1ed1f307-db31-4648-9978-8a3d6fb61bf9.jpg" width="60%">

</details>

<details><summary><h4>Solarized Dark</h4></summary>
<details><summary>Snippet</summary>

```lua
vim.g.onigiri = {
  theme = {
    Background = {
      default  = '#04303d',
      emphasis = '#022e39',
      muted    = '#1b414c'
    },
    Colors = {
      Accent    = '#6885dc',
      Caution   = '#ff8c00',
      Danger    = '#e9723b',
      Error     = '#e04c49',
      Hint      = '#00afaf',
      Important = '#c9c600',
      Info      = '#92b76a',
      Note      = '#51aaea',
      Trace     = '#dc609c',
      Warn      = '#e8ae00'
    },
    Foreground = {
      default  = '#eee8d5',
      emphasis = '#ffffd7',
      muted    = '#93a1a1',
      surface  = '#6f8286'
    },
    Shade = {
      default  = '#022e39',
      emphasis = '#04303d'
    }
  }
}
```

</details>

![Screenshot from 2022-10-28 08-55-25](https://user-images.githubusercontent.com/19148108/198581972-0454849b-3465-4b52-898c-8e0c49a10c17.png)

</details>

<details><summary><h4>Tokyo Night-ish</h4></summary>
<details><summary>Snippet</summary>

```lua
vim.g.onigiri = {
  theme = {
    Background = {
      default  = '#232538',
      emphasis = '#1f2132',
      muted    = '#393d5e'
    },
    Colors = {
      Accent    = '#86e0fc',
      Caution   = '#fdd8ba',
      Danger    = '#ff9971',
      Error     = '#ff7a83',
      Hint      = '#a1e2dc',
      Important = '#ffc677',
      Info      = '#c4e88d',
      Note      = '#82aaff',
      Trace     = '#c099ff',
      Warn      = '#f6ba89'
    },
    Foreground = {
      default  = '#c0caf5',
      emphasis = '#cdd5f7',
      muted    = '#828bb8',
      surface  = '#444a73'
    },
    Shade = {
      default  = '#202233',
      emphasis = '#1d1f2f'
    }
  }
}
```

</details>

![Screenshot from 2022-11-02 08-39-37](https://user-images.githubusercontent.com/19148108/199481365-4bd04cd7-c267-43ca-901f-89ef21fd91c8.png)

</details>

## Contributing ✍️

Anything goes on the issue section. Please use commit messages that follow the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) specification.
