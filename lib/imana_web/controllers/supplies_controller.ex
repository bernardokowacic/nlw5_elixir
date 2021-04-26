defmodule ImanaWeb.SuppliesController do
  use ImanaWeb, :controller

  alias Imana.Supply

  action_fallback ImanaWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Supply{} = supply} <- Imana.create_supply(params) do
      conn
      |> put_status(:created)
      |> render("create.json", supply: supply)
    end
  end

  def show(conn, %{"id" => uuid}) do
    with {:ok, %Supply{} = supply} <- Imana.get_supply(uuid) do
      conn
      |> put_status(:ok)
      |> render("show.json", supply: supply)
    end
  end
end
