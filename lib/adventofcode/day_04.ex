defmodule Adventofcode.Day04 do

  def hash_with_six_zeros(data, number \\ 1) do
    data <> to_string(number)
    |> md5
    |> validate_six(data, number)
  end

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

  defp validate_six("000000" <> rest, _data, number), do: {number, "000000#{rest}"}
  defp validate_six(_, data, number), do: hash_with_six_zeros(data, number + 1)

end
