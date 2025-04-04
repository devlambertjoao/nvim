local function get_current_mode() 
  local current_mode = vim.api.nvim_get_mode().mode

  -- Normalize weird characters to readable keys
  if current_mode == "\22" then -- CTRL+V (visual block)
    current_mode = "v_block"
  elseif current_mode == "\19" then -- CTRL+S (select block)
    current_mode = "s_block"
  end

  local mode_name = {
    n = "NORMAL",
    no = "NORMAL",
    v = "VISUAL",
    V = "VISUAL LINE",
    v_block = "VISUAL BLOCK",
    s = "SELECT",
    S = "SELECT LINE",
    s_block = "SELECT BLOCK",
    i = "INSERT",
    ic = "INSERT",
    R = "REPLACE",
    Rv = "VIRTUAL REPLACE",
    c = "COMMAND",
    cv = "VIM EX",
    ce = "EX",
    r = "PROMPT",
    rm = "MOAR",
    ["r?"] = "CONFIRM",
    ["!"] = "SHELL",
    t = "TERMINAL",
  }

  return mode_name[current_mode] or current_mode
end

local function mode()
  local current_mode = get_current_mode()
  return string.format(" %s ", current_mode):upper()
end

local function update_mode_colors()
  -- local current_mode = get_current_mode()
  local mode_color = "%#@attribute#"

  -- if current_mode == "NORMAL" then
  --   mode_color = "%#ModesDelete#"
  -- elseif current_mode == "INSERT" then
  --   mode_color = "%#ModesInsert#"
  -- elseif current_mode == "VISUAL" or current_mode == "VISUAL BLOCK" then
  --   mode_color = "%#ModesVisual#"
  -- elseif current_mode == "REPLACE" then
  --   mode_color = "%#ModesReplace#"
  -- elseif current_mode == "COMMAND" then
  --   mode_color = "%#ModesCopy#"
  -- elseif current_mode == "TERMINAL" then
  --   mode_color = "%#ModesDelete#"
  -- end

  return mode_color
end

local versioncontrol = function()
  local git_info = vim.b.gitsigns_status_dict
  if not git_info or git_info.head == "" then
    return ""
  end

  local added = git_info.added and ("%#GitSignsAdd#+" .. git_info.added .. " ") or ""
  local changed = git_info.changed and ("%#GitSignsChange#~" .. git_info.changed .. " ") or ""
  local removed = git_info.removed and ("%#GitSignsDelete#-" .. git_info.removed .. " ") or ""

  if git_info.added == 0 then
    added = ""
  end
  if git_info.changed == 0 then
    changed = ""
  end
  if git_info.removed == 0 then
    removed = ""
  end

  return table.concat({
    " ",
    added,
    changed,
    removed,
    "%#Directory#· ",
    git_info.head,
    " ",
  })
end

local function filepath()
  local fpath = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.:h")
  if fpath == "" or fpath == "." then
    return " "
  end

  return string.format("%%<%s/", fpath)
end

local function filename()
  local fname = vim.fn.expand("%:t")
  if fname == "" then
    return ""
  end
  return fname .. " "
end

local function lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = "%#DiagnosticError# e" .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = "%#DiagnosticWarn# w" .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = "%#DiagnosticHint# h" .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = "%#DiagnosticInfo# i" .. count["info"]
  end

  return errors .. warnings .. hints .. info .. " "
end

local function filetype()
  if vim.bo.filetype == "" then
    return ""
  end

  return string.format(" %s |", vim.bo.filetype)
end

local function lineinfo()
  if vim.bo.filetype == "" then
    return ""
  end

  return " %l:%c %p%% "
end

Statusline = {}

Statusline.active = function()
  if vim.bo.filetype == "NvimTree" or vim.bo.filetype == "Telescope" or vim.bo.filetype == "alpha" then
    return "%#StatusLine#"
  end

  return table.concat({
    update_mode_colors(),
    mode(),
    "%#StatusLine#",
    versioncontrol(),
    "%#StatusLine# ",
    filepath(),
    filename(),
    "%#StatusLine#%=",
    lsp(),
    "%#StatusLine#",
    filetype(),
    lineinfo(),
  })
end

function Statusline.inactive()
  return "%#StatusLineNC# %F"
end

function Statusline.short()
  return "%#StatusLineNC#"
end

vim.api.nvim_exec(
  [[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]],
  false
)
