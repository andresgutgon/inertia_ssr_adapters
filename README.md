# What is this?
This repository is testing that standard [Elixir Phoenix](https://github.com/inertiajs/inertia-phoenix) keep working as expected after the [introduction of the SSR adapters in this PR](https://github.com/inertiajs/inertia-phoenix/pull/44)

## How to setup development?
After cloning this repo. This asume you have a postgres database running locally (or in a docker container).

```
mix deps.get
mix ecto.create
mix ecto.migrate
mix ecto.migrate --migrations-path priv/repo/data_migrations
```

After this you can run the server with:

```
mix phx.server
```

## How to test a production setup?

This repo have releases setup. You can build a release with:

