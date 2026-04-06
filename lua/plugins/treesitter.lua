return {
  'nvim-treesitter/nvim-treesitter',

  build = ':TSUpdate',

  lazy = false, 
  priority = 1000,

  config = function()
    require('nvim-treesitter.config').setup({
      ensure_installed = {
        'lua', 'python', 'javascript', 'typescript',
        'vimdoc', 'vim', 'regex', 'terraform',
        'sql', 'dockerfile', 'toml', 'json',
        'java', 'groovy', 'go', 'gitignore',
        'graphql', 'yaml', 'make', 'cmake',
        'markdown', 'markdown_inline',
        'bash', 'tsx', 'css', 'html',
        'cpp', 'rust'
      },

      auto_install = true,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },

      indent = {
        enable = true,
        disable = { 'ruby' },
      },
    })
  end,
}
