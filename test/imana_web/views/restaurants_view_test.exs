defmodule ImanaWeb.RestaurantsViewTest do
  use ImanaWeb.ConnCase, async: true

  import Phoenix.View

  alias Imana.Restaurant
  alias ImanaWeb.RestaurantsView

  describe "render/2" do
    test "renders create.json" do
      params = %{name: "Siri cascudo", email: "siri@cascudo.com"}
      {:ok, restaurant} = Imana.create_restaurant(params)

      response = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
               message: "Restaurant created",
               restaurant: %Imana.Restaurant{
                 email: "siri@cascudo.com",
                 id: _id,
                 name: "Siri cascudo"
               }
             } = response
    end
  end
end
