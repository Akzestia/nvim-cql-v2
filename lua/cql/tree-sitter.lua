local M = {}

function M.setup()
    vim.filetype.add({
        extension = { cql = "cqlang" },
    })

    vim.treesitter.language.register("cql", "cqlang")

    vim.schedule(function()
        local ok, parsers = pcall(require, "nvim-treesitter.parsers")
        if ok then
            local cfg = type(parsers.get_parser_configs) == "function"
                and parsers.get_parser_configs()
                or parsers

            cfg.cql = {
                install_info = {
                    url = "https://github.com/Akzestia/tree-sitter-cql",
                    files = { "src/parser.c" },
                    revision = "b3fb29a60d096abf36726cfa2c2480e7c5ea777f",
                    queries = "queries/neovim",
                },
                filetype = "cqlang",
            }
        end
    end)

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "cqlang",
        callback = function()
            vim.treesitter.start()
        end,
    })
end

return M
