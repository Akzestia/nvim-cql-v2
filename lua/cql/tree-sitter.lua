local M = {}

function M.setup()
    local ok, parsers = pcall(require, "nvim-treesitter.parsers")
    if not ok then
        vim.notify("nvim-treesitter is required for cql", vim.log.levels.ERROR)
        return
    end

    local parser_config = parsers.get_parser_configs()
    parser_config.cql = {
        install_info = {
            url = "https://github.com/Akzestia/tree-sitter-cql",
            branch = "main",
            files = { "src/parser.c" },
            revision = "b3fb29a60d096abf36726cfa2c2480e7c5ea777f",
        },
        filetype = "cqlang",
    }
	
    vim.treesitter.language.register("cql", "cqlang")

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "cqlang",
        callback = function(args)
            -- Explicitly specify the language
            local ok, err = pcall(vim.treesitter.start, args.buf, "cql")
            if not ok then
                vim.notify(
                    "CQL parser not installed. Run :TSInstall cql",
                    vim.log.levels.WARN,
                    { once = true }
                )
            end
        end,
    })
end

return M
