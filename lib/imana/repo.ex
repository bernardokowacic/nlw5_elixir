defmodule Imana.Repo do
  use Ecto.Repo,
    otp_app: :imana,
    adapter: Ecto.Adapters.Postgres
end
