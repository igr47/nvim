return {
  -- Tokyo Night (Default)
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        style = 'night',
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
        },
      })
      vim.cmd.colorscheme('tokyonight')
    end,
  },

  -- Nord theme
  {
    'shaunsingh/nord.nvim',
    lazy = true,
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      vim.g.nord_disable_background = true
      vim.g.nord_italic = false
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = false
      require('nord').set()
    end,
  },

  -- Gruvbox theme
  {
    'ellisonleao/gruvbox.nvim',
    lazy = true,
    opts = {
      transparent = true,
      contrast = 'hard',
      italic = {
        comments = false,
        keywords = false,
        functions = false,
        strings = false,
        variables = false,
      },
    },
    config = function(_, opts)
      require('gruvbox').setup(opts)
      vim.cmd.colorscheme('gruvbox')

      local hl_groups = {
        "Normal", "NormalNC", "SignColumn", "StatusLine", 
        "StatusLineNC", "EndOfBuffer", "MsgArea", 
        "NormalFloat", "FloatBorder", "Pmenu"
      }
      for _, group in ipairs(hl_groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none" })
      end
    end, -- Fixed: removed extra brace and comma that were causing the crash
  },

  -- Monokai Pro theme
  {
    'loctvl842/monokai-pro.nvim',
    lazy = true,
    config = function()
      require('monokai-pro').setup({
        transparent_background = true,
        italics = false,
        filter = 'classic',
      })
    end,
  },
}

