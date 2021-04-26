defmodule Imana.Welcomer do
  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)
    name |> String.trim() |> String.downcase() |> evaluate(age)
  end

  defp evaluate("banana", 42) do
    {:ok, "You are very special"}
  end

  defp evaluate(nome, idade) when idade >= 18 do
    {:ok, "#{nome}, You aren't special"}
  end

  defp evaluate(nome, _idade) do
    {:error, "#{nome}, you shall not pass"}
  end
end
