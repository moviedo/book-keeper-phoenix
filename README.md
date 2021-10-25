# BookKeeper

## Pre-requistes
Install [make](https://formulae.brew.sh/formula/make#default) and [docker desktop](https://www.docker.com/products/docker-desktop).

make 3.82
  1. Optional instructions
  1. Install through [brew](https://brew.sh/)
  1. Install make, `brew install make`
  1. Use make to setup dev, `gmake install_dev`

## Setup
To start your Phoenix server run the command `gmake start`.

This commands runs the following:
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Run `gmake stop` to stop the docker containers and your application.

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
