local bg = "#161423"
local fg = "#9e9ea0"
local black = "#2d283e"
local muted = "#58506a"
local cursor = "#a188f7"
local red = "#ec2160"
local green = "#52a95d"
local yellow = "#8ddc1f"
local magenta = "#8c35c8"
local purple = "#ac81c1"

local grape = {
  normal = {
    a = { fg = bg, bg = cursor, gui = "bold" },
    b = { fg = cursor, bg = black },
    c = { fg = fg, bg = bg },
  },
  insert = {
    a = { fg = bg, bg = green, gui = "bold" },
    b = { fg = green, bg = black },
    c = { fg = fg, bg = bg },
  },
  visual = {
    a = { fg = bg, bg = magenta, gui = "bold" },
    b = { fg = purple, bg = black },
    c = { fg = fg, bg = bg },
  },
  replace = {
    a = { fg = bg, bg = red, gui = "bold" },
    b = { fg = red, bg = black },
    c = { fg = fg, bg = bg },
  },
  command = {
    a = { fg = bg, bg = yellow, gui = "bold" },
    b = { fg = yellow, bg = black },
    c = { fg = fg, bg = bg },
  },
  terminal = {
    a = { fg = bg, bg = green, gui = "bold" },
    b = { fg = green, bg = black },
    c = { fg = fg, bg = bg },
  },
  inactive = {
    a = { fg = muted, bg = black },
    b = { fg = muted, bg = bg },
    c = { fg = muted, bg = bg },
  },
}

return grape
