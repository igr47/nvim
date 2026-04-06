-- Theme management functions
local M = {}

-- State tracking
M.transparent_enabled = true
M.current_theme = 'tokyonight'

-- Function to refresh lualine after theme change
local function refresh_lualine()
  local ok, lualine = pcall(require, 'lualine')
  if ok and lualine and lualine.refresh then
    lualine.refresh()
  end
  vim.cmd('redrawstatus')
end

-- Function to refresh bufferline
local function refresh_bufferline()
  local ok, bufferline = pcall(require, 'bufferline')
  if ok and bufferline and bufferline.refresh then
    bufferline.refresh()
  end
end

-- Function to refresh Neo-tree
local function refresh_neotree()
  local ok, neotree = pcall(require, 'neo-tree')
  if ok and neotree and neotree.close then
    -- Close and reopen neo-tree if it's open to refresh colors
    local neotree_win = vim.fn.bufwinid('neo-tree filesystem')
    if neotree_win ~= -1 then
      vim.cmd('Neotree close')
      vim.defer_fn(function()
        vim.cmd('Neotree show position=left')
      end, 50)
    end
  end
end

-- Function to refresh Telescope
local function refresh_telescope()
  -- Telescope doesn't have a built-in refresh, but we can clear its highlights
  -- and force a redraw
  vim.cmd('redrawtabline')
  vim.cmd('redrawstatus')
  -- Force refresh all Telescope windows if any are open
  local ok, telescope = pcall(require, 'telescope')
  if ok and telescope then
    -- This will cause any open telescope pickers to reload their highlights
    vim.cmd('doautocmd ColorScheme')
  end
end

-- Set transparency for current theme
function M.set_transparency(enabled)
  M.transparent_enabled = enabled
  local theme = vim.g.colors_name or M.current_theme
  
  if theme == 'tokyonight' then
    require('tokyonight').setup({ transparent = enabled })
    vim.cmd.colorscheme('tokyonight')
  elseif theme == 'nord' then
    vim.g.nord_disable_background = enabled
    vim.cmd.colorscheme('nord')
  elseif theme == 'gruvbox' then
    require('gruvbox').setup({ transparent = enabled })
    vim.cmd.colorscheme('gruvbox')
  elseif theme == 'monokai-pro' then
    require('monokai-pro').setup({ transparent_background = enabled })
    vim.cmd.colorscheme('monokai-pro')
  end
  
  refresh_lualine()
  refresh_bufferline()
  refresh_neotree()
  refresh_telescope()
end

-- Theme switching functions
function M.set_tokyonight()
  require('tokyonight').setup({ transparent = M.transparent_enabled })
  vim.cmd.colorscheme('tokyonight')
  M.current_theme = 'tokyonight'
  print('🎨 Theme switched to Tokyo Night')
  refresh_lualine()
  refresh_bufferline()
  refresh_neotree()
  refresh_telescope()
end

function M.set_nord()
  vim.g.nord_disable_background = M.transparent_enabled
  vim.cmd.colorscheme('nord')
  M.current_theme = 'nord'
  print('🎨 Theme switched to Nord')
  refresh_lualine()
  refresh_bufferline()
  refresh_neotree()
  refresh_telescope()
end

function M.set_gruvbox()
  require('gruvbox').setup({ transparent = M.transparent_enabled })
  vim.cmd.colorscheme('gruvbox')
  M.current_theme = 'gruvbox'
  print('🎨 Theme switched to Gruvbox')
  refresh_lualine()
  refresh_bufferline()
  refresh_neotree()
  refresh_telescope()
end

function M.set_monokai()
  require('monokai-pro').setup({ transparent_background = M.transparent_enabled })
  vim.cmd.colorscheme('monokai-pro')
  M.current_theme = 'monokai-pro'
  print('🎨 Theme switched to Monokai Pro')
  refresh_lualine()
  refresh_bufferline()
  refresh_neotree()
  refresh_telescope()
end

-- Toggle transparency
function M.toggle_transparency()
  M.set_transparency(not M.transparent_enabled)
  print(M.transparent_enabled and '✨ Transparency: ON' or '✨ Transparency: OFF')
end

-- Show help menu
function M.show_theme_help()
  print([[
🎨 Available Themes:
  <leader>tn  → Tokyo Night (default)
  <leader>nd  → Nord
  <leader>gv  → Gruvbox
  <leader>mn  → Monokai Pro
  <leader>bg  → Toggle transparency
  ]])
end

-- Setup keymaps
function M.setup_keymaps()
  vim.keymap.set('n', '<leader>tn', M.set_tokyonight, { noremap = true, silent = true, desc = 'Tokyo Night theme' })
  vim.keymap.set('n', '<leader>nd', M.set_nord, { noremap = true, silent = true, desc = 'Nord theme' })
  vim.keymap.set('n', '<leader>gv', M.set_gruvbox, { noremap = true, silent = true, desc = 'Gruvbox theme' })
  vim.keymap.set('n', '<leader>mn', M.set_monokai, { noremap = true, silent = true, desc = 'Monokai Pro theme' })
  vim.keymap.set('n', '<leader>bg', M.toggle_transparency, { noremap = true, silent = true, desc = 'Toggle background transparency' })
  vim.keymap.set('n', '<leader>th', M.show_theme_help, { noremap = true, silent = true, desc = 'Theme help' })
end

return M
