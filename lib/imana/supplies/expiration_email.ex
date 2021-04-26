defmodule Imana.Supplies.ExpirationEmail do
  import Bamboo.Email

  alias Imana.Supply

  def create(to_email, supplies) do
    new_email(
      to: to_email,
      from: "app@imana.com.br",
      subject: "Supplies that are about to expire",
      text_body: email_text(supplies)
    )
  end

  defp email_text(supplies) do
    initial_text = "-- Supplies about to expire --\n"

    Enum.reduce(supplies, initial_text, fn supply, text -> text <> supply_string(supply) end)
  end

  defp supply_string(%Supply{
         description: description,
         expiration_date: expiration_date,
         responsible: responsible
       }) do
    "Description: #{description}, Expiration Date: #{expiration_date}, Responsible: #{responsible}\n"
  end
end
