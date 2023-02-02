defmodule AshTest.User.Registry do
  use Ash.Registry,
    extensions: [
      # This extension adds helpful compile time validations
      Ash.Registry.ResourceValidations
    ]

  entries do
    entry AshTest.User.User
    entry AshTest.User.Account
    entry AshTest.User.Token
  end
end
