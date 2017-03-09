defmodule Adventofcode.Seventeen.Day01 do
  @initial_point {0, 0}

  def calculate_blocks(instructions) do
    instructions
    |> calculate_coordinates
    |> calculate_final_coordinate
    |> taxicab
  end

  def calculate_final_coordinate(coordinates), do: coordinates |> Enum.reverse |> hd

  def calculate_coordinates(instructions) do
    instructions
    |> String.split(", ")
    |> Enum.map(&to_charlist/1)
    |> convert_into_coordinates
  end

  defp convert_into_coordinates(coordinates) do
    coordinates
    |> walk_on(:x, [@initial_point])
  end

  defp walk_on([], _axis, acc), do: acc |> Enum.reverse

  defp walk_on([[?R | blocks] | rest], :x, [{0, y} | _next] = acc) do
    walk_on(rest, :y, [{0 + to_int(blocks), y} | acc])
  end

  defp walk_on([[?R | blocks] | rest], :x, [{x, y} | _next] = acc) when x > 0 do
    walk_on(rest, :y, [{x - to_int(blocks), y} | acc])
  end

  defp walk_on([[?L | blocks] | rest], :x, [{x, y} | _next] = acc) do
    walk_on(rest, :y, [{x - to_int(blocks), y} | acc])
  end

  defp walk_on([[?R | blocks] | rest], :y, [{x, y} | _next] = acc) do
    walk_on(rest, :x, [{x, y - to_int(blocks)} | acc])
  end

  defp walk_on([[?L | blocks] | rest], :y, [{x, y} | _next] = acc) do
    walk_on(rest, :x, [{x, y + to_int(blocks)} | acc])
  end

  def convert_into_coordinate(direction) do
    direction
    |> to_charlist
    |> map_direction
  end

  defp map_direction([?R | blocks]), do: {to_int((blocks)), 0}
  defp map_direction([?L | blocks]), do: {0, to_int(blocks)}
  defp to_int(char), do: char |> to_string |> String.to_integer


  defp taxicab({q1, q2}) do
    {p1, p2} = @initial_point
    abs(p1 - q1) + abs(p2 - q2)
  end

end
