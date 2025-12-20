# CQL Support for NeoVim

#### Install via Lazy.nvim

> [!NOTE]
> If you want to have code completions, you will need to install CQL [language server](https://github.com/Akzestia/cqlls)

```sh
cargo install cql_lsp
```

```lua
-- lua/plugins/nvim-cql.lua
return {
  {
    "Akzestia/nvim-cql-v2",
    lazy = false,
    config = function()
      require("cql").setup()
    end,
  },
}
```
