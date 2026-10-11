local M = {}

local install_info = {
	url = "https://github.com/Akzestia/tree-sitter-cql",
	revision = "b3fb29a60d096abf36726cfa2c2480e7c5ea777f",
	queries = "queries/neovim",
}

local function register_parser()
	local ok, parsers = pcall(require, "nvim-treesitter.parsers")
	if not ok then
		return
	end

	if type(parsers.get_parser_configs) == "function" then
		local configs = parsers.get_parser_configs()
		if not configs.cql then
			configs.cql = {
				install_info = {
					url = install_info.url,
					revision = install_info.revision,
					files = { "src/parser.c" },
				},
				filetype = "cqlang",
			}
		end
	elseif not parsers.cql then
		parsers.cql = { install_info = install_info }
	end
end

local warned = false

local function start(buf)
	if not pcall(vim.treesitter.language.add, "cql") then
		if not warned then
			warned = true
			vim.notify("CQL: tree-sitter parser not installed, run :TSInstall cql", vim.log.levels.WARN)
		end
		return
	end
	pcall(vim.treesitter.start, buf, "cql")
end

function M.setup()
	local group = vim.api.nvim_create_augroup("cql_treesitter", { clear = true })

	vim.api.nvim_create_autocmd("User", {
		group = group,
		pattern = "TSUpdate",
		callback = register_parser,
	})

	register_parser()

	vim.filetype.add({
		extension = {
			cql = "cqlang",
		},
	})

	vim.treesitter.language.register("cql", "cqlang")

	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		pattern = "cqlang",
		callback = function(args)
			start(args.buf)
		end,
	})
end

return M
