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

    vim.filetype.add({
        extension = {
            cql = "cqlang",
        },
    })
    vim.treesitter.language.register("cql", "cqlang")

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "cqlang",
        callback = function(args)
            local started, err = pcall(vim.treesitter.start, args.buf, "cql")
            if not started then
                vim.notify("CQL: " .. tostring(err), vim.log.levels.WARN)
            end
        end,
    })
end

return M
