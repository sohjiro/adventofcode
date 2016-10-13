defmodule Adventofcode.Day04 do

  def find_number(data, number \\ 1) do
    data <> to_string(number)
    |> md5
    |> validate(data, number)
  end

  defp md5(data) do
    :crypto.hash(:md5, data)
    |> Base.encode16
  end

  defp validate("00000" <> rest, _data, number), do: {number, "00000#{rest}"}
  defp validate(_, data, number), do: find_number(data, number + 1)

end
