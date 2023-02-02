defmodule AshTestWeb.ApiAuthController do
  use AshTestWeb, :controller
  use AshAuthentication.Phoenix.Controller
  alias AshAuthentication.TokenRevocation

  def success(conn, _activity, account, token) do
    conn
    |> put_status(200)
    |> json(%{
      authentication: %{
        status: :success,
        bearer: token
      }
    })
  end

  def failure(conn, _activity, reason) do
    IO.inspect(reason)
    conn
    |> put_status(401)
    |> json(%{
      authentication: %{
        status: :failed
      }
    })
  end

  def sign_out(conn, _params) do
    conn
    # |> revoke_bearer_tokens()
    |> json(%{
      status: :ok
    })
  end
end
