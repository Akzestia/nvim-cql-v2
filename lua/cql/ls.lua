local M = {}

function M.setup()
	local lspconfig = require("lspconfig")
	local configs = require("lspconfig.configs")
	local util = require("lspconfig.util")

	if not configs.cql then
		configs.cql = {
			default_config = {
				cmd = { "cqlls" },
				filetypes = { "cqlang" },
				root_dir = function(fname)
					return util.find_git_ancestor(fname) or util.path.dirname(fname)
				end,
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			},
		}
	end

	lspconfig.cql.setup({})
end

return M
