local M = {}

function M.setup()
    vim.schedule(function()
        local ok, parsers = pcall(require, "nvim-treesitter.parsers")
        if not ok then
            vim.notify("CQL: nvim-treesitter not found, skipping parser registration", vim.log.levels.WARN)
            return
        end

        local parser_config = parsers.get_parser_configs()
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
            extension = { cql = "cqlang" },
        })

        vim.treesitter.language.register("cql", "cqlang")
    end)

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "cqlang",
        callback = function()
            vim.treesitter.start()
        end,
    })
end

return M
