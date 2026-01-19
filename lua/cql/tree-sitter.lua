local M = {}

function M.setup()
    vim.api.nvim_create_autocmd('User', { pattern = 'TSUpdate',
    callback = function()
      require('nvim-treesitter.parsers').cql = {
    install_info = {
      url = 'https://github.com/Akzestia/tree-sitter-cql',
      revision = "b3fb29a60d096abf36726cfa2c2480e7c5ea777f",
      queries = 'queries/neovim',
    },
  }
end})
end

return M
