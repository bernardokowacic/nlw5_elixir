defmodule Imana.WelcomerTest do
  use ExUnit.Case, async: true

  alias Imana.Welcomer

  describe "welcome/1" do
    test "when the user is special, returns a special message" do
      params = %{"name" => "arroz", "age" => "42"}
      expected_result = {:ok, "arroz, You aren't special"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is not special, returns a message" do
      params = %{"name" => "bernardo", "age" => "25"}
      expected_result = {:ok, "bernardo, You aren't special"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is under age, returns error" do
      params = %{"name" => "jovem", "age" => "12"}
      expected_result = {:error, "jovem, you shall not pass"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end
  end
end
