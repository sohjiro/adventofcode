defmodule Adventofcode.Seventeen.Day01 do
  @initial_point {0, 0}

  def calculate_distance_with_interception(instructions) do
    instructions
    |> calculate_first_interception
    |> taxicab
  end

  def calculate_first_interception(instructions) do
    instructions
    |> trace_walk
    |> find_first_coincidence([])
  end

  defp find_first_coincidence([point | rest], acc) do
    case point in acc do
      false -> find_first_coincidence(rest, [point | acc])
      true -> point
    end
  end

  def trace_walk(instructions) do
    instructions
    |> trace_coordinates
  end

  def trace_coordinates(instructions) do
    instructions
    |> String.split(", ")
    |> Enum.map(&parse_string/1)
    |> expand_walk_from(:north, [@initial_point])
  end

  defp expand_walk_from([], _view, acc), do: acc
  defp expand_walk_from([{direction, blocks} | rest], view, [{x, y} | _next] = acc) do
    {to, x1, y1} = calculate_direction(direction, view)
    {new_x, new_y} = {x + (blocks * x1), y + (blocks * y1)}
    missing_points = generate_middle_points(x..new_x, y..new_y, {x, y}) |> Enum.reverse
    expand_walk_from(rest, to, missing_points ++ acc)
  end

  defp generate_middle_points(x_points, y_points, points),
  do: for x <- x_points, y <- y_points, {x, y} != points, do: {x, y}

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
