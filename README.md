# BookKeeper

## Pre-requistes
Install [make](https://formulae.brew.sh/formula/make#default) and [docker desktop](https://www.docker.com/products/docker-desktop).

make 3.82
  1. Optional instructions
  1. Install through [brew](https://brew.sh/)
  1. Install make, `brew install make`

## Setup
To start your Phoenix server run the command `make start` or `gmake start`.

This commands runs the following:
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Run `make stop` to stop the docker containers and your application.

Run `make help` for all available command options.

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
