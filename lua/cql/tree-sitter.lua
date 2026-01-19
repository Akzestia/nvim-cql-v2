local M = {}

function M.setup()
    local ok, parsers = pcall(require, "nvim-treesitter.parsers")
    if not ok then
        vim.notify("nvim-treesitter not found", vim.log.levels.ERROR)
        return
    end
  
    if parsers.get_parser_configs then
        local parser_configs = parsers.get_parser_configs()
        parser_configs.cql = {
            install_info = {
                url = "https://github.com/Akzestia/tree-sitter-cql",
                branch = "main",
                files = { "src/parser.c" },
            },
            filetype = "cqlang",
        }
    elseif type(parsers) == "table" then
        parsers.cql = {
            install_info = {
                url = "https://github.com/Akzestia/tree-sitter-cql",
                branch = "main",
                files = { "src/parser.c" },
            },
            filetype = "cqlang",
        }
    end

    vim.treesitter.language.register("cql", "cqlang")

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "cqlang",
        callback = function(args)
            pcall(vim.treesitter.start, args.buf, "cql")
        end,
    })
end

return M
