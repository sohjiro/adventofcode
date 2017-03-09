defmodule Adventofcode.Seventeen.Day01 do
  @initial_point {0, 0}

  def calculate_blocks(instructions) do
    instructions
    |> calculate_coordinates
    |> taxicab
  end

  def calculate_coordinates(instructions) do
    instructions
    |> String.split(", ")
    |> Enum.map(&convert_into_coordinate/1)
    |> calculate_final_coordinate
  end

  def convert_into_coordinate(direction) do
    direction
    |> to_charlist
    |> map_direction
  end

  defp map_direction([?R | blocks]), do: {to_int(blocks), 0}
  defp map_direction([?L | blocks]), do: {0, to_int(blocks)}
  defp to_int(char), do: char |> to_string |> String.to_integer

  defp calculate_final_coordinate(coordinates) do
    Enum.reduce(coordinates, {0, 0}, fn({x, y}, acc) ->
      case acc do
        @initial_point -> {x, y}
        {new_x, new_y} -> {x + new_x, y + new_y}
      end
    end)
  end

  defp taxicab({q1, q2}) do
    {p1, p2} = @initial_point
    abs(p1 - q1) + abs(p2 - q2)
  end

end
