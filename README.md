# CQL Support for NeoVim

> [!TIP]
> CQL is now supported by GitHub | [github-linguist v9.4.0](https://github.com/github-linguist/linguist/releases/tag/v9.4.0)

#### Install via Lazy.nvim

> [!NOTE]
> If you want to have code completions, you will need to install CQL [language server](https://github.com/Akzestia/cqlls)

```sh
# Install cqlls using cargo
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

> [!TIP]
> If you have any issues with the plugin, open issue on laguage server [repo](https://github.com/Akzestia/cqlls) </br>
