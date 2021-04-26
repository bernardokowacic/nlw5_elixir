defmodule ImanaWeb.RestaurantsController do
  use ImanaWeb, :controller

  alias Imana.Restaurant
  alias ImanaWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- Imana.create_restaurant(params) do
      conn
      |> put_status(:created)
      |> render("create.json", restaurant: restaurant)
    end
  end
end
