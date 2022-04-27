# PhxElm

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Changes until now

[See also](https://hexdocs.pm/phoenix/asset_management.html#content)

 - 
    ``` bash
    cd assets
    npm install esbuild --save-dev
    npm install esbuild-plugin-elm --save-dev

    npm install ../deps/phoenix ../deps/phoenix_html ../deps/phoenix_live_view --save
    ```

 -
   ``` elixir
   # config.exs

   # Comment out esbuild config
   # config :esbuild,
   ```
  
 - Create [`assets/build.json`](./assets/build.json)
 - Create [`assets/src/Main.elm`](./assets/src/Main.elm)

 -
   ``` elixir
   # dev.exs

   config :phx_elm, PhxElmWeb.Endpoint,
    # ...
    watchers: [
      # Start the esbuild watcher by calling Esbuild.install_and_run(:default, args)
      # esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]}
      node: ["build.js", "--watch", cd: Path.expand("../assets", __DIR__)]
    ]
   ```
  
  - tailwind support, see [commit](https://github.com/zoten/phx_elm/commit/fdead626b4b921943c8c14657e275a112eb77c21)
