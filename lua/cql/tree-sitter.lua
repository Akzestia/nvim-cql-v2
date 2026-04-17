local M = {}

function M.setup()
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.cql = {
        install_info = {
            url = "https://github.com/Akzestia/tree-sitter-cql",
            files = { "src/parser.c" },
            revision = "b3fb29a60d096abf36726cfa2c2480e7c5ea777f",
            queries = "queries/neovim",
        },
        filetype = "cqlang",
    }

    vim.filetype.add({
        extension = {
            cql = "cqlang",
        },
    })

    vim.treesitter.language.register("cql", "cqlang")

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "cqlang",
        callback = function()
            vim.treesitter.start()
        end,
    })
end

return M
