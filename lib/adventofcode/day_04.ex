defmodule Adventofcode.Day04 do

  def find_number(data) do
    find_hash(data, 1)
  end

  defp md5(data) do
    :crypto.hash(:md5, data)
    |> Base.encode16
  end

  defp find_hash(data, number) do
    data <> to_string(number)
    |> md5
    |> validate(data, number)
  end

  defp validate("00000" <> rest, _data, number), do: {number, "00000#{rest}"}
  defp validate(_, data, number), do: find_hash(data, number + 1)

end
