defmodule BookKeeper.Repo do
  use Ecto.Repo,
    otp_app: :book_keeper,
    adapter: Ecto.Adapters.Postgres
end
