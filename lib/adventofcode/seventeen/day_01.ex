defmodule Adventofcode.Seventeen.Day01 do
  @initial_point {0, 0}

  def calculate_blocks(instructions) do
    instructions
    |> calculate_coordinates
    |> calculate_final_coordinate
    |> taxicab
  end

  def calculate_final_coordinate(coordinates), do: coordinates |> hd

  def calculate_coordinates(instructions) do
    instructions
    |> String.split(", ")
    |> Enum.map(&parse_string/1)
    |> walk_from(:north, [@initial_point])
  end

  defp calculate_direction(direction, view) do
    cond do
      {direction, view} in [{?R, :north}, {?L, :south}] -> :east
      {direction, view} in [{?R, :south}, {?L, :north}] -> :west
      {direction, view} in [{?R, :east}, {?L, :west}] -> :south
      {direction, view} in [{?R, :west}, {?L, :east}] -> :north
      true -> {:error}
    end
  end

  defp walk_from([], _view, acc), do: acc
  defp walk_from([{direction, blocks} | rest], view, [{x, y} | _next] = acc) do
    case calculate_direction(direction, view) do
      :east -> walk_from(rest, :east, [{x + blocks, y} | acc])
      :west -> walk_from(rest, :west, [{x - blocks, y} | acc])
      :south -> walk_from(rest, :south, [{x, y - blocks} | acc])
      :north -> walk_from(rest, :north, [{x, y + blocks} | acc])
    end
  end

  defp parse_string(data), do: data |> to_charlist |> parse_charlist
  defp parse_charlist([direction | blocks]), do: {direction, to_int(blocks)}
  defp to_int(char), do: char |> to_string |> String.to_integer

  defp taxicab({q1, q2}) do
    {p1, p2} = @initial_point
    abs(p1 - q1) + abs(p2 - q2)
  end

end
