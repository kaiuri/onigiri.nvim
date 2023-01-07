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

-- local onigiri = require 'onigiri'
-- local presets = require 'onigiri.presets'

vim.cmd.color 'onigiri'