# CQL Support for NeoVim

### Setup

```sh
cargo install cqlls
```

```lua
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

> [!NOTE]
>
> You will also need to run the following after installing the plugin ^_^
>
> ```sh
> :TSUpdate
> :TSInstall cql
> ```

> [!TIP]
> If you have any issues with the plugin, open issue on laguage server [repo](https://github.com/Akzestia/cqlls) </br>
