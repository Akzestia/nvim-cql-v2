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

            local parser_ok = pcall(vim.treesitter.language.inspect, "cql")
            if not parser_ok then
                vim.notify("CQL: Installing treesitter parser...", vim.log.levels.INFO)
                require("nvim-treesitter.install").install("cql"):wait()
            end
        end
    end)

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "cqlang",
        callback = function()
            local ok = pcall(vim.treesitter.language.inspect, "cql")
            if ok then
                vim.treesitter.start()
            else
                vim.notify(
                    "CQL: Parser still installing, reopen the file in a moment.",
                    vim.log.levels.WARN
                )
            end
        end,
    })
end

return M
