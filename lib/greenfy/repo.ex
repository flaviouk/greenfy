defmodule Greenfy.Repo do
  use Ecto.Repo,
    otp_app: :greenfy,
    adapter: Ecto.Adapters.Postgres
end
