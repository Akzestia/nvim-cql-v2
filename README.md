# CQL Support for NeoVim

### Install

```sh
# Install Language Server
cargo install cqlls
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
