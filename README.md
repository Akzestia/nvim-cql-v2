# CQL Support for NeoVim

> [!TIP]
> CQL is now supported by GitHub | [github-linguist v9.4.0](https://github.com/github-linguist/linguist/releases/tag/v9.4.0)
> Example using `cql` instad of `sql`
> ```cql
> ALTER MATERIALIZED VIEW cycling.cyclist_by_age
> ALTER MATERIALIZED VIEW cycling.cyclist_by_age
> WITH comment = 'A most excellent and useful view'
> AND bloom_filter_fp_chance = 0.02;
> 
> ALTER MATERIALIZED VIEW cycling.cyclist_by_age
> WITH compression = {
>    'stable_compression' : 'DeflateCompressor',
>    'chunk_length_kb' : 64
> }
> AND compaction = {
>    'class' : 'SizeTieredCompactionStrategy',
>    'max_threshold' : 64
> };
>
> ALTER MATERIALIZED VIEW cycling.cyclist_by_age
> WITH caching = {
>    'keys' : 'NONE',
>    'rows_per_partition' : '15'
> };
> ```

#### Install via Lazy.nvim

> [!NOTE]
> If you want to have code completions, you will need to install CQL [language server](https://github.com/Akzestia/cqlls)

```sh
# Install cqlls using cargo
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
