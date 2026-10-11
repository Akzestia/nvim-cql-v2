local M = {}

local function capabilities()
	local ok, blink = pcall(require, "blink.cmp")
	if ok then
		return blink.get_lsp_capabilities()
	end
	return vim.lsp.protocol.make_client_capabilities()
end

function M.setup()
	local config = {
		cmd = { "cqlls" },
		filetypes = { "cqlang" },
		root_markers = { ".cqlls", ".git" },
		capabilities = capabilities(),
	}

	if vim.lsp.config and vim.lsp.enable then
		vim.lsp.config("cqlls", config)
		vim.lsp.enable("cqlls")
		return
	end

	local ok, lspconfig = pcall(require, "lspconfig")
	if not ok then
		vim.notify("CQL: Neovim < 0.11 requires nvim-lspconfig", vim.log.levels.WARN)
		return
	end

	local configs = require("lspconfig.configs")
	local util = require("lspconfig.util")

	if not configs.cql then
		configs.cql = {
			default_config = {
				cmd = config.cmd,
				filetypes = config.filetypes,
				root_dir = util.root_pattern(unpack(config.root_markers)),
				capabilities = config.capabilities,
			},
		}
	end

	lspconfig.cql.setup({})
end

return M
