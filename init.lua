require 'core.options'

require 'core.keymaps'

vim.deprecate = function() end

vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then error('Error cloning lazy.nvim:\n' .. out) end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status plugins, run
--    :Lazy
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
    require 'plugins.neotree',
    require 'plugins.colortheme',
    require 'plugins.bufferline',
    require 'plugins.lualine',
    require 'plugins.treesitter',
    require 'plugins.telescope',
    require 'plugins.lsp',
    require 'plugins.autocompletion',
    require 'plugins.gitsigns',
    require 'plugins.alpha',
    require 'plugins.ident-blankline',
    require 'plugins.misc',
})

local theme_manager = require('plugins.theme-manager')
theme_manager.setup_keymaps()

-- Optional: Show welcome message
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    vim.schedule(function()
      print('🎨 Tokyo Night (default) | <leader>th for themes')
    end)
  end,
})
