# CQL Support for NeoVim

> [!TIP]
> CQL is now supported by GitHub | [github-linguist v9.4.0](https://github.com/github-linguist/linguist/releases/tag/v9.4.0)
> Example using `cql` instad of `sql`
> ```cql
> USE "japanese";
>
> INSERT INTO users (
>     ユーザーID,
>     ユーザー名,
>     連絡先,
>     住所一覧,
>     タグ,
>     設定,
>     最終ログイン,
>     作成日時
> )
> VALUES (
>     uuid(),
>     '不思議の国のアリス',
>     {
>         メール: 'アリス@example.com',
>         電話番号: '+81-90-1234-5678',
>         希望連絡時間: {
>             '朝',
>             '夕方'
>         }
>     },
>     {
>         '自宅': {
>             通り: '東京都渋谷区神宮前1-2-3',
>             市区町村: '東京',
>             郵便番号: '150-0001',
>             国: '日本'
>         },
>         '職場': {
>             通り: '東京都千代田区丸の内4-5-6',
>             市区町村: '東京',
>             郵便番号: '100-0005',
>             国: '日本'
>         }
>     },
>     {
>         'プレミアム',
>         '認証済み',
>         '早期採用者'
>     },
>     {
>         'テーマ': 'ダーク',
>         '言語': '日本語',
>         '通知': '有効'
>     },
>     toTimestamp(now()),
>     toTimestamp(now())
> );
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
