local M = {}

function M.setup()
    vim.filetype.add({
        extension = {
            cql = "cqlang",
        },
    })
    vim.treesitter.language.register("cql", "cqlang")

    local ok, ts_parsers = pcall(require, "nvim-treesitter.parsers")
    if ok and ts_parsers.list then
        ts_parsers.list.cql = {
            install_info = {
                url = "https://github.com/Akzestia/tree-sitter-cql",
                branch = "main",
                files = { "src/parser.c" },
            },
            filetype = "cqlang",
            maintainers = { "@Akzestia" },
        }
    end

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "cqlang",
        callback = function(args)
            local started = pcall(vim.treesitter.start, args.buf, "cql")
            if not started then
                vim.notify("CQL parser not installed. Run :TSInstall cql", vim.log.levels.WARN, { once = true })
            end
        end,
    })
end

return M
