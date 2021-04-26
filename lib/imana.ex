defmodule Imana do
  alias Imana.Restaurants.Create, as: RestaurantCreate
  alias Imana.Supplies.Create, as: SupplyCreate
  alias Imana.Supplies.Get, as: SupplyGet

  defdelegate create_restaurant(params), to: RestaurantCreate, as: :call
  defdelegate create_supply(params), to: SupplyCreate, as: :call
  defdelegate get_supply(params), to: SupplyGet, as: :call
end
