defmodule AshTest.Repo do
  use AshPostgres.Repo, otp_app: :ash_test

  def installed_extensions do
    ["uuid-ossp", "citext"]
  end
end
