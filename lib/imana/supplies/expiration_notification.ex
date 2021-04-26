defmodule Imana.Supplies.ExpirationNotification do
  alias Imana.Mailer
  alias Imana.Supplies.{ExpirationEmail, GetByExpiration}

  def send do
    data = GetByExpiration.call()

    Task.async_stream(data, fn {to_email, supplies} ->
      to_email
      |> ExpirationEmail.create(supplies)
      |> Mailer.deliver_later!()
    end)
    |> Stream.run()
  end
end
