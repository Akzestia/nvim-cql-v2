local M = {}

function M.setup()
  local parsers = require("nvim-treesitter.parsers")

  local parser_configs = parsers.get_parser_configs
    and parsers.get_parser_configs()
    or parsers

  parser_configs.cql = {
    install_info = {
      url = "https://github.com/Akzestia/tree-sitter-cql",
      branch = "main",
      files = { "src/parser.c" },
      revision = "b3fb29a60d096abf36726cfa2c2480e7c5ea777f",
    },
    filetype = "cqlang",
  }

  vim.treesitter.language.register("cql", "cqlang")
end

return M
