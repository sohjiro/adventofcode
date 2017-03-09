defmodule Adventofcode.Seventeen.Day01 do

  def convert_into_coordinate(direction) do
    direction
    |> to_charlist
    |> map_direction
  end

  defp map_direction([?R | blocks]), do: {to_int(blocks), 0}
  defp map_direction([?L | blocks]), do: {0, to_int(blocks)}

  defp to_int(char), do: char |> to_string |> String.to_integer

end
