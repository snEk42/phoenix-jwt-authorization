defmodule Addressbook.Repo do
  use Ecto.Repo,
    otp_app: :addressbook,
    adapter: Ecto.Adapters.Postgres
end
