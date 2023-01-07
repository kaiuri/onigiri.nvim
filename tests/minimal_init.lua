vim.cmd [[set runtimepath+=.]]
vim.cmd [[runtime! plugin/plenary.vim]]
vim.o.swapfile = false
vim.bo.swapfile = false

vim.g.onigiri = {
  theme = {
    Background = {
      default = '#31302f',
      emphasis = '#2f2d2c',
      muted = '#3c3d3b'
    },
    Colors = {
      Accent = '#2ba7bd',
      Caution = '#fa9420',
      Danger = '#ff4b45',
      Error = '#ff4573',
      Hint = '#1fc08a',
      Important = '#ffc95c',
      Info = '#62ce38',
      Note = '#28a0e1',
      Trace = '#ef50cd',
      Warn = '#f2632b'
    },
    Foreground = {
      default = '#fbf1c7',
      emphasis = '#fdf9e7',
      muted = '#928374',
      surface = '#484a49'
    },
    Shade = {
      default = '#302f2e',
      emphasis = '#2f2e2c'
    }
  }
}

local function print_test(status, results)
  results = results or 'Empty results'
  return ({
    [false] = function(results)
      print('Error: ' .. vim.pretty_print(results))
    end,
    [true] = function(results)
      print('Success: ' .. vim.pretty_print(results))
    end,
  })[status](results)
end

local function test(name, cb)
  print('Running test: ' .. name)
  local status, results = pcall(cb)
  print_test(status, results)
end

test('load colorscheme', function()
  vim.cmd.color 'onigiri'
end)
test('load plugin', function()
  local onigiri = require 'onigiri'
  assert(onigiri ~= nil, 'onigiri plugin failed to load')
end)
test('plugin configuration', function()
  local config = require 'onigiri'.config
  assert(config ~= nil, 'could not load config')
  assert(config() ~= nil, 'could not run onigiri.config()')
end)
test('onigiri presets', function()
  local presets = require 'onigiri'.presets
  assert(presets ~= nil, 'could not load presets')
  assert(type(tostring(presets)) == 'string', 'could not print presets')
end)
test('onigiri.chroma', function()
  local Chroma = require 'onigiri'.chroma ---@function
  local color = Chroma '#ff0000' ---@type ChromaColor
  local hsl = color.hsl
  local hsl = assert(hsl, 'could not convert hex to hsl')
  local scale = assert(color:scale(10), 'could not scale color')
end)
