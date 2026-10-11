local M = {}

local did_setup = false

function M.setup()
	if did_setup then
		return
	end
	did_setup = true

	require("cql.tree-sitter").setup()
	require("cql.ls").setup()
end

return M
