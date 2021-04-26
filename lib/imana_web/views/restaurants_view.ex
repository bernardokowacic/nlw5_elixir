defmodule ImanaWeb.RestaurantsView do
  use ImanaWeb, :view

  def render("create.json", %{restaurant: restaurant}) do
    %{
      message: "Restaurant created",
      restaurant: restaurant
    }
  end
end
