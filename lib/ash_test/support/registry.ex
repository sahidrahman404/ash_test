defmodule AshTest.Support.Registry do
  use Ash.Registry,
    extensions: [
      # This extension adds helpful compile time validations
      Ash.Registry.ResourceValidations
    ]

  entries do
    entry AshTest.Support.Ticket
    entry AshTest.Support.Representative
  end
end
