defmodule Adventofcode.Seventeen.Day01 do
  @initial_point {0, 0}

  def complete_coordinates(instructions) do
    instructions
    |> expand_coordinates
  end

  def expand_coordinates(instructions) do
    instructions
    |> String.split(", ")
    |> Enum.map(&parse_string/1)
    |> expand_walk_from(:north, [@initial_point])
  end

  defp expand_walk_from([], _view, acc), do: acc
  defp expand_walk_from([{direction, blocks} | rest], view, [{x, y} | _next] = acc) do
    {to, x1, y1} = calculate_direction(direction, view)
    {x1, y1} = {x + (blocks * x1), y + (blocks * y1)}

    points = for point <- x1..x, point != 0, do: {point, y1}

    walk_from(rest, to, points ++ acc)
  end

  ###### DAY 01 PT 1 ######
  def calculate_blocks(instructions) do
    instructions
    |> calculate_coordinates
    |> calculate_final_coordinate
    |> taxicab
  end

  def calculate_coordinates(instructions) do
    instructions
    |> String.split(", ")
    |> Enum.map(&parse_string/1)
    |> walk_from(:north, [@initial_point])
  end

  defp calculate_direction(direction, view) do
    cond do
      {direction, view} in [{?R, :north}, {?L, :south}] -> {:east, 1, 0}
      {direction, view} in [{?R, :south}, {?L, :north}] -> {:west, -1, 0}
      {direction, view} in [{?R, :east}, {?L, :west}] -> {:south, 0, -1}
      {direction, view} in [{?R, :west}, {?L, :east}] -> {:north, 0, 1}
      true -> {:error}
    end
  end

  defp walk_from([], _view, acc), do: acc
  defp walk_from([{direction, blocks} | rest], view, [{x, y} | _next] = acc) do
    {to, x1, y1} = calculate_direction(direction, view)
    {x, y} = {x + (blocks * x1), y + (blocks * y1)}
    walk_from(rest, to, [{x, y} | acc])
  end

  defp parse_string(data), do: data |> to_charlist |> parse_charlist
  defp parse_charlist([direction | blocks]), do: {direction, to_int(blocks)}
  defp to_int(char), do: char |> to_string |> String.to_integer
  def calculate_final_coordinate(coordinates), do: coordinates |> hd

  defp taxicab({q1, q2}) do
    {p1, p2} = @initial_point
    abs(p1 - q1) + abs(p2 - q2)
  end
end
