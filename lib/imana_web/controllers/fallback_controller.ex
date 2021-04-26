defmodule ImanaWeb.FallbackController do
  use ImanaWeb, :controller

  def call(conn, {:error, %{result: result, status: status}}) do
    conn
    |> put_status(status)
    |> put_view(ImanaWeb.ErrorView)
    |> render("error.json", result: result)
  end
end
